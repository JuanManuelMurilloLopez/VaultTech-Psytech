const { request, response } = require("express");
const FormatoEntrevista = require('../models/formatoDeEntrevista.model');
const Genero =  require('../models/generos.model');
const EstadoCivil = require('../models/estadoCivil.model');
const Familiar = require('../models/formularioFamiliares.model');
const ConsultarPruebas = require("../models/consultarPruebas.model");
const PruebaColores = require('../models/prueba.model');
const PruebaOtis = require('../models/prueba.model');
const OpcionOtis = require('../models/opcionOtis.model.js');
const Aspirante = require('../models/aspirante.model');

const Prueba = require('../models/prueba.model');
const RespondeKostick = require('../models/respondeKostick.model.js');
const Responde16PF = require('../models/responde16pf.model.js');

//Rutas del portal de los Aspirantes
exports.getPruebas = (request, response) => {
    ConsultarPruebas.fetchAll(request.session.idAspirante)
    .then(([rows, fieldData]) => {
        const pruebas  = rows;
        response.render('Aspirantes/misPruebas',{
            pruebas: pruebas || [],
        });
        
    })

    .catch((error) => {
        console.log(error);
    });
};

exports.getPruebasPendientes = (request, response, next) => {
    ConsultarPruebas.fetchAllPendientes(request.session.idAspirante)
    .then(([rows, fieldData]) => {
        const pruebasPendientes  = rows;
        response.render('Aspirantes/pruebasPendientes',{
            pruebasPendientes: pruebasPendientes || [],
        });
        
    })

    .catch((error) => {
        console.log(error);
    });
};

exports.getPruebasCompletadas = (request, response, next) => {
    ConsultarPruebas.fetchAllCompletadas(request.session.idAspirante)
    .then(([rows, fieldData]) => {
        const pruebasCompletadas  = rows;
        response.render('Aspirantes/pruebasCompletadas',{
            pruebasCompletadas: pruebasCompletadas || [],
        });
        
    })

    .catch((error) => {
        console.log(error);
    });
};

exports.getCargarExpedientes = (request, response, next) => {

    //Recuperamos los archivos previamente subidos por el aspirante
    Aspirante.getExpedientes(request.session.idAspirante)
    .then(([rows, fieldData]) => {
        const informacionExpedientes = rows[0];
        console.log("Información Expedientes", informacionExpedientes);
        response.render('Aspirantes/cargaExpedientes', {
            informacionExpedientes: informacionExpedientes || [],
        })
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.postCargarExpedientes = (request, response, next) => {

    /*Revisamos el archivo que el aspirante subió, para mandarlo a su
      respectivo campo en la base de datos*/
    if(request.files['cv']){
        console.log("entra al if de cv")
        Aspirante.addCv(request.session.idAspirante, request.files['cv'][0].filename)
        .then(() => {
            response.render('Aspirantes/expedientesGuardados');
        })
        .catch((error) => {
            console.log(error);
        });
    }

    if(request.files['kardex']){
        console.log("nombre archivo kardex", request.files['kardex'])
        Aspirante.addKardex(request.session.idAspirante, request.files['kardex'][0].filename)
        .then(() => {
            response.render('Aspirantes/expedientesGuardados');
        })
        .catch((error) => {
            console.log(error);
        });
    }
};

exports.getFormatoEntrevista = (request, response, next) => {
    FormatoEntrevista.fetchAll()
    .then(([rows, fieldData]) => {
        const preguntas = rows;
        response.render('Aspirantes/formatoDeEntrevista',{
            preguntas: preguntas || [],
        });
    }).catch((error) => {
        console.log(error);
    });
};

exports.postFormatoEntrevista = (request, response, next) => {
    // Array para almacenar respuestas del formato de entrevista
    const respuestasParseadas = []; 
    // Obtener las llaves del objeto request.body para separarlas de su valor
    for(let key in request.body){
        const value = request.body[key];
        respuestasParseadas.push([request.session.idAspirante, key, value]);
    }

    const respuesta = new FormatoEntrevista(respuestasParseadas);

    respuesta.saveRespuestaAspirante()
    .then(() => {
        response.redirect('/aspirante/formulario-familiar')
    }).catch((error) => {
        console.log(error)
    });

};

exports.getFormularioFamiliares = (request, response, next) => {
    Familiar.fetchAll()
    .then(([rows, fieldData]) => {
        const familiares = rows;

        Genero.fetchAll()
            .then(([rows, fieldData]) => {
                const generos = rows;

                EstadoCivil.fetchAll()
                .then(([rows, fieldData]) => {
                    const estadosCiviles = rows;
                    
                    Familiar.fetchHijoDe(request.session.idAspirante)
                    .then(([rows, fieldData]) => {
                        const hijoDe = rows;

                        response.render('Aspirantes/formularioFamiliar',{
                            familiares: familiares || [],
                            generos: generos || [],
                            estadosCiviles: estadosCiviles || [],
                            hijoDe: hijoDe || [],
                        });
                    })
                    .catch((error) => {
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

exports.postFormularioFamiliares = (request, response, next) => {
    // Array para almacenar respuestas del formato de entrevista
    const familiaresParseados = []; 
    // Obtener las llaves del objeto request.body para separarlas de su valor
    for(let key in request.body){
        let value = request.body[key];
        if (key === 'hijoDe' && value === '') {
            value = null;
        }
        familiaresParseados.push(value);
    }

    console.log(familiaresParseados)
    
    const respuesta = new Familiar(request.session.idAspirante, familiaresParseados);

    respuesta.saveFamiliar()
    .then(() => {
        response.redirect('/aspirante/formulario-familiar')
    }).catch((error) => {
        console.log(error)
    });

};

exports.getIntruccionesOtis = (request, response, next) => {
    response.render('Aspirantes/instruccionesOtis');
};

exports.postInstruccionesOtis = (req, res) => {
    res.redirect('/aspirante/datos-personales-otis');
};

// Mostrar instrucciones colores
exports.getInstruccionesColores = (request, response, next) => {
    response.render('Aspirantes/instruccionesColores');
};

exports.postInstruccionesColores = (req, res) => {
    res.redirect('/aspirante/datos-personales-colores');
};

// Formulario datos personales
exports.getDatosPersonalesOtis = (request, response, next) => {
    response.render('Aspirantes/datosPersonalesOtis');
};

exports.getDatosPersonalesColores = (request, response, next) => {
    response.render('Aspirantes/datosPersonalesColores');
};

exports.get_respuestas_enviadas = (request, response, next) => {
    response.send('Respuestas enviadas');
};

// Procesar datos personales y pasar a la prueba
exports.postDatosPersonalesOtis = (request, response, next) => {
    const { nombre, apellidoPaterno, apellidoMaterno, puestoSolicitado } = request.body;
    
    // Guardar en la sesion
    request.session.datosPersonalesOtis = {
        nombre,
        apellidoPaterno,
        apellidoMaterno,
        puestoSolicitado,
        fecha: new Date()
    };
    
    // Redirigir a la prueba
    response.redirect('/aspirante/prueba-otis');
};

exports.getPruebaOtis = (request, response, next) => {
    response.render('Aspirantes/pruebaOtis');
};

//Obtener las areas, preguntas y opciones
exports.obtenerPreguntas = async (req, res, next) => {
    try {
        const [areasDB] = await PruebaOtis.getAreaOtis();
        const [preguntasDB] = await PruebaOtis.getPreguntasOtis();
        const [opcionesDB] = await OpcionOtis.fetchAll();

        const preguntas = preguntasDB.map(pregunta => {
            const opciones = opcionesDB
                .filter(opcion => opcion.idPreguntaOtis === pregunta.idPreguntaOtis)
                .map(opcion => ({
                    idOpcionOtis: opcion.idOpcionOtis,
                    descripcionOpcion: opcion.descripcionOpcion,
                    esCorrecta: opcion.esCorrecta
                }));

            const respuestaCorrecta = opcionesDB.find(opcion =>
                opcion.idPreguntaOtis === pregunta.idPreguntaOtis && opcion.esCorrecta === 1
            )?.descripcionOpcion;

            // Buscar el nombre del área por idAreaOtis
            const area = areasDB.find(a => a.idAreaOtis === pregunta.idAreaOtis);

            return {
                num: pregunta.numeroPregunta,
                idPreguntaOtis: pregunta.idPreguntaOtis,
                pregunta: pregunta.preguntaOtis,
                respuesta: respuestaCorrecta,
                nombreAreaOtis: area ? area.nombreAreaOtis : "Sin área",
                opciones: opciones
            };
        });

        return res.json({ preguntas });
    } catch (error) {
        console.error("Error obteniendo preguntas:", error);
    }
}

// Obtener toda la prueba
exports.getPruebaOtis = (request, response, next) => {
    if (!request.session.datosPersonalesOtis) {
        return response.redirect('/aspirante/datos-personales-otis');
    }

    const idPrueba = 5;

    // Obtener el idGrupo y idPrueba por la sesión
    PruebaOtis.getGrupoPrueba(request.session.idAspirante, idPrueba)
        .then(([rows, fieldData]) => {
            if (rows.length > 0) {
                request.session.idGrupo = rows[0].idGrupo;
                request.session.idPrueba = idPrueba;
            } else {
                console.log("No se encontró grupo para este aspirante y prueba");
            }

            // Función para obtener las preguntas del model
            return PruebaOtis.getPreguntasOtis();
        })
        .then(([rows, fieldData]) => {
            const preguntas = rows;
            response.render('Aspirantes/pruebaOtis', {
                preguntas: preguntas || [],
                error: null
            });
        })
        .catch((error) => {
            console.error("Error al cargar la prueba OTIS:", error);
            response.render('Aspirantes/pruebaOtis', {
                preguntas: [],
                error: 'Error al cargar la prueba OTIS'
            });
        });
};

exports.postPruebaOtis = (request, response, next) => {
    response.redirect('/aspirante/prueba-completada');
};

const db = require('../util/database');
const { v4: uuidv4 } = require('uuid');

exports.postGuardarRespuestas = async (request, response) => {

    const idAspirante = request.session.idAspirante;
    const idGrupo = request.session.idGrupo;
    const idPrueba = request.session.idPrueba;

    // Si no se encuentra el idAspirante
    if (!request.session.idAspirante) {
        return response.redirect('/aspirante/datos-personales-otis');
    }

    const respuestas = request.body;

    try {
        // Armar el array de valores para insertar
        const values = respuestas.map(r => [
            uuidv4(), // para generar el idRespuestaOtis
            idAspirante,
            idGrupo,
            r.idPreguntaOtis,
            r.idOpcionOtis,
            idPrueba,
            r.tiempoRespuesta
        ]);

        // Insertar valores en la tabla respuestaOtisAspirante
        await db.query(
            `INSERT INTO respuestaotisaspirante
            (idRespuestaOtis, idAspirante, idGrupo, idPreguntaOtis, idOpcionOtis, idPrueba, tiempoRespuesta)
            VALUES ?`, 
            [values]
        );

         // Obtener datos personales desde sesión
         const datosPersonales = request.session.datosPersonalesOtis || {
            nombre: "Usuario",
            apellidoPaterno: "",
            apellidoMaterno: "",
            puestoSolicitado: "No especificado",
            fecha: new Date()
        };

        // Guardar datos personales
        await PruebaOtis.saveDatosPersonales(
            idAspirante,
            idGrupo,
            idPrueba,
            datosPersonales
        );

        console.log("Datos personales guardados correctamente");

        // Verificar si ya existe el registro en aspirantesGruposPruebas
        const [rows] = await PruebaOtis.verificarExistencia(
            idAspirante,
            idGrupo,
            idPrueba
        );

        if (rows.length === 0) {
            console.log("No existe registro, insertando...");
            await db.execute(
                `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                VALUES (?, ?, ?, 2)`,
                [idAspirante, idGrupo, idPrueba]
            );
        } else {
            console.log("Registro encontrado, actualizando estado...");
            await PruebaOtis.updateEstatusPrueba(
                idAspirante,
                idGrupo,
                idPrueba
            );
        }

    } catch (error) {
        console.error("Error al guardar respuestas:", error);
    }
    return response.json({ success: true, redirectUrl: '/aspirante/prueba-completada' });
};

// Procesar datos personales y pasar a la prueba
exports.postDatosPersonalesColores = (request, response, next) => {
    const { nombre, apellidoPaterno, apellidoMaterno, puestoSolicitado } = request.body;
    
    // Guardar en la sesion
    request.session.datosPersonalesColores = {
        nombre,
        apellidoPaterno,
        apellidoMaterno,
        puestoSolicitado,
        fecha: new Date()
    };
    
    // Primera fase de la prueba
    response.redirect('/aspirante/prueba-colores');
};

exports.getPruebaColores = (request, response, next) => {
    if (!request.session.datosPersonalesColores) {
        return response.redirect('/aspirante/datos-personales-colores');
    }

    const idPrueba = 6; 

    // Obtener el idGrupo aspirante y prueba
    PruebaColores.getGrupoPrueba(request.session.idAspirante, idPrueba)
        .then(([rows, fieldData]) => {
            if (rows.length > 0) {
                // Guardar el idGrupo
                request.session.idGrupo = rows[0].idGrupo;
                console.log("ID de Grupo establecido:", request.session.idGrupo);
            } else {
                console.log("No se encontró grupo para este aspirante y prueba");
            }

            // Continuar con colores
            return PruebaColores.fetchColores();
        })
        .then(([rows, fieldData]) => {
            const colores = rows;
            response.render('Aspirantes/pruebaColores', {
                colores: colores || [],
                fase: 1,
                error: null
            });
        })
        .catch((error) => {
            console.log(error);
            response.render('Aspirantes/pruebaColores', {
                colores: [],
                fase: 1,
                error: 'Error al cargar los colores'
            });
        });
};

exports.postPruebaColores = (request, response, next) => {
    response.redirect('/aspirante/prueba-completada');
};

exports.postGuardarSeleccionesColores = (request, response) => {
    console.log("1. Iniciando controlador postGuardarSeleccionesColores");
    
    if (!request.session.idAspirante) {
        console.log("2. Error: No se encontró idAspirante en la sesión");
        return response.redirect('/aspirante/datos-personales-colores');
    }
    
    console.log("Datos recibidos:", request.body);
    
    // Recolectar las selecciones de colores desde los campos del formulario
    const selecciones = [];
    const regex = /selecciones\[(\d+)\]\[(\w+)\]/;
    
    const datos = {};
    for (const key in request.body) {
        if (key.startsWith('selecciones')) {
            const matches = key.match(regex);
            if (matches) {
                const index = matches[1];
                const prop = matches[2];
                const value = request.body[key];
                
                if (!datos[index]) {
                    datos[index] = {};
                }
                datos[index][prop] = value;
            }
        }
    }
    
    // Convertir el objeto en un array
    for (const index in datos) {
        selecciones.push({
            idColor: parseInt(datos[index].idColor),
            fase: parseInt(datos[index].fase),
            posicion: parseInt(datos[index].posicion)
        });
    }
    
    console.log("3. Selecciones procesadas:", selecciones);
    
    if (selecciones.length === 0) {
        console.log("4. Error: No hay selecciones para procesar");
        return response.redirect('/aspirante/prueba-colores');
    }
    
    const idPrueba = 6; 
    
    
    PruebaColores.getGrupoPrueba(request.session.idAspirante, idPrueba)
        .then(([rows]) => {
            if (rows.length === 0) {
                throw new Error("No se encontró grupo para este aspirante y prueba");
            }
            
            const idGrupo = rows[0].idGrupo;
            console.log("5. ID de Grupo obtenido:", idGrupo);
            
            // Separar las selecciones de fase 1 y 2
            const seleccionesFase1 = selecciones.filter(s => s.fase === 1);
            const seleccionesFase2 = selecciones.filter(s => s.fase === 2);
            
            console.log("6. Selecciones fase 1:", seleccionesFase1.length);
            console.log("7. Selecciones fase 2:", seleccionesFase2.length);
            
            // Obtener datos personales
            const datosPersonales = request.session.datosPersonalesColores || {
                nombre: "Usuario",
                apellidoPaterno: "",
                apellidoMaterno: "",
                puestoSolicitado: "No especificado",
                fecha: new Date()
            };
            
            // Guardar en base
            return PruebaColores.saveDatosPersonales(
                request.session.idAspirante,
                idGrupo,
                idPrueba,
                datosPersonales
            ).then(() => {
                console.log("8. Datos personales guardados correctamente");
                // const pruebaColores1 = new PruebaColores(seleccionesFase1);
                return PruebaColores.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    1,
                    seleccionesFase1
                );
            }).then(() => {
                console.log("9. Primera selección guardada");
                // const pruebaColores2 = new PruebaColores(seleccionesFase2);
                return PruebaColores.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    2,
                    seleccionesFase2
                );
            }).then(() => {
                console.log("10. Segunda selección guardada");
                return PruebaColores.verificarExistencia(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba
                );
            }).then(([rows]) => {
                if (rows.length === 0) {
                    console.log("11. No existe registro, insertando...");
                    return db.execute(
                        `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                        VALUES (?, ?, ?, 2)`,
                        [request.session.idAspirante, idGrupo, idPrueba]
                    );
                } else {
                    console.log("12. Registro encontrado, actualizando estado...");
                    return PruebaColores.updateEstatusPrueba(
                        request.session.idAspirante,
                        idGrupo, 
                        idPrueba
                    );
                }
            });
        })
        .then(() => {
            console.log("13. Proceso completado con éxito");
            delete request.session.datosPersonalesColores;
            delete request.session.primeraSeleccion;
            response.redirect('/aspirante/prueba-completada');
        })
        .catch((error) => {
            console.error("Error:", error.message);
            console.log(error);
            return response.send(`
                <h3>Error al procesar la prueba</h3>
                <p>${error.message}</p>
                <a href="/aspirante/prueba-colores" class="btn btn-primary">Volver a intentar</a>
            `)
            
            ;
        });
};

exports.getPruebaCompletada = (request, response, next) => {
    response.render('Aspirantes/pruebaCompletada', {
    });
};

exports.getRespuestasEnviadas = (request, response, next) => {
    response.render('Aspirantes/respuestasEnviadas');
};

////////////////////
// 16PF y Kostick //
////////////////////
exports.get_instrucciones = (request, response, next) => {
    PruebaOtis.fetchOneByName(request.params.idPrueba).then(([rows]) => {
      response.render("Aspirantes/instruccionesPruebas", {
        prueba: rows[0]
      });
    });
  };
  
  
  // Datos Personales
  exports.getDatosPersonalesKostick = (request, response, next) => {
    Prueba.getGrupoPrueba(request.session.idAspirante, 1)
    .then(([rows, fieldData]) => {
        request.session.idGrupo = rows[0].idGrupo;
        console.log(request.session.idGrupo);
        Prueba.updateEstatusPrueba(request.session.idAspirante, request.session.idGrupo, 1, 'En progreso')
        .then(() => {
            response.render('Aspirantes/datosPersonalesKostick');
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
    
  }

  exports.postDatosPersonalesKostick = (request, response, next) => {

    Prueba.getGrupoPrueba(request.session.idAspirante, 1)
    .then(([rows, fieldData]) => {
        const grupo = rows[0];
        request.session.idGrupo = grupo.idGrupo;
        Prueba.saveDatosPersonales(request.session.idAspirante, grupo.idGrupo, 1, request.body)
        .then(() => {
            response.render(`Aspirantes/autoPostKOSTICK`, {
                idAspirante: request.session.idAspirante,
            });
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch();
  }

  exports.getDatosPersonales16PF = (request, response, next) => {
    Prueba.getGrupoPrueba(request.session.idAspirante, 2)
    .then(([rows, fieldData]) => {
        request.session.idGrupo = rows[0].idGrupo;
        console.log(request.session.idGrupo);
        Prueba.updateEstatusPrueba(request.session.idAspirante, request.session.idGrupo, 2, 'En progreso')
        .then(() => {
            response.render('Aspirantes/datosPersonales16PF');
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
  }

  exports.postDatosPersonales16PF = (request, response, next) => {

    Prueba.getGrupoPrueba(request.session.idAspirante, 1)
    .then(([rows, fieldData]) => {
        const grupo = rows[0];
        request.session.idGrupo = grupo.idGrupo;
        Prueba.saveDatosPersonales(request.session.idAspirante, grupo.idGrupo, 2, request.body)
        .then(() => {
            response.render(`Aspirantes/autoPost16PF`, {
                idAspirante: request.session.idAspirante,
            });
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch();
  }

  /* controlador que renderiza la primera pregunta de la prueba dependiendo de us id (1 para Kostick y 2 para 16PF). Estos id se manejan así en todos los casos) */
  exports.post_preguntasPrueba = (request, response, next) => {
    if (request.params.idPrueba == 'KOSTICK') {
      Prueba.fetchOneByName(request.params.idPrueba)
        .then(([rows, fieldData]) => {
            const prueba = rows[0];
          request.session.index = 1; // Index que ayudará a recuperar el resto de las preguntas (por número de pregunta) 
          let currentQuestionIndex = request.session.index;
          Prueba.getPreguntaKostick(currentQuestionIndex)
          .then(([rows, fieldData]) => {
            const pregunta = rows[0];
            Prueba.getOpcionesByPregunta(pregunta.idPreguntaKostick)
            .then(([rows, fieldData]) => {
                const opciones = rows;
                response.render("Aspirantes/preguntasPrueba", {
                    prueba: prueba || null,
                    pregunta: pregunta || null,
                    opciones: opciones || [],
                    idGrupo: request.session.grupo || '',  //Se necesita guardar el id del grupo al que pertenece el Usuario en algún punto, o recuperarlo para este y los siguientes controladores
                    idAspirante: request.session.idAspirante || "",
                  });
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
    } else if (request.params.idPrueba == '16PF') {
        Prueba.fetchOneByName('PRUEBA DE 16PF')
        .then(([rows, fieldData]) => {
            const prueba = rows[0];
          request.session.index = 1; // Index que ayudará a recuperar el resto de las preguntas (por número de pregunta) 
          let currentQuestionIndex = request.session.index;
          Prueba.getPregunta16PF(currentQuestionIndex)
          .then(([rows, fieldData]) => {
            const pregunta = rows[0];
            Prueba.getOpcionesByPregunta16PF(pregunta.idPregunta16PF)
            .then(([rows, fieldData]) => {
                const opciones = rows;
                response.render("Aspirantes/preguntasPrueba", {
                    prueba: prueba || null,
                    pregunta: pregunta || null,
                    opciones: opciones || [],
                    idGrupo: request.session.grupo || '',  //Se necesita guardar el id del grupo al que pertenece el Usuario en algún punto, o recuperarlo para este y los siguientes controladores
                    idAspirante: request.session.idAspirante || "",
                  });
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
  };
  
  /* post siguiente pregunta de KOSTICK (usando AJAX) */
  exports.post_siguientePregunta = (request, response, next) => {
    if (!request.session.index) {
      return response.redirect("/login");
    }
    request.session.index++;
  
    const newRespondeKostick = new RespondeKostick(
      request.body.idPreguntaKostick,
      request.body.idGrupo,
      request.body.idAspirante,
      request.body.idOpcionKostick,
      request.body.tiempo
    );
    newRespondeKostick.save().then((uuid) => {
      request.session.idPregunta16PF = uuid;
    });

    Prueba.getPreguntaKostick(request.session.index)
    .then(([rows, fieldData]) => {
        const pregunta = rows[0];
        Prueba.getOpcionesByPregunta(pregunta.idPreguntaKostick)
        .then(([rows, fieldData]) => {
            const opciones = rows;
            response.status(200).json({
                pregunta: pregunta|| null,
                opciones: opciones || [],
                idGrupo: request.session.grupo || null,
                idAspirante: request.session.idAspirante || "",
            });
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
  };
  
  /* post siguiente pregunta de 16PF (usando AJAX) */
  exports.post_siguientePregunta1 = (request, response, next) => {
    const { idOpcion16PF, idGrupo, idAspirante, idPregunta16PF, tiempo } =
      request.body;
    if (!request.session.index) {
      return response.redirect("/login");
    }
    request.session.index++;
  
    const newResponde16pf = new Responde16PF(
      request.body.idPregunta16PF,
      request.body.idGrupo,
      request.body.idAspirante,
      request.body.idOpcion16PF,
      request.body.tiempo
    );
    newResponde16pf.save().then((uuid) => {
      request.session.idPregunta16PF = uuid;
    });
  
    Prueba.getPregunta16PF(request.session.index)
    .then(([rows, fieldData]) => {
        const pregunta = rows[0];
        Prueba.getOpcionesByPregunta16PF(pregunta.idPregunta16PF)
        .then(([rows, fieldData]) => {
            const opciones = rows;
            response.status(200).json({
                pregunta: pregunta|| null,
                opciones: opciones || [],
                idGrupo: request.session.grupo || null,
                idAspirante: request.session.idAspirante || "",
            });
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });

  };
  
  /* Controlador que guarda la última pregunta de 16PF */
  exports.pruebaCompletada = (request, response, next) => {
    const idOpcionKostick = request.body.idOpcionKostick;
    const idGrupo = request.body.idGrupo;
    const idAspirante = request.body.idAspirante;
    const idPreguntaKostick = request.body.idPreguntaKostick;
    const tiempo = request.body.tiempo;
    const idPrueba = 1;
  
    if (!request.session.index) {
      return response.redirect("/login");
    }
  
    const newRespondeKostick = new RespondeKostick(
      idPreguntaKostick,
      idGrupo,
      idAspirante,
      idOpcionKostick,
      tiempo
    );
  
    newRespondeKostick
      .save()
      .then((uuid) => {
        request.session.idPregunta16PF = uuid;
        return response.status(200).json({
          message: "Prueba completada exitosamente",
        });
      })
      .catch((error) => {
        console.error("Error saving response:", error);
        return response.status(500).json({ message: "Error saving response." });
      });
  
    Prueba.updateEstatusPrueba(request.session.idAspirante, request.session.idGrupo, 1, 'Completada')
    .then(() => {

    })
    .catch((error) => {
        console.log(error);
    });
  };
  
  /* Controlador que guarda la última pregunta de 16PF */
  exports.pruebaCompletada1 = (request, response, next) => {
    const idOpcion16PF = request.body.idOpcion16PF;
    const idGrupo = request.body.idGrupo;
    const idAspirante = request.body.idAspirante;
    const idPregunta16PF = request.body.idPregunta16PF;
    const tiempo = request.body.tiempo;
  
    const idPrueba = 2;
  
    if (!request.session.index) {
      return response.redirect("/login");
    }
  
    const newResponde16pf = new Responde16PF(
      idOpcion16PF,
      idGrupo,
      idAspirante,
      idPregunta16PF,
      tiempo
    );
    newResponde16pf
      .save()
      .then((uuid) => {
        request.session.idPregunta16PF = uuid;
        return response.status(200).json({
          message: "Prueba completada exitosamente",
        });
      })
      .catch((error) => {
        console.error("Error saving response:", error);
        return response.status(500).json({ message: "Error saving response." });
      });

      Prueba.updateEstatusPrueba(request.session.idAspirante, request.session.idGrupo, 2, 'Completada')
      .then(() => {
  
      })
      .catch((error) => {
          console.log(error);
      });
  };
  
  /* Controlador que lleva a la vista con mensaje de prueba completada*/
  exports.get_pruebaCompletada = (request, response, next) => {
    Aspirante.fetchOne(request.session.idAspirante).then(([aspirante]) => {
      response.render('Aspirantes/pruebaCompletada');
    });
  };

