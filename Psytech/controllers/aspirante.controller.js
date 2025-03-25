//Rutas del portal de los Aspirantes
exports.get_mis_pruebas = (request, response, next) => {
    response.render('Aspirantes/misPruebas');
};

exports.get_pruebas_pendientes = (request, response, next) => {
    response.render('Aspirantes/pruebasPendientes');
};

exports.get_pruebas_completadas = (request, response, next) => {
    response.render('Aspirantes/pruebasCompletadas');
};

exports.get_subir_documentos = (request, response, next) => {
    response.render('Aspirantes/subirDocumentos');
};

exports.get_formato_entrevista = (request, response, next) => {
    response.render('Aspirantes/formatoDeEntrevista');
};

exports.get_intrucciones_otis = (request, response, next) => {
    response.render('Aspirantes/instruccionesOtis');
};

exports.get_intrucciones_colores = (request, response, next) => {
    response.send('Instrucciones de la Prueba Colores');
};

exports.get_prueba_otis = (request, response, next) => {
    response.render('Aspirantes/pruebaOtis');
};

exports.get_prueba_colores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.get_respuestas_enviadas = (request, response, next) => {
    response.send('Respuestas enviadas');
};

const PreguntaOtis = require('../models/preguntasOtis.model.js');
const OpcionOtis = require('../models/opcionOtis.model.js');

exports.obtenerPreguntas = async (req, res) => {
    try {
        const [preguntasDB] = await PreguntaOtis.fetchAll();
        const [opcionesDB] = await OpcionOtis.fetchAll();

        const preguntas = preguntasDB.map(pregunta => {
            const opciones = opcionesDB
                .filter(opcion => opcion.idPreguntaOtis === pregunta.idPreguntaOtis)
                .map(opcion => opcion.descripcionOpcion);

            const respuestaCorrecta = opcionesDB.find(opcion => 
                opcion.idPreguntaOtis === pregunta.idPreguntaOtis && opcion.esCorrecta === 1
            )?.descripcionOpcion;

            return {
                num: pregunta.numeroPregunta,
                pregunta: pregunta.preguntaOtis,
                respuesta: respuestaCorrecta,
                opciones: opciones
            };
        });

        return res.json({ preguntas });
    } catch (error) {
        console.error("Error obteniendo preguntas:", error);
    }
};
