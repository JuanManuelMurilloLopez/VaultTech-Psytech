const { request, response } = require("express");
const RespuestaAspirante = require('../models/formatoDeEntrevista.model');

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
    response.render('Aspirantes/formatoDeEntrevista');
};

exports.postFormatoEntrevista = (request, response, next) => {
    // Array para almacenar respuestas del formato de entrevista
    const respuestas = []; 
    // Obtener las llaves del objeto request.body para separarlas de su valor
    Object.keys(request.body).forEach(pregunta => {
        if (pregunta.startsWith('pregunta_')) {
        const idPregunta = pregunta.split('_')[1]; 
        const respuesta = request.body[pregunta];
        
        respuestas.push([idPregunta, respuesta]);
        }
    });
    console.log(respuestas);

    const nuevoFormato = new RespuestaAspirante(request.session.idAspirante, request.body.respuestas);

    nuevoFormato.save()
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