//Rutas de registros de Psicologos y Coordinadores
exports.getPsicologosRegistrados = (request, response, next) => {
    response.render('Coordinadores/listaPsicologos');
};

exports.getRegistrarPsicologos = (request, response, next) => {
    response.render('Coordinadores/registrarPsicologo');
};

exports.getEditarPsicologos = (request, response, next) => {
    response.render('Coordinadores/editarPsicologo');
};

exports.getCoordinadoresRegistrados = (request, response, next) => {
    response.render('Coordinadores/listaCoordinadores');
};

exports.getRegistrarCoordinador = (request, response, next) => {
    response.render('Coordinadores/registrarCoordinador');
};

exports.getEditarCoordinador = (request, response, next) => {
    response.render('Coordinadores/editarCoordinador');
};