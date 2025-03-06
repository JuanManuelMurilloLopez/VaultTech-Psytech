//Rutas de registros de Psicologos y Coordinadores
exports.get_psicologos_registrados = (request, response, next) => {
    response.render('Coordinadores/listaPsicologos');
};

exports.get_registrar_psicologos = (request, response, next) => {
    response.render('Coordinadores/registrarPsicologo');
};

exports.get_editar_psicologos = (request, response, next) => {
    response.render('Coordinadores/editarPsicologo');
};

exports.get_coordinadores_registrados = (request, response, next) => {
    response.send('Coordinadores Registrados');
};

exports.get_registrar_coordinador = (request, response, next) => {
    response.send('Registrar Nuevos Coordinadores');
};

exports.get_editar_coordinador = (request, response, next) => {
    response.send('Editar Coordinadores');
};