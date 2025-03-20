const express = require('express');
const router = express.Router();

const path = require('path');
const controller = require('../controllers/coordinador.controller');

//Rutas de registros de Psicologos y Coordinadores
router.get('/psicologos-registrados', controller.getPsicologosRegistrados);

router.get('/registrar-psicologo', controller.getRegistrarPsicologos);

router.get('/editar-psicologo', controller.getEditarPsicologos);

router.get('/coordinadores-registrados', controller.getCoordinadoresRegistrados);

router.get('/registrar-coordinador', controller.getRegistrarCoordinador);

router.get('/editar-coordinador', controller.getEditarCoordinador);

module.exports = router;