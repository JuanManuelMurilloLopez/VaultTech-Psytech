//Rutas del portal de los Aspirantes
exports.get_mis_pruebas = (request, response, next) => {
    response.send('Mis Pruebas');
};

exports.get_pruebas_pendientes = (request, response, next) => {
    response.send('Pruebas Pendientes');
};

exports.get_pruebas_completadas = (request, response, next) => {
    response.send('Pruebas Completadas');
};

exports.get_subir_documentos = (request, response, next) => {
    response.send('Subir Documentos');
};

exports.get_formato_entrevista = (request, response, next) => {
    response.send('Formato de Entrevista');
};

exports.get_intrucciones_otis = (request, response, next) => {
    response.send('Instrucciones de la Prueba Otis');
};

exports.get_intrucciones_colores = (request, response, next) => {
    response.send('Instrucciones de la Prueba Colores');
};

exports.get_prueba_otis = (request, response, next) => {
    response.send('Prueba Otis');
};

exports.get_prueba_colores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.get_respuestas_enviadas = (request, response, next) => {
    response.send('Respuestas enviadas');
};