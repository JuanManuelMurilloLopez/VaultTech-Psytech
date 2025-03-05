const express = require('express');
const router = express.Router();

const path = require('path');
const controller = require('../controllers/controller-psicologo');

//Rutas del portal de los Psicologos
router.get('/principal', controller.get_principal_psicologos);

router.get('/catalogo-instituciones', controller.get_catalogo_instituciones);

router.get('/registrar-institucion', controller.get_registrar_institucion);

router.get('/editar-institucion', controller.get_editar_institucion);

router.get('/grupos', controller.get_grupos);

router.get('/registrar-grupo', controller.get_registrar_grupo);

router.get('/editar-grupo', controller.get_editar_grupo);

router.get('/aspirantes', controller.get_aspirantes);

router.get('/importar-aspirantes', controller.get_importar_aspirantes);

router.get('/registrar-aspirantes', controller.get_registrar_aspirantes);

router.get('/editar-aspirantes', controller.get_editar_aspirantes);

router.get('/prueba-otis', controller.get_prueba_otis);

router.get('/prueba-colores', controller.get_prueba_colores);

router.get('/analisis-otis', controller.get_analisis_otis);

router.get('/analisis-colores', controller.get_analisis_colores);

router.get('/catalogo-pruebas', controller.get_catalogo_pruebas);

module.exports = router;