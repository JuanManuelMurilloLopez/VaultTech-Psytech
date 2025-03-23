const bcrypt = require('bcryptjs');
const Usuario = require('../models/inicioSesion.model');

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
            return response.send(`
                <script>
                    alert('Usuario no encontrado');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Comparar los valores de usuario
        const usuarioRecibido = usuario.trim().toLowerCase();
        const usuarioBaseDatos = usuarios.usuario.trim().toLowerCase();

        if (usuarioRecibido !== usuarioBaseDatos) {
            return response.send(`
                <script>
                    alert('Usuario no encontrado');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Verificar que la contraseña recibida y la almacenada en la base de datos existan
        if (!contrasenia || !usuarios.contrasenia){
            return response.send(`
                <script>
                    alert('Contraseña no válida');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Comparar contraseñas
        const contraseniaValida = await bcrypt.compare(contrasenia, usuarios.contrasenia);
        if (!contraseniaValida) { 
            return response.send(`
                <script>
                    alert('Contraseña incorrecta');
                    window.location.href = '/login';
                </script>
            `);
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
        }
    } catch (error) {
        return response.send(`
            <script>
                alert('Error en el servidor');
                window.location.href = '/login';
            </script>
        `);
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
