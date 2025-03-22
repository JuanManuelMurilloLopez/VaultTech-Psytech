const bcrypt = require('bcryptjs');
const Usuario = require('../models/inicioSesion.models');

exports.getLogin = (request, response, next) => {
    console.log('Login PSICODX');
    response.render('login');
};

exports.getPost = async (request, response) => {
    const { usuario, contrasenia } = request.body;

    try {
        // Buscar usuario en la base de datos
        const [usuarios] = await Usuario.recuperarUno(usuario);
        
        // Verificar si se recuperó el usuario
        if (!usuarios) {
            console.log('Usuario no encontrado en la base de datos.');
            return response.status(400).send('Usuario no encontrado');
        }

        // Comparar los valores de usuario
        const usuarioRecibido = usuario.trim().toLowerCase();
        const usuarioBaseDatos = usuarios.usuario.trim().toLowerCase();

        if (usuarioRecibido !== usuarioBaseDatos) {
            console.log('No coinciden los usuarios');
            return response.status(400).send('Usuario no encontrado');
        }

        // Verificar que la contraseña recibida y la almacenada en la base de datos existan
        if (!contrasenia || !usuarios.contrasenia) {
            console.log('Error: Contraseña no proporcionada o no encontrada.');
            return response.status(400).send('Contraseña no válida');
        }

        // Comparar contraseñas
        if (contrasenia !== usuarios.contrasenia) { 
            return response.status(400).send('Contraseña incorrecta');
        }

        // Guardar la sesión del usuario
        request.session.user = usuarios;

        // Redirigir según el rol
        switch (usuarios.idRol) {  
            case 3:
                return response.redirect('/aspirante/mis-pruebas');
            case 1:
                return response.redirect('/coordinador/psicologos-registrados');
            case 2:
                return response.redirect('/psicologo/principal');
            default:
                console.log('Error: Rol desconocido:', usuarios.idRol);
                return response.status(400).send('Rol no válido');
        }
    } catch (error) {
        console.error('Error en el servidor:', error);
        response.status(500).send('Error en el servidor');
    }
};
