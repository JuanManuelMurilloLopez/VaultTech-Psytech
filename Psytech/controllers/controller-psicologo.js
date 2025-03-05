//Rutas del portal de los Psicologos
exports.get_principal_psicologos = (request, response, next) => {
    response.send('Pagina Principal Psicologos');
};

exports.get_catalogo_instituciones = (request, response, next) => {
    response.send('Catalogo de Instituciones');
};

exports.get_registrar_institucion = (request, response, next) => {
    response.send('Registrar Instituciones');
};

exports.get_editar_institucion = (request, response, next) => {
    response.send('Editar Instituciones');
};

exports.get_grupos = (request, response, next) => {
    response.send('Grupos por Institucion');
};

exports.get_registrar_grupo = (request, response, next) => {
    response.send('Registrar Nuevo Grupo');
};

exports.get_editar_grupo = (request, response, next) => {
    response.send('Editar Grupo');
};

exports.get_aspirantes = (request, response, next) => {
    response.send('Aspirantes por Grupos');
};

exports.get_importar_aspirantes = (request, response, next) => {
    response.send('Importar Aspirantes');
};

exports.get_registrar_aspirantes = (request, response, next) => {
    response.send('Registrar Aspirantes');
};

exports.get_editar_aspirantes = (request, response, next) => {
    response.send('Editar Aspirantes');
};

exports.get_prueba_otis = (request, response, next) => {
    response.send('Prueba Otis');
};

exports.get_prueba_colores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.get_analisis_otis = (request, response, next) => {
    response.send('Analisis Otis');
};

exports.get_analisis_colores = (request, response, next) => {
    response.send('Analisis Colores');
};

exports.get_catalogo_pruebas = (request, response, next) => {
    response.send('Catalogo de pruebas');
};
