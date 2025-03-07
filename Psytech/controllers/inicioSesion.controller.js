//Rutas para el inicio de sesión
exports.get_login = (request, response, next) => {
    console.log('Login PSICODX');
    response.render('login');
};