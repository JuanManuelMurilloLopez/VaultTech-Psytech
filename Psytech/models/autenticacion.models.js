module.exports = (allowedRoles = []) => {
    return (request, response, next) => {
        if (!request.session.user) {
            return response.redirect('/login');
        }

        const { idRol } = request.session.user;

        if (allowedRoles.length > 0 && !allowedRoles.includes(idRol)) {
            return res.status(403).send('Acceso denegado: No tienes permisos para acceder a esta página');
        }
        next(); 
    };
};
