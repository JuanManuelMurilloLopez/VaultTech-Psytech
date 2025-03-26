module.exports = (allowedRoles = []) => {
    return (request, response, next) => {
        // Checa si la sesion tiene un usuario
        if (!request.session.user) {
            return response.redirect('/login');
        }

        // Se tiene el idRol
        const idRol = request.session.idRol;

        // Checa si el rol del usuario esta permitido
        if (!allowedRoles.includes(idRol)) {
            return response.send(`
                <script>
                    alert('Acceso denegado: No tienes permisos para acceder a esta página.');
                    window.location.href = '/login';
                </script>
            `);
        }

        next(); 
    };
};
