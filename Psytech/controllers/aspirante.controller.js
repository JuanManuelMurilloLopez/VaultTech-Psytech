//Rutas del portal de los Aspirantes
exports.get_mis_pruebas = (request, response, next) => {
    response.render('Aspirantes/misPruebas');
};

exports.get_pruebas_pendientes = (request, response, next) => {
    response.render('Aspirantes/pruebasPendientes');
};

exports.get_pruebas_completadas = (request, response, next) => {
    response.render('Aspirantes/pruebasCompletadas');
};

exports.get_subir_documentos = (request, response, next) => {
    response.render('Aspirantes/subirDocumentos');
};

exports.get_formato_entrevista = (request, response, next) => {
    response.render('Aspirantes/formatoDeEntrevista');
};

exports.get_intrucciones_otis = (request, response, next) => {
    response.render('Aspirantes/instruccionesOtis');
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