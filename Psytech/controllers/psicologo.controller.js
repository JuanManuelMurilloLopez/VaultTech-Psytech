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
        })
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.postRegistrarInstitucion = (request, response, next) => {
    const institucion = new Institucion(request.body);
    institucion.save()
    .then(() => {
        exports.getCatalogoInstituciones(request, response, next);
    })
    .catch((error) => {
        console.log(error);
    });
}

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
    Prueba.getDatosPersonalesAspirante(request.params.idGrupo, request.params.idAspirante)
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
    Prueba.getDatosPersonalesAspirante(request.params.idGrupo, request.params.idAspirante)
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

function obtenerParejasConZona(selecciones) {
    const pares = new Map();
    for (let i = 0; i < selecciones.length - 1; i++) {
        const a = selecciones[i];
        const b = selecciones[i + 1];
        const clave = [a.numeroColor, b.numeroColor].sort((x, y) => x - y).join('-');
        let zona = obtenerZona(a.posicion) + '-' + obtenerZona(b.posicion);

        switch (zona) {
            case '+-X':
            case 'X-+':
                zona = '++';
                break;
            case '--=':
            case '=--':
                zona = '--';
                break;
            case 'X-=':
                zona = '+-';
                break;
            case '+-+':
                zona = '++';
                break;
            case '=--':
                zona = '--'; 
                break;
            case '=-=':
                zona = '=='; 
                break;
            case 'X-X':
                zona = 'XX'; 
                break;
            case '---':
                zona = '--'; 
                break;
            default:
                break;
        }
        if (!pares.has(clave)) {
            pares.set(clave, { zonas: new Set() });
        }
        pares.get(clave).zonas.add(zona);
    }
    return pares;
}

function obtenerParejasClasificadas(seleccionesFase1, seleccionesFase2) {
    const paresF1 = obtenerParejasConZona(seleccionesFase1);
    const paresF2 = obtenerParejasConZona(seleccionesFase2);

    const parejas = [];
    const artificialesAgregadas = new Set();

    for (let [clave, datosF1] of paresF1) {
        if (paresF2.has(clave)) {
            const datosF2 = paresF2.get(clave);
            const zonaF1 = [...datosF1.zonas][0];
            const zonaF2 = [...datosF2.zonas][0];

            if (zonaF1 === zonaF2) {
                if (
                    (zonaF1 === '+-+' || zonaF1 === '=-=' || zonaF1 === '---' || zonaF1 === 'X-X') &&
                    !artificialesAgregadas.has(zonaF1)
                ) {
                    parejas.push({
                        pareja: clave,
                        tipo: 'artificial',
                        zonas: { fase1: zonaF1, fase2: zonaF2 }
                    });
                    artificialesAgregadas.add(zonaF1);
                } else {
                    parejas.push({
                        pareja: clave,
                        tipo: 'natural',
                        zonas: { fase1: zonaF1, fase2: zonaF2 }
                    });
                }
            } else {
                parejas.push({
                    pareja: clave,
                    tipo: 'disociada',
                    zonas: { fase1: zonaF1, fase2: zonaF2 }
                });
            }
        }
    }

    return parejas;
}


exports.getAnalisisColores = async (request, response, next) => {
    const { idGrupo, idAspirante, idInstitucion } = request.params;
    try {
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
            0: { nombre: 'Gris', significado: 'Participación', tipo: 'Laboral' },
            1: { nombre: 'Azul', significado: 'Paciencia', tipo: 'Laboral' },
            2: { nombre: 'Verde', significado: 'Productividad', tipo: 'Laboral' },
            3: { nombre: 'Rojo', significado: 'Empuje/Agresividad', tipo: 'Laboral' },
            4: { nombre: 'Amarillo', significado: 'Sociabilidad', tipo: 'Laboral' },
            5: { nombre: 'Morado', significado: 'Creatividad', tipo: 'Laboral' },
            6: { nombre: 'Café', significado: 'Vigor', tipo: 'No laboral' },
            7: { nombre: 'Negro', significado: 'Satisfacción', tipo: 'No laboral' },
            8: { nombre: 'Gris', significado: 'Participación', tipo: 'Laboral' },
        };
        
        rows.forEach(({ fase, idColor, posicion }) => {
            let porcentaje = 90 - (posicion * 10);
            if (porcentaje <= 50) porcentaje -= 10;

            const info = colores[idColor]|| { nombre: 'Desconocido', significado: '', tipo: 'Desconocido' };

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

        response.render('Psicologos/analisisColores.ejs', {
            seleccionesFase1: seleccionesFase1 || [],
            seleccionesFase2: seleccionesFase2 || [],
            resultadosFase1,
            resultadosFase2,
            movilidad,
            interpretacionMovilidad,
            parejas,
            idGrupo, 
            idAspirante,
            idInstitucion
        });
    } catch (error) {
        console.error('Error al obtener análisis de colores:', error);
        response.status(500).send('Error al obtener análisis de colores');
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