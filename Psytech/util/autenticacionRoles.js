module.exports = (allowedRoles = []) => {
    return (request, response, next) => {
        if (!request.session.user) {
            return response.redirect('/login');
        }

        const { idRol } = request.session.rol;

        if (!allowedRoles.length > 0 && !allowedRoles.includes(idRol)) {
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
