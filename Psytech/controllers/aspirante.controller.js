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
const Terman = require('../models/terman.model');
const respuestasTerman = require('../models/respuestasTerman.model');

const { Resend } = require('resend');
const resend = new Resend(process.env.RESEND_API_KEY);
const Usuario = require('../models/usuario.model');

// Middlewares de apoyo
const calificarSerieTerman = require("../middleware/calificarTerman.js");


//hartman requires
const PruebaHartman = require('../models/prueba.model');
const hartman = require('../models/hartman.model');
const {calcularResultados} = require('../public/js/aspirantes/valorHartman.js'); 
const hartmanAnalysisModel = require('../models/hartmanAnalysis.model.js');
const Prueba = require('../models/prueba.model');
const RespondeKostick = require('../models/respondeKostick.model.js');
const Responde16PF = require('../models/responde16pf.model.js');
const ResultadosKostick = require('../models/resultadosKostick.model.js');

//Soporte
exports.postSoporte = async (req, res) => {
  try {
    const usuario = req.session.usuario;
    const mensaje = req.body.mensaje;

    if (!usuario || !mensaje) {
      return res.send('<script>alert("Sesión expirada o mensaje vacío."); window.location.href = "/aspirante/mis-pruebas";</script>');
    }

    const [filas] = await Usuario.getDatosParaSoporte(usuario);
    const datos = filas[0];

    const cuerpoCorreo = `
      <h2>Consulta de soporte</h2>
      <p><strong>Nombre:</strong> ${datos.nombreUsuario} ${datos.apellidoPaterno} ${datos.apellidoMaterno}</p>
      <p><strong>Correo:</strong> ${datos.correo}</p>
      <p><strong>Grupo:</strong> ${datos.nombreGrupo}</p>
      <hr>
      <p><strong>Mensaje:</strong></p>
      <p>${mensaje.replace(/\n/g, '<br>')}</p>
    `;

    await resend.emails.send({
      from: 'psytech@pruebas.psicodx.com',
      to: ['diysdance@gmail.com'],
      subject: `Soporte de ${datos.nombreUsuario}`,
      html: cuerpoCorreo
    });

    res.send('<script>alert("Mensaje enviado correctamente."); window.location.href = "/aspirante/mis-pruebas";</script>');

  } catch (error) {
    console.error('Error al enviar soporte:', error);
    res.send('<script>alert("Ocurrió un error al enviar el mensaje."); window.location.href = "/aspirante/mis-pruebas";</script>');
  }
};


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
        Aspirante.addCv(request.session.idAspirante, request.files['cv'][0].filename)
        .then(() => {
            response.render('Aspirantes/expedientesGuardados');
        })
        .catch((error) => {
            console.log(error);
        });
    }

    if(request.files['kardex']){
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

// Mostrar instrucciones Hartman
exports.getInstruccionesHartman = (request, response, next) => {
    response.render('Aspirantes/instruccionesHartman');
};

exports.postInstruccionesHartman = (req, res) => {
    res.redirect('/aspirante/prueba-hartman/fase1');
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
                console.log( request.session.idGrupo);
                request.session.idGrupo = rows[0].idGrupo;
                request.session.idPrueba = idPrueba;
            } else {
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

        // Verificar si ya existe el registro en aspirantesGruposPruebas
        const [rows] = await PruebaOtis.verificarExistencia(
            idAspirante,
            idGrupo,
            idPrueba
        );

        if (rows.length === 0) {
            await db.execute(
                `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                VALUES (?, ?, ?, 2)`,
                [idAspirante, idGrupo, idPrueba]
            );
        } else {
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
            } else {
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
    
    if (!request.session.idAspirante) {
        return response.redirect('/aspirante/datos-personales-colores');
    }
    
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
    
    if (selecciones.length === 0) {
        return response.redirect('/aspirante/prueba-colores');
    }
    
    const idPrueba = 6; 
    
    
    PruebaColores.getGrupoPrueba(request.session.idAspirante, idPrueba)
        .then(([rows]) => {
            if (rows.length === 0) {
                throw new Error("No se encontró grupo para este aspirante y prueba");
            }
            
            const idGrupo = rows[0].idGrupo;
            
            // Separar las selecciones de fase 1 y 2
            const seleccionesFase1 = selecciones.filter(s => s.fase === 1);
            const seleccionesFase2 = selecciones.filter(s => s.fase === 2);
            
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
                // const pruebaColores1 = new PruebaColores(seleccionesFase1);
                return PruebaColores.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    1,
                    seleccionesFase1
                );
            }).then(() => {
                // const pruebaColores2 = new PruebaColores(seleccionesFase2);
                return PruebaColores.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    2,
                    seleccionesFase2
                );
            }).then(() => {
                return PruebaColores.verificarExistencia(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba
                );
            }).then(([rows]) => {
                if (rows.length === 0) {
                    return db.execute(
                        `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                        VALUES (?, ?, ?, 2)`,
                        [request.session.idAspirante, idGrupo, idPrueba]
                    );
                } else {
                    return PruebaColores.updateEstatusPrueba(
                        request.session.idAspirante,
                        idGrupo, 
                        idPrueba
                    );
                }
            });
        })
        .then(() => {
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

// Controladores para prueba Terman

exports.getResponderTerman = (req, res, next) => {
    res.render("Aspirantes/responderTerman", {
        title: "Responder Terman"
    });
};

exports.getInfoSerie = (req, res, next) => {
    const idSerie = parseInt(req.params.idSerie);
    console.log("Valor recibido en req.params.idSerie:", idSerie);

    if (!idSerie || isNaN(idSerie)) {
        return res.status(400).json({ error: "ID de serie inválido o no proporcionado." });
    }

    const idPrueba = 4;
    let nombreSeccion, instruccion, preguntas, opciones;

    console.log(req.session.idAspirante)

    Terman.getGrupoPrueba(req.session.idAspirante, idPrueba)
        .then(([rows, fieldData]) => {
            if (rows.length > 0) {
                req.session.idGrupo = rows[0].idGrupo;
                req.session.idPrueba = idPrueba;
            } else {
                console.log("No se encontró grupo para este aspirante y prueba");
            }

            return Terman.fetchSerieInfoById(idSerie);
        })
        .then(info => {
            if (info.length === 0) {
                throw new Error("No se encontró información para la serie con ese ID.");
            }
            id = info[0].idSerieTerman;
            nombreSeccion = info[0].nombreSeccion;
            instruccion = info[0].instruccion;
            duracion = info[0].duracion;

            return Terman.fetchPreguntaSerieById(idSerie);
        })
        .then(preguntasRows => {
            preguntas = preguntasRows;
            return Terman.fetchOpcionesSerieById(idSerie);
        })
        .then(opcionesRows => {
            opciones = opcionesRows;

            // Adjunta las opciones a cada pregunta
            const preguntasConOpciones = preguntas.map(p => {
                p.opciones = opciones.filter(o => o.idPreguntaTerman === p.idPreguntaTerman);
                return p;
            });

            res.json({
                id,
                nombreSeccion,
                instruccion,
                duracion,
                preguntas: preguntasConOpciones
            });
        })
        .catch(error => {
            console.error("Error al cargar serie:", error);
            res.status(500).json({ error: "Error al cargar la serie." });
        });
};

exports.postRespuestaTerman = async (req, res, next) => {
    try {
        // Constantes de construcción

        const idPreguntaTerman = parseInt(req.params.idPreguntaTerman);
        const { respuesta, tiempo } = req.body;
        const idAspirante = req.session.idAspirante;
        const idGrupo = req.session.idGrupo;
        const idPrueba = 4;

        console.log("📥 req.params.idPreguntaTerman:", req.params.idPreguntaTerman);
        console.log("📥 req.body:", req.body);
        console.log("📥 req.session:", req.session.idAspirante);
        console.log("📥 req.session:", req.session.idGrupo);


        const respuestas = new respuestasTerman(idAspirante, idGrupo, idPrueba, [
            { idPregunta: idPreguntaTerman, opcion: respuesta, tiempo }
        ]);

        await respuestas.save();

        const [rows] = await Terman.verificarExistencia(
            idAspirante,
            idGrupo,
            idPrueba
        );
    
        if (rows.length === 0) {
            await db.execute(
                `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                VALUES (?, ?, ?, 2)`,
                [idAspirante, idGrupo, idPrueba]
            );
        } else {
            await Terman.updateEstatusPrueba(
                idAspirante,
                idGrupo,
                idPrueba
            );
        }

        res.status(200).json({ ok: true, message: "Respuestas guardadas" });

    } catch (error) {
        console.log("Algo salió mal en post_respuestasSerie:", error);
        res.status(500).json({ error: "Error al guardar respuestas" });
    }
};


/**
 * Controlador para la primera fase de la prueba de Hartman.
 * Almacena el tiempo de inicio, obtiene las preguntas de la fase 1,
 * actualiza la sesión de la prueba y renderiza la vista.
 */
exports.getHartmanFase1 = async (request, response, next) => {
    request.session.tiempoInicio = Date.now(); 
    const idPrueba = 3;
    const fasePregunta = 1;

    try {
        const grupo = await hartman.getGrupoPrueba(request.session.idAspirante, idPrueba);
        if (!grupo || grupo.length === 0) {
            return response.status(400).send("No estás asignado a ningún grupo para esta prueba.");
        }

        request.session.idGrupo = grupo[0].idGrupo;

        const [preguntas] = await hartman.fetchFase1(fasePregunta);

        response.render('Aspirantes/pruebaHartman', {
            idsPreguntasHartman: preguntas.map(row => row.idPreguntaHartman),
            numerosPreguntas: preguntas.map(row => row.idPreguntaHartman),
            preguntasHartman: preguntas.map(row => row.preguntaHartman),
            fase1: true,
        });

    } catch (error) {
        console.error('Error obteniendo grupo o preguntas:', error.message);
    }
};

/**
 * Controlador para procesar las respuestas de la primera fase de Hartman.
 * Calcula el tiempo, extrae las respuestas, las guarda y redirige a la siguiente fase.
 */
exports.postHartmanFase1 = (request, response, next) => {
    const tiempoInicio = request.session.tiempoInicio;
    const tiempoFin = Date.now();
    const tiempoTotalSegundos = Math.floor((tiempoFin - tiempoInicio) / 1000);

    const idAspirante = request.session.idAspirante;
    const idGrupo = request.session.idGrupo;
    const idPrueba = 3; 

    const totalPreguntas = Object.keys(request.body).filter(key => key.startsWith("respuesta_")).length;
    const tiempoPromedio = totalPreguntas > 0 ? tiempoTotalSegundos / totalPreguntas : 0;

    const respuestas = Object.entries(request.body)
        .filter(([pregunta_id]) => pregunta_id.startsWith("respuesta_"))
        .map(([pregunta_id, respuesta]) => {
            const idPregunta = parseInt(pregunta_id.replace("respuesta_", ""), 10);
            return [
                idAspirante,
                idGrupo,
                idPregunta,
                idPrueba,
                respuesta,
                tiempoPromedio
            ];
        });

    const respuestasFase1 = new hartman(respuestas);

    respuestasFase1.save()
        .then(() => {
            response.redirect('/aspirante/prueba-hartman/fase2');
        })
        .catch(err => {
            console.error('Error al guardar respuestas:', err);
        });
};

/**
 * Controlador para la segunda fase de la prueba de Hartman.
 * Almacena el tiempo de inicio, obtiene las preguntas de la fase 2 y renderiza la vista.
 */
exports.getHartmanFase2 = async (request, response, next) => {
    try {
        tiempoInicio = Date.now();
        const fasePregunta = 2;
        const [rows] = await hartman.fetchFase1(fasePregunta);

        response.render('Aspirantes/pruebaHartman', {
            numerosPreguntas: rows.map(row => row.idPreguntaHartman),
            preguntasHartman: rows.map(row => row.preguntaHartman),
            fase1: false, // Indicar que es la fase 2
        });
    } catch (error) {
        console.error('Error obteniendo las preguntas de la fase 2:', error);
    }
};

/**
 * Controlador para procesar las respuestas de la segunda fase de Hartman.
 * Calcula el tiempo, extrae las respuestas, las guarda, actualiza la sesión
 * de la prueba y redirige al aspirante.
 */
exports.postHartmanFase2 = async (request, response, next) => {
    try {
        const tiempoFin = Date.now();
        const tiempoTotalSegundos = Math.floor((tiempoFin - tiempoInicio) / 1000);
        const totalPreguntas = Object.keys(request.body).filter(key => key.startsWith("respuesta_")).length;
        const tiempoPromedio = totalPreguntas > 0 ? tiempoTotalSegundos / totalPreguntas : 0;

        const idAspirante = request.session.idAspirante;
        const idGrupo = request.session.idGrupo;
        const idPrueba = 3; // Hartman
        const estatus = 2;  // Fase 2 completada

        // Preparar respuestas para guardar
        const respuestas = Object.entries(request.body)
            .filter(([key]) => key.startsWith("respuesta_"))
            .map(([key, valor]) => {
                const idPregunta = parseInt(key.replace("respuesta_", ""), 10);
                return [idAspirante, idGrupo, idPregunta, idPrueba, valor, tiempoPromedio];
            });

        const respuestasFase2 = new hartman(respuestas);
        await respuestasFase2.save();

          // 1. Recuperar todas las respuestas del usuario 
    const todasLasRespuestas = await hartman.getRespuestasUsuario(
        request.session.idAspirante,
        request.session.idGrupo
    );

        // Separar las respuestas en arreglos de 'cita' y 'frase' y los convierte a numeros 
        const respuestasFrase = todasLasRespuestas
        .filter((r) => r.idPreguntaHartman >= 1 && r.idPreguntaHartman <= 18)
        .map((r) => parseInt(r.respuestaAbierta, 10)); 

    const respuestasCita = todasLasRespuestas
        .filter((r) => r.idPreguntaHartman >= 19 && r.idPreguntaHartman <= 36)
        .map((r) => parseInt(r.respuestaAbierta, 10)); 

        const resultadosAnalisis = calcularResultados(respuestasFrase, respuestasCita);

        const hartmanAnalysis = new hartmanAnalysisModel(idAspirante, idGrupo, resultadosAnalisis);
        await hartmanAnalysis.save();

        // --- ACTUALIZAR O INSERTAR EN aspirantesgrupospruebas ---
        const [rows] = await PruebaHartman.verificarExistencia(idAspirante, idGrupo, idPrueba);

        if (rows.length === 0) {
            await db.execute(
                `INSERT INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                 VALUES (?, ?, ?, 2)`,
                [idAspirante, idGrupo, idPrueba]
            );
        } else {
            await PruebaHartman.updateEstatusPrueba(idAspirante, idGrupo, idPrueba);
        }

        response.redirect('/aspirante/prueba-completada');

    } catch (error) {
        console.error("Error al procesar la fase 2 de Hartman:", error);
    }
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
        Prueba.updateEstatusPruebaK16(request.session.idAspirante, request.session.idGrupo, 1, 'En progreso')
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
        Prueba.updateEstatusPruebaK16(request.session.idAspirante, request.session.idGrupo, 2, 'En progreso')
        .then(() => {
            Genero.fetchAll()
            .then(([rows, fieldData]) => {
                const generos = rows;
                response.render('Aspirantes/datosPersonales16PF', {
                    generos: generos || [],
                })
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

  exports.postDatosPersonales16PF = (request, response, next) => {

    Prueba.getGrupoPrueba(request.session.idAspirante, 1)
    .then(([rows, fieldData]) => {
        const grupo = rows[0];
        request.session.idGrupo = grupo.idGrupo;
        Prueba.saveDatosPersonales16PF(request.session.idAspirante, grupo.idGrupo, 2, request.body)
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
                    idGrupo: request.session.idGrupo || '',  //Se necesita guardar el id del grupo al que pertenece el Usuario en algún punto, o recuperarlo para este y los siguientes controladores
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
                    idGrupo: request.session.idGrupo || '',  //Se necesita guardar el id del grupo al que pertenece el Usuario en algún punto, o recuperarlo para este y los siguientes controladores
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
                idGrupo: request.session.idGrupo || null,
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
                idGrupo: request.session.idGrupo || null,
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
  
    Prueba.updateEstatusPruebaK16(request.session.idAspirante, request.session.idGrupo, 1, 'Completada')
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

      Prueba.updateEstatusPruebaK16(request.session.idAspirante, request.session.idGrupo, 2, 'Completada')
      .then(() => {
  
      })
      .catch((error) => {
          console.log(error);
      });
  };
  

exports.get_pruebaCompletadaK16 = async (request, response, next)=> {

    if(request.params.idPrueba == 1){
        const letras = [

            "G",
            "L",
            "I",
            "T",
            "V",
            "S",
            "R",
            "D",
            "C",
            "E",
            "W",
            "F",
            "K",
            "Z",
            "O",
            "B",
            "X",
            "P",
            "A",
            "N",
          ];
        
          const m = [
            // G
            [[1, 11, 21, 31, 41, 51, 61, 71, 81], []],
            // L
            [[12, 22, 32, 42, 52, 62, 72, 82], [81]],
            // I
            [
              [23, 33, 43, 53, 63, 73, 83],
              [82, 71],
            ],
            // T
            [
              [34, 44, 54, 64, 74, 84],
              [83, 72, 61],
            ],
            // V
            [
              [45, 55, 65, 75, 85],
              [84, 73, 62, 51],
            ],
            // S
            [
              [56, 66, 76, 86],
              [85, 74, 63, 52, 41],
            ],
            // R
            [
              [67, 77, 87],
              [86, 75, 64, 53, 42, 31],
            ],
            // D
            [
              [78, 88],
              [87, 76, 65, 54, 43, 32, 21],
            ],
            // C
            [[89], [88, 77, 66, 55, 44, 33, 22, 11]],
            // E
            [[], [89, 78, 67, 56, 45, 34, 23, 12, 1]],
            // W
            [[90, 80, 70, 60, 50, 40, 30, 20, 10], []],
            // F
            [[79, 69, 59, 49, 39, 29, 19, 9], [10]],
            // K
            [
              [68, 58, 48, 38, 28, 18, 8],
              [9, 20],
            ],
            // Z
            [
              [57, 47, 37, 27, 17, 7],
              [8, 19, 30],
            ],
            // O
            [
              [46, 36, 26, 16, 6],
              [7, 18, 29, 40],
            ],
            // B
            [
              [35, 25, 15, 5],
              [6, 17, 28, 39, 50],
            ],
            // X
            [
              [24, 14, 4],
              [5, 16, 27, 38, 49, 60],
            ],
            // P
            [
              [13, 3],
              [4, 15, 26, 37, 48, 59, 70],
            ],
            // A
            [[2], [3, 14, 25, 36, 47, 58, 69, 80]],
            // N
            [[], [2, 13, 24, 35, 46, 57, 68, 79, 90]],
          ];
        
          let suma = new Array(m.length).fill(0);
        
          try {
            //Calificar
        
            const promesas = [];
        
            let pregunta = 0;
            const size = m.length;
        
            for (let l = 0; l < size; l++) {
              for (let o = 0; o <= 1; o++) {
                let opcion = "a";
                if (o === 0) {
                  opcion = "a";
                } else {
                  opcion = "b";
                }
                for (let p = 0; p < m[l][o].length; p++) {
                  pregunta = m[l][o][p];
                  const letra = l;
                  promesas.push(
                    RespondeKostick.fetchRespuesta(
                      request.session.idGrupo,
                      request.session.idAspirante,
                      pregunta
                    )
                      .then((respuesta) => {
                        if (respuesta[0][0].opcionKostick === opcion) {
                          suma[letra]++;
                        }
                      })
                      .catch((err) => {
                        console.error(`Error en pregunta ${pregunta}:`, err);
                      })
                  );
                }
              }
            }
            await Promise.all(promesas);
          } catch (err) {
            console.error("Error general:", err);
            response.status(500).send("Ocurrió un error al calificar la prueba");
          }
        
          const mis_resultadosKostick = new ResultadosKostick(
            request.session.idGrupo,
            request.session.idAspirante,
            suma[0],
            suma[1],
            suma[2],
            suma[3],
            suma[4],
            suma[5],
            suma[6],
            suma[7],
            suma[8],
            suma[9],
            suma[10],
            suma[11],
            suma[12],
            suma[13],
            suma[14],
            suma[15],
            suma[16],
            suma[17],
            suma[18],
            suma[19]
          );
          mis_resultadosKostick.save().then(() => {
            response.render('Aspirantes/pruebaCompletada');
          })
    } else {
        response.render('Aspirantes/pruebaCompletada');
    }


}

  /* Controlador que lleva a la vista con mensaje de prueba completada*/
  exports.get_pruebaCompletada = (request, response, next) => {
    Aspirante.fetchOne(request.session.idAspirante).then(([aspirante]) => {
      response.render('Aspirantes/pruebaCompletada');
    });
  };

