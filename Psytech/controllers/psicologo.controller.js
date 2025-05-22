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
const InfoPruebas = require('../models/infoPruebas.model');
const FormatoEntrevista = require('../models/formatoDeEntrevista.model.js');
const Familiar = require('../models/formularioFamiliares.model.js');

// Modelos terman
const respuestasTermanModel = require('../models/respuestasTerman.model.js');
const calificacionesTerman = require('../models/calificacionesTerman.model.js');
const calificacionTerman = new calificacionesTerman();
const resultadosSeriesTerman = require('../models/resultadosSeriesTerman.model.js');
const resultadoSerieTerman = new resultadosSeriesTerman();

// Middleware de apoyo para calificar Terman
const calificarSerieTerman = require("../middleware/calificarTerman.js");
const ResultadosKostick = require('../models/resultadosKostick.model.js');
const Resultados16PF = require('../models/resultados16PF.model.js');
const InterpretacionKostick = require('../models/interpretacionKostick.js');
const Interpretaciones16PF = require('../models/interpretacion16PF.model.js');
const RespondeKostick = require('../models/respondeKostick.model.js');
const Responde16PF = require('../models/responde16pf.model.js');

const PreguntaKostick = require('../models/preguntasKostick.model.js');
const Pregunta16PF = require('../models/preguntas16pf.model.js');

const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');
const Usuario = require('../models/usuario.model.js');
const { error } = require('console');

const { Resend } = require('resend');

const resend = new Resend(process.env.RESEND_API_KEY);
const correoHtmlPath = path.join(__dirname, '..', 'util', 'correoRegistro.html');

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
        idInstitucion: req.params.idInstitucion,});
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

exports.buscarAspirantes = (request, response, next) => {
    Grupo.getAspirantes(request.params.idGrupo)
        .then(([rows]) => {
            const filtrados = rows.filter(a => {
                const nombreCompleto = `${a.nombreUsuario} ${a.apellidoPaterno} ${a.apellidoMaterno || ''}`.toLowerCase();
                return nombreCompleto.includes(request.params.valor.toLowerCase());
            });

            response.json(filtrados);
        })
        .catch((error) => {
            console.error(error);
        });
};



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
        
        // Si no se manda el estatusGrupo desde el formulario dejar el que ya estaba
        if (estatusGrupo === undefined || estatusGrupo === null) {
            estatus = grupoActual.estatusGrupo;
        } else {
            // Convertir a 1 o 0 segun el valor recibido
            estatus = estatusGrupo === 'true' ? 1 : 0;
        }
        
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
            Aspirante.getFormatoEntrevista(request.params.idAspirante, request.params.idGrupo)
            .then(([rows, fieldData]) => {
                const formatoEntrevista = rows;
                response.render('Psicologos/informacionAspirante', {
                    informacionAspirante: informacionAspirante || [],
                    idGrupo: request.params.idGrupo || null,
                    informacionPruebas: informacionPruebas || [],
                    formatoEntrevista: formatoEntrevista || [],
                    aspirante: request.params.idAspirante || null,
                    idInstitucion: request.params.idInstitucion || null,
                })
            })
            .catch((error) => {
                console.log(error)
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
                }).then(() => {
                    return new Promise ((resolve, reject) => {
                        fs.readFile(correoHtmlPath, 'utf8', (error, htmlContent) => {
                            if(error){
                                console.log(error);
                                return resolve();
                            }

                            resend.emails.send({
                            from: 'psytech@pruebas.psicodx.com',
                            to: [aspirante.correo],
                            subject: 'Bienvenido, accede a tus pruebas psicométricas y psicológicas de admisión al posgrado',
                            html: htmlContent
                            })
                            .then(() => resolve())
                            .catch((error) => {
                                console.log(error);
                                resolve();
                            });
                        })
                    })
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
            Aspirante.fetchCorreos()
            .then(([rows, fieldData]) => {
                const correosRegistrados = rows;
                response.render('Psicologos/registrarAspirante', {
                    paises: paises || [],
                    estados: estados || [],
                    idGrupo: request.params.idGrupo,
                    idInstitucion: request.params.idInstitucion,
                    correosRegistrados: correosRegistrados,
                });
            })
            .catch((error) => {
                console.log(error);
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

                    fs.readFile(correoHtmlPath, 'utf8', (error, htmlContent) => {
                        if(error){
                            console.log(error);
                            return;
                        }
                        resend.emails.send({
                        from: 'psytech@pruebas.psicodx.com',
                        to: [request.body.correo],
                        subject: 'Bienvenido, accede a tus pruebas psicométricas y psicológicas de admisión al posgrado',
                        html: htmlContent
                        })
                        .then(() => {
                            exports.getInformacionGrupo(request, response, next);
                        })
                        .catch((error) => {
                            console.log(error);
                        });
                    })
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

    Aspirante.fetchOne(request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const aspirante = rows[0];

        Usuario.findUsuario(aspirante.idUsuario)
        .then(([rows, fieldData]) => {
            const usuario = rows[0];
            Pais.fetchAll()
            .then(([rows, fieldData]) => {
                const paises = rows;
                Estado.fetchAll()
                .then(([rows, fieldData]) => {
                    const estados = rows;
                    response.render('Psicologos/editarAspirante',{
                        aspirante: aspirante || null,
                        usuario: usuario || null,
                        paises: paises || [],
                        estados: estados || [],
                        idGrupo: request.params.idGrupo,
                        idInstitucion: request.params.idInstitucion
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

        
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.postEditarAspirantes = (request, response, next) => {

    Aspirante.modificarAspirante(
                                request.params.idAspirante, 
                                request.body.institucionProcedencia, 
                                request.body.idPais, request.body.idEstado)
    .then(() => {
        Usuario.modificarUsuario(
                                request.params.idAspirante, 
                                request.body.nombreUsuario, 
                                request.body.apellidoPaterno, 
                                request.body.apellidoMaterno, 
                                request.body.correo, request.body.lada, 
                                request.body.numeroTelefono, 
                                request.body.estatusUsuario)
        .then(() => {
            response.render('Psicologos/cambiosGuardados.ejs');
        })
        .catch((error) => {
            console.log(error);
        });
    })
};

// Controlador para menejar las respuestas de un aspirante por formato de entrevista

exports.getRespuestasFormatoEntrevista = (request, response, next) => {
    FormatoEntrevista.getRespuestasFormatoAspirante(request.params.idGrupo, request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const respuestasAspirante = rows;
        response.render('Psicologos/respuestasFormatoDeEntrevista', {
            respuestasAspirante: respuestasAspirante || [],
            aspirante: request.params.idAspirante || null,
            grupo: request.params.idGrupo || null,
            idInstitucion: request.params.idInstitucion || null,
        });
    })
    .catch((error) => {
        console.log(error);
    })
};

// Controlador para menejar la informacion familiar de un aspirante
exports.getInformacionFamiliar = (request, response, next) => {
    Familiar.getFamiliaresAspirante(request.params.idGrupo, request.params.idAspirante)
    .then(([rows, fieldData]) => {
        const nodos = rows.map((familiar) => ({
            key: familiar.idFamiliar,
            rol: familiar.rolFamiliar,
            name: familiar.nombreFamiliar,
            age: familiar.edadFamiliar,
            gender: familiar.idGenero,
            maritalStatus: familiar.idEstadoCivil,
            lifeStatus: familiar.estadoDeVida === 1 ? "Vivo" : "Muerto",
            hijoDePadre: familiar.hijoDePadre,
            hijoDeMadre: familiar.hijoDeMadre
        }));

        const links = [];
        rows.forEach((familiar => {
            if(familiar.hijoDePadre){
                links.push({
                    from: familiar.hijoDePadre, 
                    to: familiar.idFamiliar
                })
            }
            if (familiar.hijoDeMadre) {
                links.push({
                    from: familiar.hijoDeMadre, 
                    to: familiar.idFamiliar
                });
            }
        }))

        response.render('Psicologos/informacionFamiliar', {
            informacionFamiliar: {
                nodos: nodos || [],
                links: links || []
            },
            aspirante: request.params.idAspirante || null,
            grupo: request.params.idGrupo || null,
            idInstitucion: request.params.idInstitucion || null,
        });
        
    })
    .catch((error) => {
        console.log(error);
    })
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
}

exports.getPruebaOtis = (request, response, next) => {
    response.render('Psicologos/infoPruebaOtis');
};

exports.getPruebaColores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.getPruebaKostick = (request, response, next)  => {
    PreguntaKostick.getInfo()
    .then(([rows, fieldData]) => {
        const opciones = rows;
        const informacionPreguntas = {};
        opciones.forEach(pregunta => {
            const numPregunta = pregunta.numeroPreguntaKostick;
            if(!informacionPreguntas[numPregunta]){
                informacionPreguntas[numPregunta] = [];
            }
            informacionPreguntas[numPregunta].push(pregunta);
        })
        response.render('Psicologos/infoPruebaKostick', {
            informacionPreguntas: informacionPreguntas || [],
        });
    })
    .catch((error) => {
        console.log(error);
    });
}

exports.getPrueba16pf = (request, response, next) => {
    Pregunta16PF.getInfo()
    .then(([rows, fieldData]) => {
        const opciones = rows;
        const informacionPreguntas = {};
        opciones.forEach(pregunta => {
            const numPregunta = pregunta.numeroPregunta16PF;
            if(!informacionPreguntas[numPregunta]){
                informacionPreguntas[numPregunta] = [];
            }
            informacionPreguntas[numPregunta].push(pregunta);
        })
        response.render('Psicologos/infoPrueba16pf', {
            informacionPreguntas: informacionPreguntas || [],
        });
    })
    .catch((error) => {
        console.log(error);
    });
}

exports.getPruebaHartman = async (req, res, next) => {
    try {
        const preguntas = await Prueba.getPreguntasHartman();

        const fase1 = preguntas.filter(p => p.fasePregunta === 1);
        const fase2 = preguntas.filter(p => p.fasePregunta === 2);

        res.render('Psicologos/infoPruebaHartman', {
            fase1,
            fase2
        });
    } catch (err) {
        console.error('Error al obtener preguntas Hartman:', err);
        next(err);
    }
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
    response.render('Psicologos/respuestasOtis');
};

const consultaResultados = require('../models/consultaResultados.model.js');
 const {
     buscarValor, // Importa la función
     DIM,
     DIF,
     dimGeneral,
     dimPorcentaje,
     INT,
     DI,
     DIS,
     VQ,
     Equilibrio_BQR,
     Equilibrio_BQA,
     Equilibrio_CQ1,
     Equilibrio_CQ2
 } = require('../public/js/aspirantes/encuentraValor.js');

exports.getAnalisisHartman = async (request, response, next) => {
    const { idGrupo, idAspirante, idInstitucion } = request.params;

    try {
        const [rows] = await consultaResultados.fetchHartmanAspirante(idAspirante, idGrupo);

        if (!rows || rows.length === 0) {
            return response.status(404).send("No se encontraron resultados de Hartman.");
        }

         // Procesa los datos del analisis de hartman para poder graficarlos
        const analisisProcesado = {
            MundoInterno: {
                DimI: rows[0].citaDimI != null ? buscarValor(rows[0].citaDimI, DIM) : 0,
                DimE: rows[0].citaDimE != null ? buscarValor(rows[0].citaDimE, DIM) : 0,
                DimS: rows[0].citaDimS != null ? buscarValor(rows[0].citaDimS, DIM) : 0,
                DiF: rows[0].citaDif != null ? buscarValor(rows[0].citaDif, DIF) : 0,
                DimGeneral: rows[0].citaDimGeneral != null ? buscarValor(rows[0].citaDimGeneral, dimGeneral) : 0,
                DimPorcentaje: rows[0].citaDimPorcentaje != null ? buscarValor(rows[0].citaDimPorcentaje, dimPorcentaje) : 0,
                IntI: rows[0].citaIntI != null ? buscarValor(rows[0].citaIntI, INT) : 0,
                IntE: rows[0].citaIntE != null ? buscarValor(rows[0].citaIntE, INT) : 0,
                IntS: rows[0].citaIntS != null ? buscarValor(rows[0].citaIntS, INT) : 0,
                IntGeneral: rows[0].citaIntGeneral != null ? buscarValor(rows[0].citaIntGeneral, DIM) : 0,
                IntPorcentaje: rows[0].citaIntPorcentaje != null ? buscarValor(rows[0].citaIntPorcentaje, dimPorcentaje) : 0,
                Di: rows[0].citaDi != null ? buscarValor(rows[0].citaDi, DI) : 0,
                Dis: rows[0].citaDIS != null ? buscarValor(rows[0].citaDIS, DIS) : 0,
                Sq1: rows[0].citaSQ1 != null ? buscarValor(rows[0].citaSQ1, VQ) : 0,
                Sq2: rows[0].citaSQ2 != null ? buscarValor(rows[0].citaSQ2, DIM) : 0,
            },
            MundoExterno: {
                DimI: rows[0].fraseDimI != null ? buscarValor(rows[0].fraseDimI, DIM) : 0,
                DimE: rows[0].fraseDimE != null ? buscarValor(rows[0].fraseDimE, DIM) : 0,
                DimS: rows[0].fraseDimS != null ? buscarValor(rows[0].fraseDimS, DIM) : 0,
                DiF: rows[0].fraseDif != null ? buscarValor(rows[0].fraseDif, DIF) : 0,
                DimGeneral: rows[0].fraseDimGeneral != null ? buscarValor(rows[0].fraseDimGeneral, dimGeneral) : 0,
                DimPorcentaje: rows[0].fraseDimPorcentaje != null ? buscarValor(rows[0].fraseDimPorcentaje, dimPorcentaje) : 0,
                IntI: rows[0].fraseIntI != null ? buscarValor(rows[0].fraseIntI, INT) : 0,
                IntE: rows[0].fraseIntE != null ? buscarValor(rows[0].fraseIntE, INT) : 0,
                IntS: rows[0].fraseIntS != null ? buscarValor(rows[0].fraseIntS, INT) : 0,
                IntGeneral: rows[0].fraseIntGeneral != null ? buscarValor(rows[0].fraseIntGeneral, DIM) : 0,
                IntPorcentaje: rows[0].fraseIntPorcentaje != null ? buscarValor(rows[0].fraseIntPorcentaje, dimPorcentaje) : 0,
                Di: rows[0].fraseDi != null ? buscarValor(rows[0].fraseDi, DI) : 0,
                Dis: rows[0].fraseDIS != null ? buscarValor(rows[0].fraseDIS, DIS) : 0,
                Vq1: rows[0].fraseVQ1 != null ? buscarValor(rows[0].fraseVQ1, VQ) : 0,
                Vq2: rows[0].fraseVQ2 != null ? buscarValor(rows[0].fraseVQ2, DIM) : 0,
            },
            Equilibrio: {
                Bqr1: rows[0].BQr1 != null ? buscarValor(rows[0].BQr1, Equilibrio_BQR) : 0,
                Bqr2: rows[0].BQr2 != null ? buscarValor(rows[0].BQr2, Equilibrio_BQR) : 0,
                Bqa1: rows[0].BQa1 != null ? buscarValor(rows[0].BQa1, Equilibrio_BQA) : 0,
                Bqa2: rows[0].BQa2 != null ? buscarValor(rows[0].BQa2,DIM) : 0, 
                Cq1: rows[0].CQ1 != null ? buscarValor(rows[0].CQ1, Equilibrio_CQ1) : 0,
                Cq2: rows[0].CQ2 != null ? buscarValor(rows[0].CQ2, Equilibrio_CQ2) : 0,
            }
        };

         response.render('Psicologos/analisisHartman.ejs', {
            datos: analisisProcesado,
            analisisHartman: rows,
            idGrupo,
            idAspirante,
            idInstitucion
         });
 

     } catch (error) {
         console.error("Error al obtener o procesar los datos de Hartman:", error);
         response.status(500).send("Error al procesar el análisis de Hartman");
     }
};
// Consulta informacion prueba Otis
exports.getPruebaOtis = async (req, res, next) => {
    try {
        // Obtener todas las preguntas de OTIS
        const [preguntasDB] = await InfoPruebas.getPreguntasOtis();
        
        // Obtener todas las opciones
        const [opcionesDB] = await InfoPruebas.getOpcionesOtis();
        
        // Estructurar las preguntas con sus opciones y respuestas correctas
        const preguntasConRespuestas = preguntasDB.map(pregunta => {
            // Filtrar opciones
            const opciones = opcionesDB
                .filter(opcion => opcion.idPreguntaOtis === pregunta.idPreguntaOtis)
                .map(opcion => ({
                    idOpcionOtis: opcion.idOpcionOtis,
                    opcionOtis: opcion.opcionOtis,
                    descripcionOpcion: opcion.descripcionOpcion,
                    esCorrecta: opcion.esCorrecta === 1
                }));

            return {
                idPreguntaOtis: pregunta.idPreguntaOtis,
                numeroPregunta: pregunta.numeroPregunta,
                preguntaOtis: pregunta.preguntaOtis,
                opciones: opciones,
                respuestaCorrecta: opciones.find(opcion => opcion.esCorrecta) || null
            };
        });

        // Ordenar preguntas por num
        preguntasConRespuestas.sort((a, b) => a.numeroPregunta - b.numeroPregunta);

        // Obtener informacion de la prueba
        const [infoPrueba] = await InfoPruebas.getInfoPrueba(5); // ID Otis

        // Renderizar vista
        res.render('Psicologos/infoPruebaOtis', {
            preguntas: preguntasConRespuestas,
            prueba: infoPrueba[0]
        });
    } catch (error) {
        console.error("Error al generar información OTIS:", error);
        res.status(500).render('error', {
            mensaje: 'Error al cargar la guía de respuestas OTIS',
            error: error
        });
    }
};

// Análisis Terman

exports.getRespuestasSerie = async (req, res) => {
    const { idAspirante, idGrupo, idSerie } = req.params;

    try {
        let respuestas = [];

        if ([5, 10].includes(parseInt(idSerie))) {
            // Series de texto libre
            respuestas = await respuestasTermanModel.fetchRespuestasTextoLibre(idAspirante, idGrupo, idSerie);
        } else {
            // Series normales con opciones
            respuestas = await respuestasTermanModel.fetchRespuestasOpciones(idAspirante, idGrupo, idSerie);
        }

        console.log(respuestas);
        return res.json({ success: true, respuestas });
    } catch (error) {
        console.error("Error trayendo respuestas de Terman:", error);
        return res.status(500).json({ success: false, message: "Error interno del servidor." });
    }
};



function obtenerTotalPorSerie(numeroSerie) {
    const totales = {
        1: 16, 2: 22, 3: 30, 4: 18, 5: 24,
        6: 20, 7: 20, 8: 17, 9: 18, 10: 22
    };
    return totales[numeroSerie] || 1; // Por si acaso
}

function reglaDeTres(valor, totalMaximo) {
    return (valor / totalMaximo) * 100;
}

exports.getAnalisisTerman = async (request, response, next) => {
    const idAspirante = request.params.idAspirante;
    const idGrupo = request.params.idGrupo;

    try {
        // console.log("Entró al try de getAnalisisTerman");
        // 1. Buscar calificación
        const calificacionExistente = await calificacionTerman.fetchCalificacionById(idAspirante, idGrupo);
        // console.log("calificacionExistente:", calificacionExistente);

        // 2. Si NO existe, hacemos la calificación
        if (!calificacionExistente || calificacionExistente.length === 0) {
            console.log('No existe análisis previo. Calificando...');

            // Calificar series
            const series = [1,2,3,4,5,6,7,8,9,10];
            for (const idSerie of series) {
                const respuestasAspirante = await respuestasTermanModel.fetchRespuestasSerieById(idAspirante, idGrupo, idSerie);
                if (idSerie >= 1 && idSerie <= 9) {
                    for (const resp of respuestasAspirante) {
                        if (typeof resp.respuestaAbierta === 'string') {
                            resp.respuestaAbierta = parseInt(resp.respuestaAbierta, 10);
                        }
                    }
                }

                // console.log(respuestasAspirante);

                if (respuestasAspirante.length > 0) {
                    await calificarSerieTerman(idSerie, idAspirante, idGrupo, respuestasAspirante);
                }
            }
        }

        // 3. Buscar usuario y análisis ya guardado
        const [rows] = await Aspirante.getInformacionAspirante(idAspirante);
        const aspiranteData = rows[0];
        const calificacion = await calificacionTerman.fetchCalificacionById(idAspirante, idGrupo);
        const series = await resultadoSerieTerman.fetchSeriesById(idAspirante, idGrupo);

        // console.log("AspiranteData: ", aspiranteData)
        // console.log("Calificación: ", calificacion)
        // console.log("Series: ", series)

        if (!aspiranteData || !calificacion || !series || series.length === 0) {
            return response.status(404).send("No se encontraron datos suficientes para el análisis.");
        }

        const resultados = series.map(serie => ({
            numero: serie.idSerieTerman,
            categoria: serie.categoria,
            puntuacion: serie.puntuacion,
            rango: serie.rango,
            porcentaje: reglaDeTres(serie.puntuacion, obtenerTotalPorSerie(serie.idSerieTerman))
        }));
        
        console.log(resultados);

        const resumen = {
            nombreCompleto: `${aspiranteData.nombreUsuario} ${aspiranteData.apellidoPaterno} ${aspiranteData.apellidoMaterno}`,
            puntosTotales: calificacion[0].puntosTotales,
            rango: calificacion[0].rango,
            coeficienteIntelectual: calificacion[0].coeficienteIntelectual
        };
        
        console.log(resumen);

        // 4. Renderizar
        return response.render('Psicologos/analisisTerman', {
            resumen,
            resultados,
            resultadosJSON: JSON.stringify(resultados),
            idAspirante,
            idGrupo,
            idInstitucion: request.params.idInstitucion || null,
        });
        

    } catch (error) {
        console.error('Error en get_analisisTerman:', error);
    }
};
//16PF y Kostick
exports.get_respuestasA = (request, response, next) => {

    const idAspirante = request.params.idAspirante;
    const idPrueba = request.params.idprueba;

  
    Aspirante.getInformacionAspirante(idAspirante).then(([datosAspirante, fieldData]) => {
      Aspirante.fetchGrupo(idAspirante).then(([rows, fieldData]) => {
        Grupo.fetchOne(request.params.idGrupo).then(([grupoRows, fieldData]) => {
          if (idPrueba == 1) {
            ResultadosKostick.fetchAll(request.params.idGrupo, request.params.idAspirante).then(
              ([resultados, fieldData]) => {
                InterpretacionKostick.fetchAll()
                .then((interpretacionesKostick) => {
                    response.render("Psicologos/consultaRespuestasAspirante", {
                        prueba: "El inventario de Percepción Kostick",
                        grupo: grupoRows[0],
                        valores: resultados[0],
                        datos: datosAspirante[0],
                        interpretaciones: interpretacionesKostick[0],
                        idAspirante: request.params.idAspirante || null,
                        idGenero: rows[0],
                        idAspirante: request.params.idAspirante,
                        idGrupo: request.params.idGrupo,
                        idInstitucion: request.params.idInstitucion,
                    });
                })
                .catch((error) => {
                    console.log(error)
                })
              }
            );
          } else if (idPrueba == 2) {
            Resultados16PF.fetchAll(request.params.idGrupo, idAspirante).then(
              ([resultados, fieldData]) => {
                Aspirante.getGenero(request.params.idAspirante)
                .then(([rows, fieldData]) => {
                    response.render("Psicologos/consultaRespuestasAspirante", {
                        prueba: "Personalidad 16 Factores (16 PF)",
                        grupo: grupoRows[0],
                        valores: resultados[0],
                        datos: datosAspirante[0],
                        interpretaciones: null,
                        idAspirante: request.params.idAspirante || null,
                        idGenero: rows[0].idGenero || null,
                        idAspirante: request.params.idAspirante,
                        idGrupo: request.params.idGrupo,
                        idInstitucion: request.params.idInstitucion,
                      });
                })
                .catch((error) => {
                    console.log(error);
                });
              }
            );
          }
        });
      });
    });
};

exports.get_interpretaciones16PF = (request, response, next) => {
    let columna = request.params.columna;
    let nivel = request.params.nivel;
    Interpretaciones16PF.interpretacion(columna, nivel)
    .then(([rows]) => {
        if(rows.length > 0){
            inter = rows[0].resp;
            response.status(200).json({ inter });
        }
    })
    .catch((error) => {
        console.log(error);
    });
}

  // Consulta informacion prueba Colores
    exports.getPruebaColores = async (req, res, next) => {
    try {
        // ID colores
        const idPruebaColores = 6;
        
        // Obtener info general de la prueba
        const [infoPrueba] = await InfoPruebas.getInfoPrueba(idPruebaColores);
        
        // Obtener colores de la base de datos
        const [colores] = await InfoPruebas.getColores();
        
        // Renderizar la vista con los datos
        res.render('Psicologos/infoPruebaColores', {  
            pageTitle: infoPrueba.length > 0 ? infoPrueba[0].nombrePrueba : 'Prueba de Colores',
            infoPrueba: infoPrueba.length > 0 ? infoPrueba[0] : null,
            colores: colores
        });
    } catch (error) {
        console.error('Error al obtener datos de colores:', error);
        next(error);
    }
};

// Cuadernillo Kostick
exports.getCuadernilloKostick = (request, response, next) => {
    const idAspirante = request.params.idAspirante;
    const idGrupo = request.params.idGrupo;
    Aspirante.fetchOne(idAspirante)
    .then(([rows, fieldData]) => {
        const datosAspirante = rows[0];
        Grupo.fetchOne(idGrupo)
        .then(([rows, fieldData]) => {
            const grupo = rows[0];
            PreguntaKostick.fetchAll()
            .then(([rows, fieldData]) => {
                const preguntasKostick = rows;
                RespondeKostick.fetchRespuestasAspirante(idGrupo, idAspirante)
                .then(([rows, fieldData]) => {
                    const resultados = rows;
                    const opciones = resultados.map(r => r.opcionKostick);
                    const descripcionOpciones = resultados.map(r => r.descripcionOpcionKostick);
                    Prueba.getDatosPersonalesAspiranteKostick(idGrupo, idAspirante)
                    .then(([rows, fieldData]) => {
                        const datosPersonales = rows;
                        response.render('Psicologos/cuadernilloKostick', {
                            prueba: "El inventario de Percepción Kostick",
                            grupo: grupo || null,
                            valores: resultados[0][0],
                            datos: datosPersonales || null,
                            aspirante: datosAspirante || null,
                            preguntas: preguntasKostick || [],
                            opciones: opciones || [],
                            descripcion: descripcionOpciones || [],
                            idAspirante: request.params.idAspirante,
                            idInstitucion: request.params.idInstitucion,
                            idGrupo: request.params.idGrupo,
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
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
}

// Cuadernillo 16PF
exports.getCuadernillo16PF = (request, response, next) => {
    const idAspirante = request.params.idAspirante;
    const idGrupo = request.params.idGrupo;
    Aspirante.fetchOne(idAspirante)
    .then(([rows, fieldData]) => {
        const datosAspirante = rows[0];
        Grupo.fetchOne(idGrupo)
        .then(([rows, fieldData]) => {
            const grupo = rows[0];
            Pregunta16PF.fetchAll()
            .then(([rows, fieldData]) => {
                const preguntas16PF = rows;
                Responde16PF.fetchRespuestasAspirante(idGrupo, idAspirante)
                .then(([rows, fieldData]) => {
                    const resultados = rows;
                    const opciones = resultados.map(r => r.opcion16PF);
                    const descripcionOpciones = resultados.map(r => r.descripcionOpcion16PF);
                    Prueba.getDatosPersonalesAspiranteKostick(idGrupo, idAspirante)
                    .then(([rows, fieldData]) => {
                        const datosPersonales = rows;
                        response.render('Psicologos/cuadernillo16PF', {
                            prueba: "Personalidad 16 Factores (16 PF)",
                            grupo: grupo || null,
                            valores: resultados[0][0],
                            datos: datosPersonales || null,
                            aspirante: datosAspirante || null,
                            preguntas: preguntas16PF || [],
                            opciones: opciones || [],
                            descripcion: descripcionOpciones || [],
                            idAspirante: request.params.idAspirante,
                            idInstitucion: request.params.idInstitucion,
                            idGrupo: request.params.idGrupo,
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
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
}
  
