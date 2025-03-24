const express = require('express');
const router = express.Router();

const authMiddleware = require('../util/autenticacionRoles');
router.use(authMiddleware([2]));

const path = require('path');
const controller = require('../controllers/psicologo.controller');

//Rutas del portal de los Psicologos
router.get('/principal', controller.getPrincipalPsicologos);

router.get('/catalogo-instituciones', controller.getCatalogoInstituciones);

router.get('/registrar-institucion', controller.getRegistrarInstitucion);

router.get('/editar-institucion', controller.getEditarInstitucion);

router.get('/grupos', controller.getGrupos);

//LILI REGISTRAR GRUPO
router.get('/registrar-grupo', controller.getRegistrarGrupo); 
router.post('/registrar-grupo', controller.postRegistrarGrupo); 


router.get('/editar-grupo', controller.getEditarGrupo);

router.get('/aspirantes', controller.getAspirantes);

router.get('/importar-aspirantes', controller.getImportarAspirantes);

router.get('/registrar-aspirantes', controller.getRegistrarAspirantes);

router.get('/editar-aspirantes', controller.getEditarAspirantes);

router.get('/catalogo-pruebas', controller.getCatalogoPruebas);

router.get('/prueba-otis', controller.getPruebaOtis);

router.get('/prueba-colores', controller.getPruebaColores);

router.get('/analisis-otis', controller.getAnalisisOtis);

router.get('/analisis-colores', controller.getAnalisisColores);

router.get('/respuestas-otis', controller.getRespuestasOtis);

module.exports = router;