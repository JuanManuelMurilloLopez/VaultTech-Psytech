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
        
        // Checa si se recupero el usuario
        if (!usuarios) {
            return response.send(`
                <script>
                    alert('Usuario no encontrado');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Checa que la contraseña recibida y la almacenada en la base de datos existan
        if (!contrasenia || !usuarios.contrasenia){
            return response.send(`
                <script>
                    alert('Contraseña no válida');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Comparar contraseñas
        // const contraseniaValida = await bcrypt.compare(contrasenia, usuarios.contrasenia);
        const contraseniaValida = true;
        if (!contraseniaValida) { 
            return response.send(`
                <script>
                    alert('Contraseña incorrecta');
                    window.location.href = '/login';
                </script>
            `);
        }

        // Guardar la sesion del usuario
        request.session.user = usuarios; // Guarda objeto usuarios
        request.session.idRol = usuarios.idRol; // Guarda idRol
        console.log("Usuario guardado en sesión:", request.session.user);


        // Redirigir segun el rol
        switch (usuarios.idRol) {  
            case 3:
                Usuario.getIdAspirante(request.session.user.idUsuario)  // Accede a idUsuario desde la sesion
                .then(([rows, fieldData]) => {
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
        
        response.redirect('/login');
    });
});
