const bcrypt = require('bcryptjs');
const Usuario = require('../models/usuario.model');
const { OTP } = require('../models/otp.model');
const crypto = require('crypto');

exports.getLogin = (request, response, next) => {
    response.render('login');
};

exports.getOtp = (request, response, next) => {
    const usuario = request.session.usuario;
    response.render('otp', { usuario });
};

exports.getPost = async (request, response) => {
    const {usuario} = request.body;

    /* Verificar si el checkbox está marcado
    if (!terminos) {
        return response.send(`
            <script>
                alert('Debes aceptar los Términos y Condiciones para continuar.');
                window.location.href = '/login';
            </script>
        `);
    }
    */

    try {
        const usuarioData  = await Usuario.fetchOne(usuario);
        const usuarioId = usuarioData[0]; 

        if (!usuarioId) {
            return response.send('<script>alert("Usuario no encontrado"); window.location.href = "/login";</script>');
        }

        const codigoOTP = crypto.randomInt(100000, 999999);
        const validez = new Date(Date.now() + 5 * 60000);

        await OTP.crearOTP(usuarioId.idUsuario, codigoOTP, validez);

        request.session.usuario = usuario;

        //await mail.enviarCorreo(usuarioId.correo, 'Código de acceso', `Tu código OTP es: ${codigoOTP}`);
        console.log('codigoOTP:', codigoOTP);
        response.redirect('/otp');
    } catch (error) {
        console.error('Error en postLogin:', error);
        response.send('<script>alert("Error al generar OTP"); window.location.href = "/login";</script>');
    }
};

exports.verificarOTP = async (request, response) => {
    const { otp } = request.body;
    const usuario = request.session.usuario;
    
    try {
        const usuarioData  = await Usuario.fetchOne(usuario);
        const usuarioId = usuarioData[0].idUsuario;
        if (!usuarioId) {
            return res.send('<script>alert("Usuario no encontrado"); window.location.href = "/login";</script>');
        }
        
        const otpData = await OTP.obtenerOTP(usuarioId);
  
      if (!otpData || otpData.codigo !== parseInt(otp)) {
        return response.send('<script>alert("OTP incorrecto o vencido"); window.location.href = "/otp";</script>');
      }
  
      await OTP.usarOTP(otpData.idOTP);
      
      request.session.user = usuarioData[0].idUsuario;
      request.session.rol = usuarioData[0].idRol;

        switch (usuarioData[0].idRol) {  
            case 3:
                Usuario.getIdAspirante(request.session.user)
                .then(([rows, fieldData]) => {
                    if (rows.length > 0) {
                        request.session.idAspirante = rows[0].idAspirante;
                        return response.redirect('/aspirante/mis-pruebas');
                    }
                })
                .catch((error) => {
                    console.log(error);
                    return response.status(500).send("Error en el servidor");
                })
                break;
            case 1:
                return response.redirect('/coordinador/psicologos-registrados');
            case 2:
                return response.redirect('/psicologo/lista-grupos');
            default:
                return response.status(400).send("Rol no reconocido");
        }

    } catch (error) {
      console.error('Error al verificar OTP:', error);
      response.send('<script>alert("Error al verificar OTP"); window.location.href = "/otp";</script>');
    }
  };

exports.getLogout = ((request, response) => {
    request.session.destroy((err) => {
        if (err) {
            return response.status(500).send('Error al cerrar sesión');
        }
        response.redirect('/login');
    });
});