const { request, response } = require("express");
const FormatoEntrevista = require('../models/formatoDeEntrevista.model');
const ConsultarPruebas = require("../models/consultarPruebas.model");

//Rutas del portal de los Aspirantes
exports.getPruebas = (request, response) => {
    ConsultarPruebas.obtenerPruebas(request.session.idAspirante)
    .then(([rows, fieldData]) => {
        const pruebas  = rows;
        console.log(pruebas);

        response.render('Aspirantes/misPruebas',{
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

exports.getFormatoEntrevista = (request, response, next) => {
    FormatoEntrevista.fetchAll()
    .then(([rows, fieldData]) => {
        const preguntas = rows;

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
    const respuestasParseadas = []; 
    // Obtener las llaves del objeto request.body para separarlas de su valor
    for(let key in request.body){
        const value = request.body[key]; 
        respuestasParseadas.push([request.session.idAspirante, key, value]);
    }

    const respuesta = new FormatoEntrevista(respuestasParseadas);

    respuesta.saveRespuestaAspirante()
    .then(() => {
        response.redirect('/aspirante/respuestas-enviadas')
    }).catch((error) => {
        console.log(error)
    });
    
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