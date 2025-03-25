const express = require('express');
const router = express.Router();

const authMiddleware = require('../util/autenticacionRoles');
router.use(authMiddleware([3]));

const path = require('path');

const controller = require('../controllers/aspirante.controller');

//Rutas del portal de los Aspirantes
router.get('/mis-pruebas', controller.getMisPruebas);

router.get('/pruebas-pendientes', controller.getPruebasPendientes);

router.get('/pruebas-completadas', controller.getPruebasCompletadas);

router.get('/subir-documentos', controller.getSubirDocumentos);

router.get('/formato-entrevista', controller.getFormatoEntrevista);

router.post('/formato-entrevista', controller.postFormatoEntrevista);

router.get('/formulario-familiar', controller.getFormularioFamiliares);

router.get('/instrucciones-otis', controller.getIntruccionesOtis);

router.get('/intrucciones-colores', controller.getIntruccionesColores);

router.get('/prueba-otis', controller.getPruebaOtis);

router.get('/prueba-colores', controller.getPruebaColores);

router.get('/respuestas-enviadas', controller.getRespuestasEnviadas);

module.exports = router;