const { request, response } = require("express");
const FormatoEntrevista = require('../models/formatoDeEntrevista.model');
const ConsultarPruebas = require("../models/consultarPruebas.model");
const SeleccionesColores = require('../models/seleccionesColores.model');
const db = require('../util/database');
const { v4: uuidv4 } = require('uuid');


// == RUTAS

exports.getPruebas = (request, response) => {
    ConsultarPruebas.fetchAll(request.session.idAspirante)
        .then(([rows, fieldData]) => {
            const pruebas = rows;
            response.render('Aspirantes/misPruebas', {
                pruebas: pruebas || [],
            });
        })
        .catch((error) => {
            console.log(error);
        });
};

exports.getPruebasPendientes = (request, response, next) => {
    response.render('Aspirantes/pruebasPendientes');
};

exports.getPruebasCompletadas = (request, response, next) => {
    response.render('Aspirantes/pruebasCompletadas');
};

exports.getSubirDocumentos = (request, response, next) => {
    response.render('Aspirantes/subirDocumentos');
};


// == FORMATO ENTREVISTA

exports.getFormatoEntrevista = (request, response, next) => {
    FormatoEntrevista.fetchAll()
        .then(([rows, fieldData]) => {
            const preguntas = rows;
            response.render('Aspirantes/formatoDeEntrevista', {
                preguntas: preguntas || [],
            });
        })
        .catch((error) => {
            console.log(error);
        });
};

exports.postFormatoEntrevista = (request, response, next) => {
    const respuestasParseadas = [];
    for (let key in request.body) {
        const value = request.body[key];
        respuestasParseadas.push([request.session.idAspirante, key, value]);
    }

    const respuesta = new FormatoEntrevista(respuestasParseadas);

    respuesta.saveRespuestaAspirante()
        .then(() => {
            response.redirect('/aspirante/respuestas-enviadas');
        }).catch((error) => {
            console.log(error);
        });
};


// == INSTRUCCIONES Y VISTAS

exports.getIntruccionesOtis = (request, response, next) => {
    response.render('Aspirantes/instruccionesOtis');
};

exports.get_instrucciones_hartman = (request, response, next) => {
    response.send('Aspirantes/instruccionesHartman');
};

exports.get_instrucciones_terman = (request, response, next) => {
    response.send('Aspirantes/instruccionesTerman');
};

exports.get_intrucciones_colores = (request, response, next) => {
    response.render('Aspirantes/instruccionesColores');
};

exports.get_datos_personales_colores = (request, response, next) => {
    response.render('Aspirantes/datosPersonalesColores');
};

exports.getPruebaOtis = (request, response, next) => {
    response.render('Aspirantes/pruebaOtis');
};

exports.get_prueba_colores = (req, res, next) => {
    res.render('Aspirantes/pruebaColores');
};


// == DATOS PERSONALES (POST)

console.log("Controlador cargado correctamente");

// Guardar datos personales del aspirante
exports.post_datos_colores_en_sesion = async (req, res, next) => {
    console.log("Controlador cargado correctamente");
  
    try {
      const idUsuario = req.session.user?.idUsuario;  // Tener idUsuario desde la sesion
      console.log("idUsuario desde sesión:", idUsuario);  // Checar que idUsuario esta bien almacenado en la sesion
  
      const { nombre, apellidoPaterno, apellidoMaterno, postgrado } = req.body;
      const idPrueba = 8;
  
      // Checar que no haya campos vacios
      if (!idUsuario || !nombre || !apellidoPaterno || !apellidoMaterno || !postgrado) {
        return res.status(400).send("Faltan datos obligatorios.");
      }
  
      // Buscar ID del aspirante
      const [aspirante] = await db.execute(
        'SELECT idAspirante FROM aspirantes WHERE idUsuario = ?',
        [idUsuario]
      );
  
      console.log("Resultado de la consulta de aspirante:", aspirante);  // Checa que la consulta devuelve el idAspirante
  
      if (aspirante.length === 0) {
        return res.status(404).send('Aspirante no encontrado');
      }
  
      const idAspirante = aspirante[0].idAspirante;
  
      // Buscar grupo del aspirante
      const [grupo] = await db.execute(
        'SELECT idGrupo FROM gruposAspirantes WHERE idAspirante = ?',
        [idAspirante]
      );
  
      console.log("Resultado de la consulta de grupo:", grupo);  // Checa que la consulta devuelve el idGrupo
  
      if (grupo.length === 0) {
        return res.status(404).send('Grupo no encontrado');
      }
  
      const idGrupo = grupo[0].idGrupo;
  
      // Guardar en sesion
      req.session.idAspirante = idAspirante;
      req.session.idGrupo = idGrupo;
      req.session.nombre = nombre;
      req.session.apellidoPaterno = apellidoPaterno;
      req.session.apellidoMaterno = apellidoMaterno;
      req.session.puestoSolicitado = postgrado;
  
      // Checa si ya existe el registro
      const [existe] = await db.execute(
        'SELECT * FROM datosPersonales WHERE idGrupo = ? AND idPrueba = ? AND idAspirante = ?',
        [idGrupo, idPrueba, idAspirante]
      );
  
      console.log("Registro existente en datosPersonales:", existe);  // Checa si ya existe un registro para los datos personales
  
      if (existe.length === 0) {
        // Inserta los datos en la tabla datosPersonales
        await db.execute(`
          INSERT INTO datosPersonales (
            idDatosPersonales,
            idGrupo,
            idPrueba,
            idAspirante,
            nombre,
            apellidoPaterno,
            apellidoMaterno,
            puestoSolicitado,
            fecha
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE())
        `, [
          uuidv4(),
          idGrupo,
          idPrueba,
          idAspirante,
          nombre,
          apellidoPaterno,
          apellidoMaterno,
          postgrado
        ]);
      }
  
      // Redirigir a la prueba de colores
      res.redirect('/aspirante/prueba-colores');
  
    } catch (err) {
      console.error("ERROR EN post_datos_colores_en_sesion");
      console.error(err.message);
      console.error(err.stack);
      res.status(500).send('Error del servidor');
    }
  };


// == CONFIRMACIÓN FINAL

exports.post_guardar_selecciones_colores = async (req, res, next) => {
    const selecciones = req.body.selecciones; // Accede a 'selecciones'
    const idAspirante = req.session.idAspirante;
    const idGrupo = req.session.idGrupo;
    const idPrueba = 8; // ID de la prueba de colores

    console.log("Selecciones recibidas en el backend:", selecciones);

    if (!idAspirante || !idGrupo) {
        return res.status(400).json({ error: "Faltan datos de sesión" });
    }

    if (!Array.isArray(selecciones) || selecciones.length !== 16) {
        return res.status(400).json({ error: "Número incorrecto de selecciones" });
    }

    try {
        for (const sel of selecciones) {
            await SeleccionesColores.insertarSeleccionColor({
                idPrueba,
                idAspirante,
                idGrupo,
                idColor: sel.idColor,
                posicion: sel.posicion,
                fase: sel.fase,
            });
        }

        res.json({ mensaje: "Selecciones guardadas correctamente" });
    } catch (error) {
        console.error("Error al guardar selecciones:", error);
        res.status(500).json({ error: "Error al guardar selecciones" });
    }
};


  

exports.getRespuestasEnviadas = (request, response, next) => {
    response.render('Aspirantes/respuestasEnviadas');
};
