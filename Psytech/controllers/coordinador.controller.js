const Coordinador = require('../models/coordinador.model');
const Psicologo = require('../models/psicologo.model');

//Rutas de registros de Psicologos y Coordinadores
exports.getPsicologosRegistrados = (request, response, next) => {
    Psicologo.fetchAll()
    .then(([rows, fieldData]) => {
        const listaPsicologos = rows;
        response.render('Coordinadores/listaPsicologos',{
            listaPsicologos: listaPsicologos || [],
        });
    })
    .catch((error) => {
        console.log('Error al obtener psicologos:', error);
    });
};

exports.getRegistrarPsicologos = (request, response, next) => {
    Psicologo.fetchAll()
    .then(([rows, fieldData]) => {
        const psicologos = rows;
        response.render('Coordinadores/registrarPsicologo', {
            psicologos: psicologos || [],
        });
    })
    .catch((error) => {
        console.log('Error al obtener psicologos:', error);
    });
};

exports.postRegistrarPsicologos = (request, response, next) => {
    const { correo, nombrePsicologo, apellidoPaterno, apellidoMaterno, lada, numero } = request.body;

    Psicologo.correoExiste(correo)
    .then((existe) => {

        if (existe) {
            return response.render('psicologos/registrarPsicologo', {
                error: 'El correo ya está registrado.'
            });
        }

        const psicologo = new Psicologo(
            correo, // usuario
            1,
            nombrePsicologo,
            apellidoPaterno,
            apellidoMaterno,
            correo, // correo electrónico
            lada,
            numero,
            2
        );

        console.log('Guardando psicólogo:', psicologo);

        return psicologo.savePsicologo()
            .then(() => {
                exports.getPsicologosRegistrados(request, response, next);
            });
    })
    .catch((error) => {
        console.log('Error al guardar psicólogo:', error);
    });
};

exports.getEditarPsicologos = (request, response, next) => {
    response.render('Coordinadores/editarPsicologo');
};

exports.getCoordinadoresRegistrados = (request, response, next) => {
    Coordinador.fetchAll()
    .then(([rows, fieldData]) => {
        const listaCoordinadores = rows;
        response.render('Coordinadores/listaCoordinadores',{
            listaCoordinadores: listaCoordinadores || [],
        });
    })
    .catch((error) => {
        console.log('Error al obtener coordinador:', error);
    });
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
    const { correo, nombreCoordinador, apellidoPaterno, apellidoMaterno, lada, numero } = request.body;

    Coordinador.correoExiste(correo)
    .then((existe) => {

        if (existe) {
            return response.render('coordinadores/registrarCoordinador', {
                error: 'El correo ya está registrado.'
            });
        }

        const coordinador = new Coordinador(
            correo, // usuario
            1,
            nombreCoordinador,
            apellidoPaterno,
            apellidoMaterno,
            correo, // correo electronico
            lada,
            numero,
            1
        );

        console.log('Guardando coordinador:', coordinador);

        return coordinador.saveCoordinador()
            .then(() => {
                exports.getCoordinadoresRegistrados(request, response, next);
            });
    })
    .catch((error) => {
        console.log('Error al guardar coordinador:', error);
    });
};


exports.getEditarCoordinador = (request, response, next) => {
    response.render('Coordinadores/editarCoordinador');
};
