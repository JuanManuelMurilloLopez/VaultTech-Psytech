const bcrypt = require('bcryptjs');
const usuarioModelo = require('../models/inicioSesion.models'); 

// Rutas para el inicio de sesión
exports.get_login = (request, response) => {
    console.log('Login PSICODX');
    response.render('login');
};

exports.post_login = async (request, response) => {
    const { usuario, contrasenia } = request.body;

    try {
        const usuarioTexto = await usuarioModelo.findOne({ usuario });

        if (!usuarioTexto) {
            return response.status(400).send('Usuario no encontrado');
        }

        // Comparar la contraseña con bcrypt
        const isMatch = await bcrypt.compare(contrasenia, usuarioTexto.contrasenia);

        if (!isMatch) {
            return response.status(400).send('Contraseña incorrecta');
        }

        // Guardar la sesión del usuario
        request.session.user = usuarioTexto;

        // Redirigir al dashboard basado en el rol
        if (usuarioTexto.rol === 'coordinador') {
            return response.redirect('/coordinador/psicologos-registrados');
        } else if (usuarioTexto.rol === 'aspirante') {
            return response.redirect('/aspirante/mis-pruebas');
        } else if (usuarioTexto.rol === 'psicologo') {
            return response.redirect('/psicologo/principal');
        }
    } catch (error) {
        response.status(500).send('Error en el servidor');
    }
};
