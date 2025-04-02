const bcrypt = require('bcryptjs');
const Usuario = require('../models/usuario.model');
const { OTP } = require('../models/otp.model');
const crypto = require('crypto');
const mail = require('../util/mailer');

exports.getLogin = (request, response, next) => {
    response.render('login');
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

        //await mail.enviarCorreo(usuarioId.correo, 'Código de acceso', `Tu código OTP es: ${codigoOTP}`);
        console.log('Usuario id:', usuarioId);
        console.log('codigoOTP:', codigoOTP);
        console.log('validez:', validez);
        response.redirect('/otp');
    } catch (error) {
        console.error('Error en postLogin:', error);
        response.send('<script>alert("Error al generar OTP"); window.location.href = "/login";</script>');
    }
};

exports.verificarOTP = async (req, res) => {
    const { usuario, otp } = req.body;
    
    try {
      const usuarioData = await Usuario.fetchOne(usuario);
      const otpData = await OTP.obtenerOTP(usuarioData.idUsuario);
  
      if (!otpData || otpData.codigo !== parseInt(otp)) {
        return res.send('<script>alert("OTP incorrecto o vencido"); window.location.href = "/otp";</script>');
      }
  
      await OTP.usarOTP(otpData.idOTP);
      req.session.user = usuarioData.idUsuario;
      req.session.rol = usuarioData.rol;
      res.redirect('/dashboard');
    } catch (error) {
      console.error('Error al verificar OTP:', error);
      res.send('<script>alert("Error al verificar OTP"); window.location.href = "/otp";</script>');
    }
  };

exports.getLogout = ((request, response) => {
    request.session.destroy((err) => {
        if (err) {
            return response.status(500).send('Error al cerrar sesión');
        }
        // Después de destruir la sesión, redirige al login
        response.redirect('/login');
    });
});