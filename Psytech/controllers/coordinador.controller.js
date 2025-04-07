const Coordinador = require('../models/coordinador.model');

//Rutas de registros de Psicologos y Coordinadores
exports.getPsicologosRegistrados = (request, response, next) => {
    response.render('Coordinadores/listaPsicologos');
};

exports.getRegistrarPsicologos = (request, response, next) => {
    response.render('Coordinadores/registrarPsicologo');
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
