//Rutas de registros de Psicologos y Coordinadores
exports.get_psicologos_registrados = (request, response, next) => {
    response.send('Psicologos Registrados');
};

exports.get_registrar_psicologos = (request, response, next) => {
    response.send('Registrar Nuevos Psicologos');
};

exports.get_editar_psicologos = (request, response, next) => {
    response.send('Editar Psicologos');
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