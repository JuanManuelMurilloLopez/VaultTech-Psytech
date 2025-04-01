const { request, response } = require("express");
const FormatoEntrevista = require('../models/formatoDeEntrevista.model');
const Genero =  require('../models/generos.model');
const EstadoCivil = require('../models/estadoCivil.model');
const Familiar = require('../models/formularioFamiliares.model');
const ConsultarPruebas = require("../models/consultarPruebas.model");
const PruebaColores = require('../models/pruebaColores.model');

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
        console.log(pruebasPendientes)
        response.render('Aspirantes/pruebasPendientes',{
            pruebasPendientes: pruebasPendientes || [],
        });
        
    })

    .catch((error) => {
        console.log(error);
    });
};

exports.getPruebasCompletadas = (request, response, next) => {
    response.render('Aspirantes/pruebasCompletadas');
};

exports.getSubirDocumentos = (request, response, next) => {
    response.render('Aspirantes/subirDocumentos');
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

// Mostrar instrucciones colores
exports.getInstruccionesColores = (request, response, next) => {
    response.render('Aspirantes/instruccionesColores');
};

exports.postInstruccionesColores = (req, res) => {
    res.redirect('/aspirante/datos-personales-colores');
};
  

exports.getPruebaOtis = (request, response, next) => {
    response.render('Aspirantes/pruebaOtis');
};

// Formulario datos personales
exports.getDatosPersonalesColores = (request, response, next) => {
    response.render('Aspirantes/datosPersonalesColores');
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
    PruebaColores.obtenerGrupoParaPrueba(request.session.idAspirante, idPrueba)
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
    
    
    PruebaColores.obtenerGrupoParaPrueba(request.session.idAspirante, idPrueba)
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
            return PruebaColores.guardarDatosPersonales(
                request.session.idAspirante,
                idGrupo,
                idPrueba,
                datosPersonales
            ).then(() => {
                console.log("8. Datos personales guardados correctamente");
                const pruebaColores1 = new PruebaColores(seleccionesFase1);
                return pruebaColores1.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    1
                );
            }).then(() => {
                console.log("9. Primera selección guardada");
                const pruebaColores2 = new PruebaColores(seleccionesFase2);
                return pruebaColores2.saveSeleccion(
                    request.session.idAspirante,
                    idGrupo,
                    idPrueba,
                    2
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
                        `INSERT INTO aspirantesGruposPruebas (idAspirante, idGrupo, idPrueba, idEstatus)
                        VALUES (?, ?, ?, 2)`,
                        [request.session.idAspirante, idGrupo, idPrueba]
                    );
                } else {
                    console.log("12. Registro encontrado, actualizando estado...");
                    return PruebaColores.updateEstadoPrueba(
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
            return response.send(`
                <h3>Error al procesar la prueba</h3>
                <p>${error.message}</p>
                <a href="/aspirante/prueba-colores" class="btn btn-primary">Volver a intentar</a>
            `);
        });
};

exports.getPruebaCompletada = (request, response, next) => {
    response.render('Aspirantes/pruebaCompletada', {
    });
};

exports.getRespuestasEnviadas = (request, response, next) => {
    response.render('Aspirantes/respuestasEnviadas');
};