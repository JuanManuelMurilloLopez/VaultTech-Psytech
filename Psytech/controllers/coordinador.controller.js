const Coordinador = require('../models/coordinador.model');
const Psicologo = require('../models/psicologo.model');

//Rutas de registros de Psicologos y Coordinadores
exports.getPsicologosRegistrados = (request, response, next) => {
    response.render('Coordinadores/listaPsicologos');
};

exports.getRegistrarPsicologos = (request, response, next) => {
    Psicologo.fetchAll()
    .then(([rows, fieldData]) => {
        const psicologos = rows;
        response.render('Coordinadores/registrarPsicologo', {
            coordinadores: psicologos || [],
        });
    })
    .catch((error) => {
        console.log('Error al obtener psicologos:', error);
    });
};

exports.postRegistrarPsicologos = (request, response, next) => {
    const { correo, nombrePsicologo, apellidoPaterno, apellidoMaterno, numero } = request.body;
   
    const psicologo = new Psicologo(
        correo, // usuario
        1,
        nombrePsicologo,
        apellidoPaterno,
        apellidoMaterno,
        correo, // correo electronico
        '+052',
        numero,
        2
    );
    
    console.log('Guardando psicologo:', psicologo);
    psicologo.savePsicologo()
   .then(() => {
        exports.getPsicologosRegistrados(request, response, next);
   })
   .catch((error) => {
        console.log('Error al guardar psicologo:', error);
    });
};

exports.getEditarPsicologos = (request, response, next) => {
    response.render('Coordinadores/editarPsicologo');
};

exports.getCoordinadoresRegistrados = (request, response, next) => {
    response.render('Coordinadores/listaCoordinadores');
};

exports.getRegistrarCoordinador = (request, response, next) => {
    Coordinador.fetchAll()
    .then(([rows, fieldData]) => {
        const coordinadores = rows;
        response.render('Coordinadores/registrarCoordinador', {
            coordinadores: coordinadores || [],
        });
    })
    .catch((error) => {
        console.log('Error al obtener coordinadores:', error);
    });
};


exports.postRegistrarCoordinador = (request, response, next) => {
    const { correo, nombreCoordinador, apellidoPaterno, apellidoMaterno, numero } = request.body;
   
    const coordinador = new Coordinador(
        correo, // usuario
        1,
        nombreCoordinador,
        apellidoPaterno,
        apellidoMaterno,
        correo, // correo electronico
        '+052',
        numero,
        1
    );
    
    console.log('Guardando coordinador:', coordinador);
   coordinador.saveCoordinador()
   .then(() => {
        exports.getCoordinadoresRegistrados(request, response, next);
   })
   .catch((error) => {
        console.log('Error al guardar coordinador:', error);
    });
};

exports.getEditarCoordinador = (request, response, next) => {
    response.render('Coordinadores/editarCoordinador');
};
