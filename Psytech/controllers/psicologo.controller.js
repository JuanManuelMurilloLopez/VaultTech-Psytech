const Pais = require('../models/pais.model');
const Estado = require('../models/estado.model');
const Aspirante = require('../models/aspirante.model');
const Institucion = require('../models/institucion.model');
const Grupo = require('../models/grupo.model');
const TipoInstitucion = require('../models/tipoInstitucion.model');
const Prueba = require('../models/prueba.model');
const { request, response } = require('express');
const Cuadernillo = require('../models/cuadernilloOtis.model');
const CatalogoPruebas = require('../models/catalogoPruebas.model');
const CuadernilloColores = require('../models/cuadernilloColores.model');
const interpretaciones = require('../util/interpretacionColores.js');

const xlsx = require('xlsx');
const fs = require('fs');

//Rutas del portal de los Psicologos
exports.getListaGrupos = (request, response, next) => {
    Grupo.fetchAll()
    .then(([rows, fieldData]) => {
        const arregloGrupos = rows;
        response.render('Psicologos/listaGrupos', {arregloGrupos: arregloGrupos || []});
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.getCatalogoInstituciones = (request, response, next) => {
    Institucion.fetchAll()
    .then(([rows, fieldData]) => {
        const arregloInstituciones = rows;
        console.log("Instituciones Registradas: ", arregloInstituciones);
        response.render('Psicologos/catalogoInstituciones', {
            arregloInstituciones: arregloInstituciones || [],
        });
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.getRegistrarInstitucion = (request, response, next) => {
    TipoInstitucion.fetchAll()
    .then(([rows, fieldData]) => {
        const tiposInstitucion = rows;
        response.render('Psicologos/registrarInstitucion', {
            tiposInstitucion: tiposInstitucion || [],
            error: ""
        })
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.postRegistrarInstitucion = (request, response, next) => {
    const nombreInput = request.body.nombreInstitucion.trim().toLowerCase();

    Institucion.fetchAll()
    .then(([rows]) => {
        const institucionExistente = rows.find(institucion => 
            institucion.nombreInstitucion.trim().toLowerCase() === nombreInput
        );

        if (institucionExistente) {
            return TipoInstitucion.fetchAll()
            .then(([tipos]) => {
                response.render('Psicologos/registrarInstitucion', {
                    tiposInstitucion: tipos || [],
                    error: "Institución previamente registrada"
                });
            });
        }

        const institucion = new Institucion(request.body);
        return institucion.save()
        .then(() => {
            exports.getCatalogoInstituciones(request, response, next);
        });
    })
    .catch((error) => {
        console.log(error);
    });
};


exports.getEditarInstitucion = (request, response, next) => {

    Institucion.fetchOne(request.params.idInstitucion)
    .then(([rows, fieldData]) => {
        const institucion = rows;
    TipoInstitucion.fetchAll()
    .then(([rows, fieldData]) => {
        const tiposInstitucion = rows;
        response.render('Psicologos/editarInstitucion', {
            institucion: institucion || null,
            tiposInstitucion: tiposInstitucion || [],
            error: ""
        })
    })
    .catch((error) => {
        console.log(error);
    });
    })
    .catch((error) => {
        console.log(error);
    });

};

exports.postEditarInstitucion = (request, response, next) => {
    Institucion.modificarInstitucion(
        request.params.idInstitucion, request.body.nombreInstitucion, 
        request.body.estatusInstitucion, request.body.idTipoInstitucion
    )
    .then(() => {
        response.render('Psicologos/cambiosGuardados.ejs');
    })
    .catch((error) => {
        console.log(error);
    });
}

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
      Grupo.getInstituciones(),
      Grupo.getNiveles(),
      Grupo.getPruebas()
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
            Grupo.getInstituciones(),
            Grupo.getNiveles(),
            Grupo.getPruebas()
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
  
        return grupo.saveGrupoYPruebas(pruebasSeleccionadas);
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
                idInstitucion: request.params.idInstitucion || null,
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
    const idGrupo = request.params.idGrupo;
    
    // Información del grupo a editar
    Promise.all([
        Grupo.fetchOne(idGrupo),
        Grupo.getNiveles(),
        Grupo.getPruebas(),
        Grupo.getPruebasAsignadas(idGrupo)
    ])
    .then(([grupoData, niveles, pruebas, pruebasAsignadas]) => {
        const grupo = grupoData[0][0];
        
        if (!grupo) {
            return response.redirect('/psicologo/lista-grupos');
        }
        
        // Sacar informacion del ciclo escolar (semestre y año)
        let semestre = '';
        if (grupo.cicloEscolar) {
            if (grupo.cicloEscolar.includes('Febrero/Julio')) {
                semestre = 'Febrero/Julio';
            } else if (grupo.cicloEscolar.includes('Agosto/Diciembre')) {
                semestre = 'Agosto/Diciembre';
            }
        }
        
        // Obtener lista de pruebas ya asignadas al grupo
        const pruebasSeleccionadas = pruebasAsignadas[0].map(p => p.idPrueba.toString());
        const fechaLimite = pruebasAsignadas[0].length > 0 ? pruebasAsignadas[0][0].fechaLimite : null;
        
        // Convertir fecha limite a YYYY-MM-DD
        let fechaLimiteFormateada = null;
        if (fechaLimite) {
            const fecha = new Date(fechaLimite);
            fechaLimiteFormateada = fecha.toISOString().split('T')[0];
        }
        
        response.render('Psicologos/editarGrupo', {
            grupo: grupo,
            listadoNiveles: niveles[0],
            listadoPruebas: pruebas[0],
            pruebasSeleccionadas: pruebasSeleccionadas,
            fechaLimite: fechaLimiteFormateada,
            semestre: semestre,
            error: '',
            idGrupo: idGrupo,
            idInstitucion: request.params.idInstitucion || null,
        });
    })
    .catch((error) => {
        console.log('Error al cargar formulario de editar grupo:', error);
        response.status(500).send('Error al cargar formulario de editar');
    });
};

exports.postEditarGrupo = (request, response, next) => {
    const idGrupo = request.params.idGrupo;
    const {
        nombreGrupo,
        carrera,
        semestre,
        anio,
        idNivelAcademico,
        pruebasSeleccionadas,
        fechaLimite,
        estatusGrupo
    } = request.body;
    
    console.log("estatusGrupo recibido:", estatusGrupo); 
    
    // Cambiar estatusGrupo a 1 (activo) o 0 (inactivo) para guardarlo en la base de datos
    // Si no se manda un nuevo valor, usar el mismo estatus que ya tenía
    let estatus;
    
    // Checar el valor actual del grupo
    Grupo.fetchOne(idGrupo)
    .then(([rows]) => {
        if (rows.length === 0) {
            return response.status(404).send('Grupo no encontrado');
        }
        
        const grupoActual = rows[0];
        console.log("Estatus actual del grupo:", grupoActual.estatusGrupo);
        
        // Si no se manda el estatusGrupo desde el formulario dejar el que ya estaba
        if (estatusGrupo === undefined || estatusGrupo === null) {
            estatus = grupoActual.estatusGrupo;
        } else {
            // Convertir a 1 o 0 segun el valor recibido
            estatus = estatusGrupo === 'true' ? 1 : 0;
        }
        
        console.log("Estatus que se usará:", estatus);
        
        // Ciclo escolar semestre y año
        const cicloEscolar = `${semestre} ${anio}`;
        
        // Actualizar el grupo con el estatus correcto
        return Grupo.update(
            idGrupo,
            nombreGrupo,
            carrera,
            cicloEscolar,
            anio,
            idNivelAcademico,
            estatus
        );
    })
    .then(() => {
        // Actualizar las pruebas asignadas
        return Grupo.actualizarPruebasAsignadas(idGrupo, pruebasSeleccionadas, fechaLimite);
    })
    .then(() => {
        // Obtener idInstitucion para red a la lista de grupos
        return Grupo.fetchOne(idGrupo);
    })
    .then(([grupo]) => {
        // Red a la pag de grupos de esa institucion
        response.redirect(`/psicologo/grupos/${grupo[0].idInstitucion}`);
    })
    .catch(error => {
        console.log('Error al actualizar grupo:', error);
        response.status(500).send('Error al actualizar el grupo');
    });
};

// Actualizar solo el estatus del grupo
exports.postActualizarEstatusGrupo = (request, response, next) => {
    const idGrupo = request.params.idGrupo;
    const { estatusGrupo } = request.body;
    
    // Convertir el valor a booleano
    const nuevoEstatus = estatusGrupo === 'true';
    
    Grupo.updateEstatus(idGrupo, nuevoEstatus)
        .then(() => {
            // Redireccionar a la pag de lista de grupos
            response.redirect('/psicologo/lista-grupos');
        })
        .catch(error => {
            console.log('Error al actualizar estado del grupo:', error);
            response.status(500).send('Error al actualizar el estado del grupo');
        });
};


exports.getAspirante = (request, response, next) => {
    Aspirante.getInformacionAspirante(request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const informacionAspirante = rows[0];
        Aspirante.getMisPruebas(request.params.idAspirante, request.params.idGrupo)
        .then(([rows, fieldData]) => {
            const informacionPruebas = rows; 
            response.render('Psicologos/informacionAspirante', {
                informacionAspirante: informacionAspirante || [],
                idGrupo: request.params.idGrupo || null,
                informacionPruebas: informacionPruebas || [],
                aspirante: request.params.idAspirante || null,
                idInstitucion: request.params.idInstitucion || null,
            })

        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.getImportarAspirantes = (request, response, next) => {
    response.render('Psicologos/importarAspirantes', {
        idGrupo: request.params.idGrupo,
        idInstitucion: request.params.idInstitucion
    });
};

exports.postImportarAspirantes = (request, response, next) => {
    // Recuperamos el archivo subido por el psicólogo y lo pasamos a JSON
    const archivoExcel = xlsx.readFile(request.files['excelAspirantes'][0].path);
    const hojaExcel = archivoExcel.Sheets[archivoExcel.SheetNames[0]];
    const JSONAspirantes = xlsx.utils.sheet_to_json(hojaExcel, {defval : ""});

    const promesas = JSONAspirantes.map(aspirante => {
        return Pais.findPais(aspirante.paisOrigen)
        .then(([rows, fieldData]) => {
        aspirante.idPais = rows[0].idPais;
        return Estado.findEstado(aspirante.estadoResidencia);
        })
        .then(([rows, fieldData]) => {
            aspirante.idEstado = rows[0].idEstado;
            const nuevoAspirante = new Aspirante({
                nombreUsuario: aspirante.nombre,
                apellidoPaterno: aspirante.apellidoPaterno,
                apellidoMaterno: aspirante.apellidoMaterno,
                institucionProcedencia: aspirante.institucionProcedencia,
                correo: aspirante.correo,
                lada: aspirante.ladaTelefonica,
                numeroTelefono: aspirante.numeroTelefono,
                idPais: aspirante.idPais,
                idEstado: aspirante.idEstado
            });
            return nuevoAspirante.save(request.params.idGrupo)
            .then(() => nuevoAspirante.getIdAspirante(request.params.idGrupo))
            .then(([rows]) => {
                const idAspirante = rows[0].idAspirante;
                return Grupo.getInformacionGruposPruebas(request.params.idGrupo)
                .then(([pruebas]) => {
                    const vincularPruebas = pruebas.map(prueba => nuevoAspirante.vincularPrueba(idAspirante, request.params.idGrupo, prueba));
                    return Promise.all(vincularPruebas);
                });
            });
        });
    });
    
    Promise.all(promesas)
    .then(() => {
        //Eliminamos el archivo subido
        fs.unlink(request.files['excelAspirantes'][0].path, (error) => {
            if (error){
                console.log(error);
            }
        })
        //Mostramos la interfaz de aspirantes registrados con éxito
        response.render('Psicologos/aspirantesRegistrados', {
            idInstitucion: request.params.idInstitucion,
            idGrupo: request.params.idGrupo
        });
    })
    .catch((error) => {
        console.log(error);
    })
}


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
                idGrupo: request.params.idGrupo,
                idInstitucion: request.params.idInstitucion,
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

// CATÁLOGO PRUEBAS
exports.getCatalogoPruebas = (request, response, next) => {
    CatalogoPruebas.fetchAll()
    .then(([rows, fieldData]) => {
        const arregloPruebas = rows;
        response.render('Psicologos/catalogoPruebas', {arregloPruebas: arregloPruebas || []});
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.getPruebaOtis = (request, response, next) => {
    console.log('Prueba OTIS');
    response.render('Psicologos/infoPruebaOtis');
};

exports.getPruebaColores = (request, response, next) => {
    response.send('Prueba Colores');
};

// Controlador para manejar la obtención del cuadernillo de respuestas OTIS.
exports.getCuadernilloOtis = (request, response, next) => {
    // Obtiene los datos personales del aspirante
    Prueba.getDatosPersonalesAspiranteOtis(request.params.idGrupo, request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const datosPersonales = rows;
        // Obtiene las respuestas correctas del aspirante
        Cuadernillo.getRespuestasCorrectas(request.params.idGrupo, request.params.idAspirante)
        .then(([rows, fieldData]) => {
            const respuestasCorrectas = rows[0].RespuestasCorrectas;
            // Obtiene el tiempo total que tomo el aspirante para completar la prueba
            Cuadernillo.getTiempoTotal(request.params.idGrupo, request.params.idAspirante)
            .then(([rows, fieldData]) => {
                const tiempoTotal = rows[0].Tiempo;
                // Obtiene las preguntas, opciones y la respuesta del aspirante
                Cuadernillo.getRespuestasOtisAspirante(request.params.idGrupo, request.params.idAspirante)
                .then(([rows, fieldData]) => {
                    const preguntasAgrupadas = {};

                    rows.forEach(row => {
                        // Creamos el objeto de pregunta si este no existe
                        if (!preguntasAgrupadas[row.idPreguntaOtis]) {
                            preguntasAgrupadas[row.idPreguntaOtis] = {
                                idPreguntaOtis: row.idPreguntaOtis,
                                numeroPregunta: row.numeroPregunta,
                                preguntaOtis: row.preguntaOtis,
                                opciones: [],
                                esCorrecta: false,
                                tiempoRespuesta: 0,
                                contestada: null
                            };
                        }
                        // Vamos añadiendo las opciones de la pregunta correspondiente
                        preguntasAgrupadas[row.idPreguntaOtis].opciones.push({
                            idOpcionOtis: row.idOpcionOtis,
                            opcionOtis: row.opcionOtis,
                            descripcionOpcion: row.descripcionOpcion,
                            esCorrecta: row.esCorrecta === 1, 
                            seleccionada: row.opcionSeleccionada === 1
                        });

                        if (row.opcionSeleccionada === 1) {
                            preguntasAgrupadas[row.idPreguntaOtis].tiempoRespuesta = row.tiempoRespuesta;
                            preguntasAgrupadas[row.idPreguntaOtis].contestada = true;
                            preguntasAgrupadas[row.idPreguntaOtis].esCorrecta = row.esCorrecta === 1;

                        }

                        if(!preguntasAgrupadas[row.idPreguntaOtis].contestada){
                            preguntasAgrupadas[row.idPreguntaOtis].esCorrecta = null;
                        }
                    })

                    const respuestasAspitanteOtis = Object.values(preguntasAgrupadas);
                    
                    response.render('Psicologos/cuadernilloRespuestasOtis.ejs', {
                        datosPersonales: datosPersonales || [],
                        respuestasCorrectas: respuestasCorrectas || 0,
                        tiempoTotal: tiempoTotal || 0,
                        respuestasAspitanteOtis: respuestasAspitanteOtis || [],
                        aspirante: request.params.idAspirante || null,
                        grupo: request.params.idGrupo || null,
                        idInstitucion: request.params.idInstitucion || null,
                    });

                }).catch((error) => {
                    console.log(error);
                })
            }).catch((error) => {
                console.log(error);
            });
        }).catch((error) => {
            console.log(error);
        });
    }).catch((error) => {
        console.log(error);
    });
};

exports.getAnalisisOtis = (request, response, next) => {
    Prueba.getRespuestasOtis(request.params.idAspirante, request.params.idGrupo)
    .then(([rows, fieldData]) => {
        const informacionAnalisis = rows;
        Prueba.getPuntajeBrutoOtis(request.params.idAspirante, request.params.idGrupo)
        .then(([rows, fieldData]) => {
            const puntajeBruto = rows[0].puntajeBruto;
            console.log("Informacion Analisis: ", informacionAnalisis);
            console.log("Puntaje Bruto: ", puntajeBruto);
            response.render('Psicologos/analisisOtis.ejs', {
                informacionAnalisis: informacionAnalisis || [],
                puntajeBruto: puntajeBruto || 0,
                idAspirante: request.params.idAspirante || null,
                idGrupo: request.params.idGrupo || null,
                idInstitucion: request.params.idInstitucion || null,
            })
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
};

// CUADERNILLO COLORES
exports.getCuadernilloColores = (request, response, next) => {
    // Obtener los datos personales del aspirante
    Prueba.getDatosPersonalesAspiranteColores(request.params.idGrupo, request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const datosPersonales = rows;
        
        // Obtener todas las selecciones de colores
        CuadernilloColores.getSeleccionesColores(request.params.idGrupo, request.params.idAspirante)
        .then(([rows, fieldData]) => {
            // Separar las selecciones por fase
            const seleccionesFase1 = rows.filter(row => row.fase === 1)
                                        .sort((a, b) => a.posicion - b.posicion);
            const seleccionesFase2 = rows.filter(row => row.fase === 2)
                                        .sort((a, b) => a.posicion - b.posicion);
            
            response.render('Psicologos/cuadernilloColores.ejs', {
                datosPersonales: datosPersonales || [],
                seleccionesFase1: seleccionesFase1 || [],
                seleccionesFase2: seleccionesFase2 || [],
                aspirante: request.params.idAspirante || null,
                grupo: request.params.idGrupo || null,
                idInstitucion: request.params.idInstitucion || null,
            });
        }).catch((error) => {
            console.log(error);
        });
    }).catch((error) => {
        console.log(error);
    });
};

function obtenerZona(posicion) {
    if (posicion <= 1) return '+';
    if (posicion <= 3) return 'X';
    if (posicion <= 5) return '=';
    return '-';
}

function mapearZona(zonaCruda) {
    if (zonaCruda === '+-' || zonaCruda === 'X-' || zonaCruda === '-+' || zonaCruda === 'X=' || zonaCruda === '=X' || zonaCruda === '=-' || zonaCruda === '-=') {
        return zonaCruda;
    }

    switch (zonaCruda) {
        case '+-X':
        case 'X-+':
        case '+-+':
            return '++';
        case '--=':
        case '=--':
        case '---':
            return '--';
        case '==-':
        case '=-=':
            return '==';
        case 'X-=':
        case '=-X':
            return '+-';
        case 'X-X':
            return 'XX';
        default:
            return zonaCruda.split('-').sort().join('');
    }
}

function obtenerParejasConZona(selecciones) {
    const pares = new Map();
    for (let i = 0; i < selecciones.length - 1; i++) {
        const a = selecciones[i];
        const b = selecciones[i + 1];
        const clave = `${a.numeroColor}-${b.numeroColor}`;

        const zonaCruda = `${obtenerZona(a.posicion)}-${obtenerZona(b.posicion)}`;
        const zona = mapearZona(zonaCruda);

        if (!pares.has(clave)) {
            pares.set(clave, []);
        }
        pares.get(clave).push(zona); 
    }
    return pares;
}

function filtrarParejasNaturalesYDisociadas(paresF1, paresF2) {
    const todasClaves = new Set([...paresF1.keys(), ...paresF2.keys()]);
    const zonasClave = new Set(['++', '--', '==', 'XX']);
    const resultado = [];

    for (let clave of todasClaves) {
        const [c1, c2] = clave.split('-').map(Number);
        const claveNorm = c1 < c2 ? `${c1}-${c2}` : `${c2}-${c1}`;

        const zonasF1 = paresF1.get(claveNorm) || [];
        const zonasF2 = paresF2.get(claveNorm) || [];

        const zonaF1 = zonasF1[0] || null;
        const zonaF2 = zonasF2[0] || null;

        const enF1 = zonasF1.length > 0;
        const enF2 = zonasF2.length > 0;

        const esZonaValida = (zona) => zonasClave.has(zona);

        const esNatural = enF1 && enF2 && zonaF1 === zonaF2 && esZonaValida(zonaF1);
        const esDisociada = enF1 && enF2 && zonaF1 !== zonaF2 && esZonaValida(zonaF1) && esZonaValida(zonaF2);

        if (esNatural || esDisociada) {
            resultado.push({
                pareja: claveNorm,
                tipo: esNatural ? 'natural' : 'disociada',
                zonas: { fase1: zonaF1 || 'N/A', fase2: zonaF2 || 'N/A' }
            });
        }
    }

    return resultado.filter(par =>
        (par.zonas.fase1 && zonasClave.has(par.zonas.fase1)) ||
        (par.zonas.fase2 && zonasClave.has(par.zonas.fase2))
    );
}


function filtrarParejasArtificiales(paresF1, paresF2, parejasNaturalesYDisociadas = [], seleccionesF1 = [], seleccionesF2 = []) {
    const todasClaves = new Set([...paresF1.keys(), ...paresF2.keys()]);
    const resultado = [];

    const esParejaClasificada = (clave) => {
        const claveInversa = clave.split('-').reverse().join('-');
        return parejasNaturalesYDisociadas.some(p =>
            p.pareja === clave || p.pareja === claveInversa
        );
    };
    
    const esPosicionValida = (a, b) => {
        const posicionesValidas = [[0, 1], [2, 3], [4, 5], [6, 7]];
        return posicionesValidas.some(pair =>
            (pair[0] === a && pair[1] === b) || (pair[0] === b && pair[1] === a)
        );
    };

    const obtenerPosicionDeColor = (selecciones, numeroColor) => {
        for (let i = 0; i < selecciones.length; i++) {
            if (selecciones[i].numeroColor === numeroColor) {
                return selecciones[i].posicion;
            }
        }
        return null;
    };

    for (let clave of todasClaves) {
        const zonasF1 = paresF1.get(clave) || [];
        const zonasF2 = paresF2.get(clave) || [];

        const zonaF1 = zonasF1[0] || null;
        const zonaF2 = zonasF2[0] || null;

        const enF1 = zonasF1.length > 0;
        const enF2 = zonasF2.length > 0;

        if (esParejaClasificada(clave)) continue;

        const [colorA, colorB] = clave.split('-').map(Number);

        const posA_f1 = obtenerPosicionDeColor(seleccionesF1, colorA);
        const posB_f1 = obtenerPosicionDeColor(seleccionesF1, colorB);
        const posA_f2 = obtenerPosicionDeColor(seleccionesF2, colorA);
        const posB_f2 = obtenerPosicionDeColor(seleccionesF2, colorB);

        const parejaEsValida =
            esPosicionValida(posA_f1, posB_f1) || esPosicionValida(posA_f2, posB_f2);

        if (parejaEsValida) {
            if (enF1 && !enF2 && zonaF1 !== '+-' && zonaF1 !== undefined) {
                resultado.push({
                    pareja: clave,
                    tipo: 'artificial',
                    zonas: { fase1: zonaF1 || 'N/A' }
                });
            } else if (enF2 && !enF1 && zonaF2 !== '+-' && zonaF2 !== undefined) {
                resultado.push({
                    pareja: clave,
                    tipo: 'artificial',
                    zonas: { fase2: zonaF2 || 'N/A' }
                });
            }
        }
    }

    return resultado;
}

function obtenerInterpretacion(zona1, zona2, pareja) {
    if (zona1 === 'N/A' || zona2 === 'N/A') {
        return 'Interpretación no disponible para esta combinación.';
    }

    const numeros = pareja.match(/\d+/g);
    if (!numeros || numeros.length !== 2) {
        return 'Interpretación no disponible para esta combinación.';
    }

    const parejaNormalizada = `${numeros[0]}-${numeros[1]}`;
    const claveDirecta = `${zona1}|${parejaNormalizada}`;
    const claveInvertida = `${zona2}|${numeros[1]}-${numeros[0]}`;

    if (interpretaciones[claveDirecta]) {
        return interpretaciones[claveDirecta];
    } else if (interpretaciones[claveInvertida]) {
        return interpretaciones[claveInvertida];
    } else {
        return 'Interpretación no disponible para esta combinación.';
    }
}

function obtenerParejasClasificadas(seleccionesFase1, seleccionesFase2) {
    const paresF1 = obtenerParejasConZona(seleccionesFase1);
    const paresF2 = obtenerParejasConZona(seleccionesFase2);

    const resultadoNaturalesYDisociadas = filtrarParejasNaturalesYDisociadas(paresF1, paresF2);
    const resultadoArtificiales = filtrarParejasArtificiales(
        paresF1,
        paresF2,
        resultadoNaturalesYDisociadas,
        seleccionesFase1,
        seleccionesFase2
    );

    // Agregar interpretaciones
    const agregarInterpretaciones = (parejas) => {
        return parejas.map(p => {
            const textoFase1 = obtenerInterpretacion(p.zonas.fase1, p.zonas.fase2, p.pareja);
            const textoFase2 = obtenerInterpretacion(p.zonas.fase2, p.zonas.fase1, p.pareja);
        
            if (!p.zonas.fase1 || !p.zonas.fase2) {
                return { 
                    ...p, 
                    texto: { 
                        fase1: 'Interpretación no disponible para esta combinación.', 
                        fase2: 'Interpretación no disponible para esta combinación.' 
                    }
                };
            }

            return { ...p, texto: { fase1: textoFase1, fase2: textoFase2 } };
        });
    };

    return [...agregarInterpretaciones(resultadoNaturalesYDisociadas), ...resultadoArtificiales];
}

exports.getAnalisisColores = async (request, response, next) => {
    const { idGrupo, idAspirante, idInstitucion } = request.params;
    try {

        // Obtener información del aspirante
        const [informacionAspiranteRows] = await Prueba.getInformacionAspirante(idAspirante);

        // Obtener selecciones de colores completas
        const [seleccionesColoresRows] = await CuadernilloColores.getSeleccionesColores(idGrupo, idAspirante);
        
        // Separar selecciones por fase
        const seleccionesFase1 = seleccionesColoresRows.filter(row => row.fase === 1)
        .sort((a, b) => a.posicion - b.posicion);
        const seleccionesFase2 = seleccionesColoresRows.filter(row => row.fase === 2)
        .sort((a, b) => a.posicion - b.posicion);

        // Calcular parejas naturales
        const parejas = obtenerParejasClasificadas(seleccionesFase1, seleccionesFase2);

        // Obtener resultados de análisis
        const [rows] = await Prueba.getRespuestasColores(idAspirante, idGrupo);

        // Calcular movilidad
        const movilidad = calcularMovilidad(seleccionesFase1, seleccionesFase2);
        
        // Interpretar resultado de movilidad
        const interpretacionMovilidad = interpretarMovilidad(movilidad);

        // Inicializar arrays para resultadosFase1 y resultadosFase2
        const resultadosFase1 = [];
        const resultadosFase2 = [];

        const colores = {
            0: { nombre: 'Gris', significado: 'Participación', tipo: 'No laboral' },
            1: { nombre: 'Azul', significado: 'Paciencia', tipo: 'Laboral' },
            2: { nombre: 'Verde', significado: 'Productividad', tipo: 'Laboral' },
            3: { nombre: 'Rojo', significado: 'Empuje/Agresividad', tipo: 'Laboral' },
            4: { nombre: 'Amarillo', significado: 'Sociabilidad', tipo: 'Laboral' },
            5: { nombre: 'Morado', significado: 'Creatividad', tipo: 'Laboral' },
            6: { nombre: 'Café', significado: 'Vigor', tipo: 'No laboral' },
            7: { nombre: 'Negro', significado: 'Satisfacción', tipo: 'No laboral' },
            8: { nombre: 'Gris', significado: 'Participación', tipo: 'No laboral' },
        };
        
        rows.forEach(({ fase, idColor, posicion }) => {
            const info = colores[idColor] || { nombre: 'Desconocido', significado: '', tipo: 'Desconocido' };
        
            let porcentaje;
        
            if (info.tipo === 'No laboral') {
                porcentaje = 20 + (posicion * 10);
                if (porcentaje <= 50) porcentaje -= 10;
            } else {
                porcentaje = 90 - (posicion * 10);
                if (porcentaje <= 50) porcentaje -= 10; 
            }
        
            const resultado = {
                color: info.nombre,
                significado: info.significado,
                tipo: info.tipo,
                porcentaje
            };
        
            if (fase === 1) {
                resultadosFase1.push(resultado);
            } else if (fase === 2) {
                resultadosFase2.push(resultado);
            }
        });               

        function agregarInterpretaciones(parejas) {
            return parejas.map(p => {
                const textoFase1 = obtenerInterpretacion(p.zonas.fase1, p.zonas.fase2, p.pareja);
                const textoFase2 = obtenerInterpretacion(p.zonas.fase2, p.zonas.fase1, p.pareja);
        
                if (p.zonas.fase1 === 'N/A' || p.zonas.fase2 === 'N/A') {
                    return { 
                        ...p, 
                        texto: { 
                            fase1: 'Interpretación no disponible para esta combinación.', 
                            fase2: 'Interpretación no disponible para esta combinación.' 
                        }
                    };
                }
        
                return { ...p, texto: { fase1: textoFase1, fase2: textoFase2 } };
            });
        }
                                              
        
        const invertirPareja = (pareja) => {
            const partes = pareja.split('-');
            return `${partes[1]}-${partes[0]}`;
        };        

        const parejasNormalizadas = parejas.map(p => {
            const numeros = p.pareja.match(/\d+/g); 
            if (!numeros || numeros.length !== 2) {
                return p; 
            }
        
            return {
                ...p,
                pareja: `${numeros[0]}-${numeros[1]}`
            };
        });

        const parejasConInterpretaciones = agregarInterpretaciones(parejasNormalizadas);

        // Renderizar la vista con todos los datos
        response.render('Psicologos/analisisColores.ejs', {
            seleccionesFase1: seleccionesFase1 || [],
            seleccionesFase2: seleccionesFase2 || [],
            resultadosFase1,
            resultadosFase2,
            movilidad,
            interpretacionMovilidad,
            parejas: parejasConInterpretaciones,
            idGrupo, 
            idAspirante,
            idInstitucion,
            // nombre aspirante analisis
            informacionAspirante: informacionAspiranteRows[0]
        });
    } catch (error) {
        console.error('Error al obtener análisis de colores:', error);
    }
};

// Calcular la movilidad
function calcularMovilidad(seleccionesFase1, seleccionesFase2) {
    let positivosTotales = 0;
    let negativosTotales = 0;
    
    const posicionesFase1 = {};
    seleccionesFase1.forEach(seleccion => {
        posicionesFase1[seleccion.idColor] = seleccion.posicion;
    });
    
    // Comparar con las posiciones en la fase 2
    seleccionesFase2.forEach(seleccion => {
        const posicionFase1 = posicionesFase1[seleccion.idColor];
        const posicionFase2 = seleccion.posicion;
        const desplazamiento = posicionFase1 - posicionFase2;
        
        // Positivo = mover a la derecha 
        if (desplazamiento < 0) {
            positivosTotales += Math.abs(desplazamiento);
        } 
        // Negativo = mover a la izquierda 
        else if (desplazamiento > 0) {
            negativosTotales += desplazamiento;
        }
    });
    
    return {
        positivos: positivosTotales,
        negativos: negativosTotales
    };
}

// Interpretar el resultado de movilidad
function interpretarMovilidad(movilidad) {
    const totalPositivos = movilidad.positivos;
    const totalNegativos = movilidad.negativos;
    const valorAbsoluto = Math.max(totalPositivos, totalNegativos);
    
    if (totalPositivos === 0 && totalNegativos === 0) {
        return "RIGIDEZ (TERCO)";
    } else if (valorAbsoluto <= 1) {
        return "PERSONA DE MENTE ABIERTA Y DISPUESTA AL DIÁLOGO";
    } else if (valorAbsoluto <= 2) {
        return "PERSONA DISPUESTA A DIALOGAR (MENOR GRADO)";
    } else if (valorAbsoluto <= 3) {
        return "PERSONA DISPUESTA A DIALOGAR (MUCHO MENOR GRADO)";
    } else {
        return "PERSONA INESTABLE"; 
    }
}

exports.getRespuestasOtis = (request, response, next) => {
    console.log('Respuestas Otis');
    response.render('Psicologos/respuestasOtis');
};