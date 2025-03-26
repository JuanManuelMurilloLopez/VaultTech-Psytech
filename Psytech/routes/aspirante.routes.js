const express = require('express');
const router = express.Router();

const authMiddleware = require('../util/autenticacionRoles');
router.use(authMiddleware([3]));

const path = require('path');

const controller = require('../controllers/aspirante.controller');


//Rutas del portal de los Aspirantes
router.get('/mis-pruebas', controller.getPruebas);

router.get('/pruebas-pendientes', controller.getPruebasPendientes);

router.get('/pruebas-completadas', controller.getPruebasCompletadas);

router.get('/subir-documentos', controller.getSubirDocumentos);

router.get('/formato-entrevista', controller.getFormatoEntrevista);

router.post('/formato-entrevista', controller.postFormatoEntrevista);

router.get('/instrucciones-otis', controller.getIntruccionesOtis);

router.get('/instrucciones-hartman', controller.get_instrucciones_hartman);

router.get('/instrucciones-terman', controller.get_instrucciones_terman);

router.get('/instrucciones-colores', controller.get_intrucciones_colores);
router.post('/prueba-colores/instrucciones', controller.post_datos_colores_en_sesion);
router.get('/datos-personales-colores', controller.get_datos_personales_colores);

router.get('/prueba-otis', controller.getPruebaOtis);

router.get('/prueba-colores', controller.get_prueba_colores);
router.post('/guardar-selecciones-colores', controller.post_guardar_selecciones_colores);


router.get('/respuestas-enviadas', controller.getRespuestasEnviadas);

module.exports = router;