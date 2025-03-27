

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
        response.render('Psicologos/gruposInstitucion', {
            informacionInstitucion: informacionInstitucion || [],
            arregloGrupos: arregloGrupos || [],
            idInstitucion: request.params.idInstitucion,
        });
    })
    .catch();
    
};


// Registrar Nuevo Grupo
// Get
exports.getRegistrarGrupo = (req, res, next) => {
    Promise.all([
      Grupo.obtenerInstituciones(),
      Grupo.obtenerNiveles(),
      Grupo.obtenerPruebas()
    ])
      .then(([instituciones, niveles, pruebas]) => {
        res.render('Psicologos/registrarGrupo.ejs', {
          listadoInstituciones: instituciones[0],
          listadoNiveles: niveles[0],
          listadoPruebas: pruebas[0],
          error: '',
          idInstitucion: req.params.idInstitucion,
        });
      })
      .catch(err => {
        console.log(err);
        res.send('Error al cargar formulario');
      });
  };

// Post
  exports.postRegistrarGrupo = (req, res, next) => {
    console.log("Request Body", req.body);
    const {
      nombreGrupo,
      carrera,
      semestre,
      anio,
      idNivelAcademico,
      pruebasSeleccionadas,
      fechaLimite
    } = req.body;
  
    Grupo.existe(nombreGrupo)
      .then(([rows]) => {
        if (rows.length > 0) {
          return Promise.all([
            Grupo.obtenerInstituciones(),
            Grupo.obtenerNiveles(),
            Grupo.obtenerPruebas()
          ]).then(([instituciones, niveles, pruebas]) => {
            return res.render('Psicologos/registrarGrupo', {
              error: 'El grupo ya está registrado.',
              listadoInstituciones: instituciones[0],
              listadoNiveles: niveles[0],
              listadoPruebas: pruebas[0],
              idInstitucion: req.params.idInstitucion,
            });
          });
        }
  
        const grupo = new Grupo(
          nombreGrupo,
          carrera,
          semestre,
          anio,
          req.params.idInstitucion,
          idNivelAcademico,
          fechaLimite
        );
        console.log("Grupo", grupo);
  
        return grupo.guardarGrupoYPruebas(pruebasSeleccionadas);
      })
      .then(() => {
        exports.getGrupos(req, res, next);
      })
      .catch(error => {
        console.log('Error al registrar grupo:', error);
        if (!res.headersSent) {
          res.send('Error al registrar grupo');
        }
      });
  };
  


exports.getInformacionGrupo = (request, response, next) => {
    Grupo.fetchOne(request.params.idGrupo)
    .then(([rows, fieldData]) => {
        const grupo = rows[0];
        Grupo.getAspirantes(request.params.idGrupo)
        .then(([rows, fieldData]) => {
            const aspirantes = rows;
            console.log(grupo);
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
    aspirante.save(request.params.idGrupo)
    .then(() => {
        aspirante.getIdAspirante(request.params.idGrupo)
        .then(([rows, fieldData]) => {
            const idAspirante = rows[0].idAspirante;
            Grupo.getInformacionGruposPruebas(request.params.idGrupo)
            .then(([rows, fieldData]) => {
                const pruebas = rows;
                const promesas = [];
                for(prueba of pruebas){
                    promesas.push(aspirante.vincularPrueba(idAspirante, request.params.idGrupo, prueba));
                }
                Promise.all(promesas)
                .then(([rows, fieldData]) => {
                    console.log("Proceso terminado");
                    exports.getInformacionGrupo(request, response, next);
                })
                .catch((error) => {
                    console.log(error);
                });
            })
            .catch((error) => {
                console.log(error);
            })
        })
        .catch((error) => {
            console.log(error);
        })
    }).catch((error) => {
        console.log(error);
    })
};




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