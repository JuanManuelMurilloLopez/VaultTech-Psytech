const express = require('express');
const router = express.Router();

const authMiddleware = require('../util/autenticacionRoles');
router.use(authMiddleware([2]));

const path = require('path');
const controller = require('../controllers/psicologo.controller');

//Rutas del portal de los Psicologos
router.get('/lista-grupos', controller.getListaGrupos);

// Vista con las instituciones registradas
router.get('/catalogo-instituciones', controller.getCatalogoInstituciones);

// Formulario para crear nuevas instituciones
router.get('/registrar-institucion', controller.getRegistrarInstitucion);
router.post('/registrar-institucion', controller.postRegistrarInstitucion);

// Formulario para editar instituciones
router.get('/editar-institucion', controller.getEditarInstitucion);

router.get('/grupos', controller.getGrupos);

//LILI REGISTRAR GRUPO
router.get('/registrar-grupo/:idInstitucion', controller.getRegistrarGrupo); 
router.post('/registrar-grupo/:idInstitucion', controller.postRegistrarGrupo); 

// Vista con los grupos de cierta institución
router.get('/grupos/:idInstitucion', controller.getGrupos);


// EDITAR GRUPOS
router.get('/editar-grupo/:idGrupo/:idInstitucion', controller.getEditarGrupo);
router.post('/editar-grupo/:idGrupo', controller.postEditarGrupo);

// Vista con la información de cierto grupo
router.get('/informacion-grupos/:idGrupo/:idInstitucion', controller.getInformacionGrupo)

// Vista con la información de un aspirante
router.get('/aspirantes/:idAspirante/:idGrupo/:idInstitucion', controller.getAspirante);

router.get('/importar-aspirantes', controller.getImportarAspirantes);

// Formulario para crear nuevos aspirantes
router.get('/registrar-aspirantes/:idGrupo/:idInstitucion', controller.getRegistrarAspirantes);
router.post('/registrar-aspirantes/:idGrupo/:idInstitucion', controller.postRegistrarAspirantes);

// Formulario para editar aspirantes
router.get('/editar-aspirantes', controller.getEditarAspirantes);

// Vista con todas las pruebas
router.get('/catalogo-pruebas', controller.getCatalogoPruebas);

// Vista con información de la prueba Otis
router.get('/prueba-otis', controller.getPruebaOtis);

// Vista con la información de la prueba Colores
router.get('/prueba-colores', controller.getPruebaColores);

// Cuadernillo de respuestas de la prueba OTIS por aspirante
router.get('/cuadernillo-otis/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernilloOtis);

// Vista con el análisis de la prueba otis del aspirante
router.get('/analisis-otis/:idGrupo/:idAspirante/:idInstitucion', controller.getAnalisisOtis);

router.get('/analisis-colores', controller.getAnalisisColores);

router.get('/respuestas-otis', controller.getRespuestasOtis);

module.exports = router;