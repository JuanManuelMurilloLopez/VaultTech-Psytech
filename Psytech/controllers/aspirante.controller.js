const { request, response } = require("express");
const FormatoEntrevista = require('../models/formatoDeEntrevista.model');

//Rutas del portal de los Aspirantes
exports.getMisPruebas = (request, response, next) => {
    response.render('Aspirantes/misPruebas');
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

exports.getFormatoEntrevista = (request, response, next) => {
    FormatoEntrevista.fetchAll()
    .then(([rows, fieldData]) => {
        const preguntas = rows;

        console.log(preguntas[0])

        response.render('Aspirantes/formatoDeEntrevista',{
            preguntas: preguntas || [],
        });
    })

    .catch((error) => {
        console.log(error);
    })
};

exports.postFormatoEntrevista = (request, response, next) => {
    // Array para almacenar respuestas del formato de entrevista
    const respuestas = []; 
    // Obtener las llaves del objeto request.body para separarlas de su valor
    const respuesta = request.body[pregunta];
    respuestas.push([request.session.idAspirante, idPregunta, respuesta]);
    
    console.log(respuestas);

    const nuevoFormato = new RespuestaAspirante(respuestas);
};

exports.getIntruccionesOtis = (request, response, next) => {
    response.render('Aspirantes/instruccionesOtis');
};

exports.getIntruccionesColores = (request, response, next) => {
    response.send('Instrucciones de la Prueba Colores');
};

exports.getPruebaOtis = (request, response, next) => {
    response.render('Aspirantes/pruebaOtis');
};

exports.getPruebaColores = (request, response, next) => {
    response.send('Prueba Colores');
};

exports.getRespuestasEnviadas = (request, response, next) => {
    response.send('Respuestas enviadas');
};