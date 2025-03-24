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
        request.session.user = usuarios.idUsuario;
        request.session.rol = usuarios.idRol;

        // Redirigir según el rol
        switch (usuarios.idRol) {  
            case 3:
                Usuario.getIdAspirante(request.session.user)
                .then(([rows,fieldData]) => {
                    request.session.idAspirante = rows[0].IdAspirante;
                    return response.redirect('/aspirante/mis-pruebas');
                })
                .catch((error) => {
                    console.log(error);
                })
                break
            case 1:
                return response.redirect('/coordinador/psicologos-registrados');
            case 2:
                return response.redirect('/psicologo/principal');
            default:
                return response.status(400).send("Rol no reconocido");
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
