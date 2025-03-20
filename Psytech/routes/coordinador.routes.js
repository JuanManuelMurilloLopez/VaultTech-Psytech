const express = require('express');
const router = express.Router();

const path = require('path');
const controller = require('../controllers/coordinador.controller');

// Middleware de autenticación y autorización
function verificarSesionCoordinador(request, response, next) {
    if (request.session.user && request.session.user.rol === 'coordinador') {
        return next();
    } else {
        response.redirect('/login');
    }
}

//Rutas de registros de Psicologos y Coordinadores
router.get('/psicologos-registrados', controller.get_psicologos_registrados);

router.get('/registrar-psicologo', controller.get_registrar_psicologos);

router.get('/editar-psicologo', controller.get_editar_psicologos);

router.get('/coordinadores-registrados', controller.get_coordinadores_registrados);

router.get('/registrar-coordinador', controller.get_registrar_coordinador);

router.get('/editar-coordinador', controller.get_editar_coordinador);

module.exports = router;