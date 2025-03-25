const Pais = require('../models/Pais');
const Estado = require('../models/Estado');
const Aspirante = require('../models/Aspirante');
const Institucion = require('../models/Institucion');
const Grupo = require('../models/Grupo');

//Rutas del portal de los Psicologos
exports.getPrincipalPsicologos = (request, response, next) => {
    console.log('Pagina Principal Psicologos');
    response.render('Psicologos/principal');
};

exports.getCatalogoInstituciones = (request, response, next) => {
    Institucion.fetchAll()
    .then(([rows, fieldData]) => {
        const arregloInstituciones = rows;
        response.render('Psicologos/catalogoInstituciones', {
            arregloInstituciones: arregloInstituciones || [],
        });
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.getRegistrarInstitucion = (request, response, next) => {
    console.log('Registrar Instituciones');
    response.render('Psicologos/registrarInstitucion');
};

exports.getEditarInstitucion = (request, response, next) => {
    console.log('Editar Instituciones');
    response.render('Psicologos/editarInstitucion');
};

exports.getGrupos = (request, response, next) => {
    Institucion.fetchOne(request.params.idInstitucion)
    .then(([informacionInstitucion, arregloGrupos]) => {
        console.log("Informacion de la Institución: ", informacionInstitucion);
        response.render('Psicologos/gruposInstitucion', {
            informacionInstitucion: informacionInstitucion || [],
            arregloGrupos: arregloGrupos || [],
        });
    })
    .catch();
    
};

exports.getInformacionGrupo = (request, response, next) => {
    Grupo.fetchOne(request.params.idGrupo)
    .then(([rows, fieldData]) => {
        const grupo = rows[0];
        Grupo.getAspirantes(request.params.idGrupo)
        .then(([rows, fieldData]) => {
            const aspirantes = rows;
            console.log("Información del grupo: ", grupo);
            console.log("Aspirantes del grupo :", aspirantes);
            response.render('Psicologos/informacionGrupo.ejs', {
                grupo: grupo || null,
                aspirantes: aspirantes || [],
            })
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
    

}

exports.getRegistrarGrupo = (request, response, next) => {
    console.log('Registrar Nuevo Grupo');
    response.render('Psicologos/registrarGrupo');
};

exports.getEditarGrupo = (request, response, next) => {
    console.log('Editar Grupo');
    response.render('Psicologos/editarGrupo');
};

exports.getAspirantes = (request, response, next) => {
    console.log('Aspirantes por Grupos');
    response.render('Psicologos/aspirantesGrupo');
};

exports.getImportarAspirantes = (request, response, next) => {
    console.log('Importar Aspirantes');
    response.render('Psicologos/importarAspirantes');
};

exports.getRegistrarAspirantes = (request, response, next) => {
    // console.log('Registrar Aspirante');
    Pais.fetchAll()
    .then(([rows, fieldData]) => {
        const paises = rows;
        Estado.fetchAll()
        .then(([rows, fieldData]) => {
            const estados = rows;
            
            response.render('Psicologos/registrarAspirante', {
                paises: paises || [],
                estados: estados || [],
            });
        })
        .catch((error) => {console.log(error)});
    })
    .catch((error) => {console.log(error)});

    
};

exports.postRegistrarAspirantes = (request, response, next) => {
    const aspirante = new Aspirante(request.body);
    aspirante.saveUsuario()
    .then(() => {
        aspirante.getIdUsuario()
        .then(([rows, fieldData]) => {
            const idUsuario = rows[0].idUsuario;
            aspirante.saveAspirante(idUsuario)
            .then(() => {
                response.render('Psicologos/aspirantesGrupo');
            })
            .catch((error) => {
                console.log(error);
            });
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
}

exports.getEditarAspirantes = (request, response, next) => {
    console.log('Editar Aspirante');
    response.render('Psicologos/editarAspirante');
};

exports.getCatalogoPruebas = (request, response, next) => {
    console.log('Catalogo pruebas');
    response.render('Psicologos/catalogoPruebas');
};

exports.getPruebaOtis = (request, response, next) => {
    console.log('Prueba OTIS');
    response.render('Psicologos/infoPruebaOtis');
};

exports.getPruebaColores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.getAnalisisOtis = (request, response, next) => {
    console.log('Analisis Otis');
    response.render('Psicologos/analisisOtis');
};

exports.getAnalisisColores = (request, response, next) => {
    response.send('Analisis Colores');
};

exports.getRespuestasOtis = (request, response, next) => {
    console.log('Respuestas Otis');
    response.render('Psicologos/respuestasOtis');
};