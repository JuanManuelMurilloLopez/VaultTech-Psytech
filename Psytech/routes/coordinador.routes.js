const express = require('express');
const router = express.Router();

const authMiddleware = require('../util/autenticacionRoles');
router.use(authMiddleware([1]));

const path = require('path');
const controller = require('../controllers/coordinador.controller');

//Rutas de registros de Psicologos y Coordinadores
router.get('/psicologos-registrados', controller.getPsicologosRegistrados);

router.get('/registrar-psicologo', controller.getRegistrarPsicologos);
router.post('/registrar-psicologo', controller.postRegistrarPsicologos);

router.get('/editar-psicologo/:idUsuario', controller.getEditarPsicologo);
router.post('/editar-psicologo/:idUsuario', controller.postEditarPsicologo);

router.get('/coordinadores-registrados', controller.getCoordinadoresRegistrados);

router.get('/registrar-coordinador', controller.getRegistrarCoordinador);
router.post('/registrar-coordinador', controller.postRegistrarCoordinador);

router.get('/editar-coordinador/:idUsuario', controller.getEditarCoordinador);
router.post('/editar-coordinador/:idUsuario', controller.postEditarCoordinador);

module.exports = router;