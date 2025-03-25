const express = require('express');
const router = express.Router();

const path = require('path');

const controller = require('../controllers/aspirante.controller');

//Rutas del portal de los Aspirantes
router.get('/mis-pruebas', controller.get_mis_pruebas);

router.get('/pruebas-pendientes', controller.get_pruebas_pendientes);

router.get('/pruebas-completadas', controller.get_pruebas_completadas);

router.get('/subir-documentos', controller.get_subir_documentos);

router.get('/formato-entrevista', controller.get_formato_entrevista);

router.get('/instrucciones-otis', controller.get_intrucciones_otis);

router.get('/intrucciones-colores', controller.get_intrucciones_colores);

router.get('/prueba-otis', controller.get_prueba_otis);
router.post('/prueba-otis', controller.obtenerPreguntas);

router.get('/prueba-colores', controller.get_prueba_colores);

router.get('/respuestas-enviadas', controller.get_respuestas_enviadas);

module.exports = router;