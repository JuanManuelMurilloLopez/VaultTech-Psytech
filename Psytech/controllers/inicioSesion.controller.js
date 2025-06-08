const Usuario = require('../models/usuario.model');
const { OTP } = require('../models/otp.model');
const crypto = require('crypto');
const { Resend } = require('resend');

const resend = new Resend(process.env.RESEND_API_KEY);

exports.getLogin = (request, response, next) => {
    const email = request.query.email || '';
    response.render('login', { email });
};

exports.getOtp = (request, response, next) => {
    const usuario = request.session.usuario;
    response.render('otp', { usuario });
};

exports.getPost = async (request, response) => {
    let { usuario } = request.body;

    usuario = usuario.trim();

    try {
        const usuarioData = await Usuario.fetchOne(usuario);
        const usuarioId = usuarioData[0];

        if (!usuarioId) {
            return response.send('<script>alert("Usuario no encontrado"); window.location.href = "/login";</script>');
        }

        //Validar el estatusUsuario
        if (usuarioId.estatusUsuario !== 1) {
            return response.send('<script>alert("Usuario inactivo, comunícate con soporte."); window.location.href = "/login";</script>');
        }

        const codigoOTP = crypto.randomInt(100000, 999999);
        const validez = new Date(Date.now() + 5 * 60000);

        await OTP.crearOTP(usuarioId.idUsuario, codigoOTP, validez);

        request.session.usuario = usuario;

        if (process.env.NODE_ENV !== 'develop') {
            await resend.emails.send({
                from: 'psytech@pruebas.psicodx.com',
                to: [usuarioId.correo],
                subject: 'Tu código de acceso',
                html: `<h2>¡Hola ${usuario}!</h2><p>Tu código de acceso es: <strong>${codigoOTP}</strong></p><p>Este código es válido por 5 minutos. Unicamente se puede usar una sola vez.</p>`
            });
        }
        response.redirect('/otp');
    } catch (error) {
        console.error('Error en postLogin:', error);
        response.send('<script>alert("Error al generar o enviar el código de acceso"); window.location.href = "/login";</script>');
    }
};

exports.verificarOTP = async (request, response) => {
    const { otp } = request.body;
    const usuario = request.session.usuario;

    try {
        const usuarioData = await Usuario.fetchOne(usuario);
        const usuarioId = usuarioData[0].idUsuario;
        if (!usuarioId) {
            return res.send('<script>alert("Usuario no encontrado"); window.location.href = "/login";</script>');
        }

        if (usuarioId.estatusUsuario === 0) {
            return response.send('<script>alert("Tu cuenta está desactivada. Contacta al administrador."); window.location.href = "/login";</script>');
        }

        const otpData = await OTP.obtenerOTP(usuarioId);

        if ((!otpData || otpData.codigo !== parseInt(otp)) && !process.env.NODE_ENV === 'develop') {
            return response.send('<script>alert("Código de acceso incorrecto o vencido"); window.location.href = "/otp";</script>');
        }

        await OTP.usarOTP(otpData?.idOTP);

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
                return response.redirect('/psicologo/lista-grupos');
            default:
                return response.status(400).send("Rol no reconocido");
        }

    } catch (error) {
        console.error('Error al verificar código de acceso:', error);
        response.send('<script>alert("Error al verificar código de acceso"); window.location.href = "/otp";</script>');
    }
};

exports.reenviarOtp = async (request, response) => {
    const usuario = request.session.usuario;

    if (!usuario) {
        return response.redirect('/login');
    }

    try {
        const usuarioData = await Usuario.fetchOne(usuario);
        const usuarioId = usuarioData[0];

        if (!usuarioId || usuarioId.estatusUsuario !== 1) {
            return response.send('<script>alert("Usuario no válido o inactivo"); window.location.href = "/login";</script>');
        }

        const codigoOTP = crypto.randomInt(100000, 999999);
        const validez = new Date(Date.now() + 5 * 60000);

        await OTP.crearOTP(usuarioId.idUsuario, codigoOTP, validez);

        if (process.env.NODE_ENV !== 'develop') {
            await resend.emails.send({
                from: 'psytech@pruebas.psicodx.com',
                to: [usuarioId.correo],
                subject: 'Tu nuevo código de acceso',
                html: `<h2>¡Hola ${usuario}!</h2><p>Tu nuevo código de acceso es: <strong>${codigoOTP}</strong></p><p>Este código es válido por 5 minutos.</p>`
            });
        }

        return response.send('<script>alert("Nuevo código enviado a tu correo."); window.location.href = "/otp";</script>');

    } catch (error) {
        return response.send('<script>alert("Error al reenviar el código de acceso"); window.location.href = "/otp";</script>');
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

exports.getInicio = ((request, response) => {
    response.redirect('/login');
})