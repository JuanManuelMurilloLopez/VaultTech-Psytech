//Rutas del portal de los Psicologos
exports.get_principal_psicologos = (request, response, next) => {
    console.log('Pagina Principal Psicologos');
    response.render('Psicologos/principal');
};

exports.get_catalogo_instituciones = (request, response, next) => {
    console.log('Catalogo de Instituciones');
    response.render('Psicologos/catalogoInstituciones');
};

exports.get_registrar_institucion = (request, response, next) => {
    console.log('Registrar Instituciones');
    response.render('Psicologos/registrarInstitucion');
};

exports.get_editar_institucion = (request, response, next) => {
    console.log('Editar Instituciones');
    response.render('Psicologos/editarInstitucion');
};

exports.get_grupos = (request, response, next) => {
    console.log('Grupos por Institucion');
    response.render('Psicologos/gruposInstitucion');
};

exports.get_registrar_grupo = (request, response, next) => {
    console.log('Registrar Nuevo Grupo');
    response.render('Psicologos/registrarGrupo');
};

exports.get_editar_grupo = (request, response, next) => {
    console.log('Editar Grupo');
    response.render('Psicologos/editarGrupo');
};

exports.get_aspirantes = (request, response, next) => {
    console.log('Aspirantes por Grupos');
    response.render('Psicologos/aspirantesGrupo');
};

exports.get_importar_aspirantes = (request, response, next) => {
    console.log('Importar Aspirantes');
    response.render('Psicologos/importarAspirantes');
};

exports.get_registrar_aspirantes = (request, response, next) => {
    console.log('Registrar Aspirante');
    response.render('Psicologos/registrarAspirante');
};

exports.get_editar_aspirantes = (request, response, next) => {
    console.log('Editar Aspirante');
    response.render('Psicologos/editarAspirante');
};

exports.get_catalogo_pruebas = (request, response, next) => {
    console.log('Catalogo pruebas');
    response.render('Psicologos/catalogoPruebas');
};

exports.get_prueba_otis = (request, response, next) => {
    console.log('Prueba OTIS');
    response.render('Psicologos/infoPruebaOtis');
};

exports.get_prueba_colores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.get_analisis_otis = (request, response, next) => {
    console.log('Analisis Otis');
    response.render('Psicologos/analisisOtis');
};

exports.get_analisis_colores = (request, response, next) => {
    response.send('Analisis Colores');
};

exports.get_respuestas_otis = (request, response, next) => {
    console.log('Respuestas Otis');
    response.render('Psicologos/respuestasOtis');
};
