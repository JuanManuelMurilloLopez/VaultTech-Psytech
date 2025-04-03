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


// Formulario para editar grupos
router.get('/editar-grupo', controller.getEditarGrupo);

// Vista con la información de cierto grupo
router.get('/informacion-grupos/:idGrupo', controller.getInformacionGrupo)

router.get('/aspirantes', controller.getAspirantes);

router.get('/importar-aspirantes', controller.getImportarAspirantes);

// Formulario para crear nuevos aspirantes
router.get('/registrar-aspirantes/:idGrupo', controller.getRegistrarAspirantes);
router.post('/registrar-aspirantes/:idGrupo', controller.postRegistrarAspirantes);

// Formulario para editar aspirantes
router.get('/editar-aspirantes', controller.getEditarAspirantes);

// Vista con todas las pruebas
router.get('/catalogo-pruebas', controller.getCatalogoPruebas);

// Vista con información de la prueba Otis
router.get('/prueba-otis', controller.getPruebaOtis);

// Vista con la información de la prueba Colores
router.get('/prueba-colores', controller.getPruebaColores);

// Vista con el análisis de la prueba otis del aspirante
router.get('/analisis-otis/:idGrupo/:idAspirante', controller.getAnalisisOtis);

router.get('/analisis-colores', controller.getAnalisisColores);

router.get('/respuestas-otis', controller.getRespuestasOtis);

module.exports = router;