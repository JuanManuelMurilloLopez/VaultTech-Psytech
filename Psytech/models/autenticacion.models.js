module.exports = (allowedRoles = []) => {
    return (req, res, next) => {
        if (!req.session.user) {
            return res.redirect('/login'); // Si no está autenticado, redirigir al login
        }

        const { idRol } = req.session.user; // Obtener el rol del usuario desde la sesión

        if (allowedRoles.length > 0 && !allowedRoles.includes(idRol)) {
            return res.status(403).send('Acceso denegado: No tienes permisos para acceder a esta página');
        }

        next(); // Si pasa todas las comprobaciones, continuar
    };
};
