//Rutas para el inicio de sesión
exports.getLogin = (request, response, next) => {
    console.log('Login PSICODX');
    response.render('login');
};