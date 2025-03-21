const { response } = require("express");

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
    try{
        const formData = request.body;

        const respuestas = [];
        for (let i = 1; i <= 51; i++) {
            const preguntaKey = `pregunta_${i}`;
            if (formData[preguntaKey] !== undefined) {
                respuestas.push({
                    numeroPregunta: i,
                    respuesta: formData[preguntaKey]
                });
            }
        }

        console.log("Datos recibidos del formulario:", respuestas);
    }catch (error){
        console.error("Error en postFormatoEntrevista:", error)
    }
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