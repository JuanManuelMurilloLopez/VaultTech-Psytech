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

//Rutas para subir los expedientes personales
router.get('/cargar-expedientes', controller.getCargarExpedientes);
router.post('/cargar-expedientes', controller.postCargarExpedientes);

router.get('/formato-entrevista', controller.getFormatoEntrevista);
router.post('/formato-entrevista', controller.postFormatoEntrevista);

router.get('/formulario-familiar', controller.getFormularioFamiliares);
router.post('/formulario-familiar', controller.postFormularioFamiliares)

router.get('/instrucciones-otis', controller.getIntruccionesOtis);
router.post('/instrucciones-otis', controller.postInstruccionesOtis);
router.get('/datos-personales-otis', controller.getDatosPersonalesOtis);
router.post('/datos-personales-otis', controller.postDatosPersonalesOtis);

router.get('/prueba-otis', controller.getPruebaOtis);
router.post('/prueba-otis', controller.obtenerPreguntas);
router.post('/prueba-otis', controller.postPruebaOtis);
router.post('/guardar-selecciones-otis', controller.postGuardarRespuestas);
router.get('/prueba-completada', controller.getPruebaCompletada);

//router.get('/instrucciones-hartman', controller.get_instrucciones_hartman);

//router.get('/instrucciones-terman', controller.get_instrucciones_terman);

router.get('/instrucciones-colores', controller.getInstruccionesColores);
router.post('/instrucciones-colores', controller.postInstruccionesColores);
router.get('/datos-personales-colores', controller.getDatosPersonalesColores);
router.post('/datos-personales-colores', controller.postDatosPersonalesColores);

router.get('/prueba-colores', controller.getPruebaColores);
router.post('/prueba-colores', controller.postPruebaColores);
router.post('/guardar-selecciones-colores', controller.postGuardarSeleccionesColores);
router.get('/prueba-completada', controller.getPruebaCompletada);

router.get('/respuestas-enviadas', controller.getRespuestasEnviadas);

module.exports = router;