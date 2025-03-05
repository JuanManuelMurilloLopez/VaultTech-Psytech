const express = require('express');
const router = express.Router();

const path = require('path');
const controller = require('../controllers/controller-coordinador');

//Rutas de registros de Psicologos y Coordinadores
router.get('/psicologos-registrados', controller.get_psicologos_registrados);

router.get('/registrar-psicologos', controller.get_registrar_psicologos);

router.get('/editar-psicologos', controller.get_editar_psicologos);

router.get('/coordinadores-registrados', controller.get_coordinadores_registrados);

router.get('/registrar-coordinadores', controller.get_registrar_coordinador);

router.get('/editar-coordinador', controller.get_editar_coordinador);

module.exports = router;