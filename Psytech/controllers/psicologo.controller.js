const Grupo = require('../models/grupo.model');


//Rutas del portal de los Psicologos
exports.getPrincipalPsicologos = (request, response, next) => {
    console.log('Pagina Principal Psicologos');
    response.render('Psicologos/principal');
};

exports.getCatalogoInstituciones = (request, response, next) => {
    console.log('Catalogo de Instituciones');
    response.render('Psicologos/catalogoInstituciones');
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
    console.log('Grupos por Institucion');
    response.render('Psicologos/gruposInstitucion');
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
        res.render('Psicologos/registrarGrupo', {
          listadoInstituciones: instituciones[0],
          listadoNiveles: niveles[0],
          listadoPruebas: pruebas[0],
          error: null
        });
      })
      .catch(err => {
        console.log(err);
        res.send('Error al cargar formulario');
      });
  };

// Post
  exports.postRegistrarGrupo = (req, res, next) => {
    const {
      nombreGrupo,
      carrera,
      semestre,
      anio,
      idInstitucion,
      idNivelAcademico,
      pruebasSeleccionadas
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
              listadoPruebas: pruebas[0]
            });
          });
        }
  
        const grupo = new Grupo(
          nombreGrupo,
          carrera,
          semestre,
          anio,
          idInstitucion,
          idNivelAcademico
        );
  
        return grupo.guardarGrupoYPruebas(pruebasSeleccionadas);
      })
      .then(() => {
        res.redirect('/psicologo/grupos');
      })
      .catch(error => {
        console.log('Error al registrar grupo:', error);
        if (!res.headersSent) {
          res.send('Error al registrar grupo');
        }
      });
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
    console.log('Registrar Aspirante');
    response.render('Psicologos/registrarAspirante');
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