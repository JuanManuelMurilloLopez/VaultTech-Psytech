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
router.get('/editar-institucion/:idInstitucion', controller.getEditarInstitucion);
router.post('/editar-institucion/:idInstitucion', controller.postEditarInstitucion);

router.get('/grupos', controller.getGrupos);

//LILI REGISTRAR GRUPO
router.get('/registrar-grupo/:idInstitucion', controller.getRegistrarGrupo);
router.post('/registrar-grupo/:idInstitucion', controller.postRegistrarGrupo);

// Vista con los grupos de cierta institución
router.get('/grupos/:idInstitucion', controller.getGrupos);


// EDITAR GRUPOS
router.get('/editar-grupo/:idGrupo/:idInstitucion', controller.getEditarGrupo);
router.post('/editar-grupo/:idGrupo', controller.postEditarGrupo);

// EDITA SOLO ESTATUS DE GRUPO
router.post('/actualizar-estatus-grupo/:idGrupo', controller.postActualizarEstatusGrupo);

// Vista con la información de cierto grupo
router.get('/informacion-grupos/:idGrupo/:idInstitucion', controller.getInformacionGrupo);
router.get('/buscar-aspirantes/:idGrupo/:valor', controller.buscarAspirantes);

// Vista con la información de un aspirante
router.get('/aspirantes/:idAspirante/:idGrupo/:idInstitucion', controller.getAspirante);

router.get('/importar-aspirantes/:idInstitucion/:idGrupo', controller.getImportarAspirantes);
router.post('/importar-aspirantes/:idInstitucion/:idGrupo', controller.postImportarAspirantes);

// Formulario para crear nuevos aspirantes
router.get('/registrar-aspirantes/:idGrupo/:idInstitucion', controller.getRegistrarAspirantes);
router.post('/registrar-aspirantes/:idGrupo/:idInstitucion', controller.postRegistrarAspirantes);

// Formulario para editar aspirantes
router.get('/editar-aspirante/:idInstitucion/:idGrupo/:idAspirante', controller.getEditarAspirantes);
router.post('/editar-aspirante/:idInstitucion/:idGrupo/:idAspirante', controller.postEditarAspirantes);

// Consultar respuestas de aspirante de formato de entrevista
router.get('/respuestas-formato-entrevista/:idGrupo/:idAspirante/:idInstitucion', controller.getRespuestasFormatoEntrevista);

// Consultar informacion familair de un aspirante
router.get('/informacion-familiares/:idGrupo/:idAspirante/:idInstitucion', controller.getInformacionFamiliar);

// Vista con todas las pruebas
router.get('/catalogo-pruebas', controller.getCatalogoPruebas);

// Vista con información de la prueba Kostick
router.get('/prueba-kostick', controller.getPruebaKostick);

//Vista con la información de la prueba 16PF
router.get('/prueba-16pf', controller.getPrueba16pf);

// Vista con información de la prueba Otis
router.get('/prueba-otis', controller.getPruebaOtis);

// Vista con la información de la prueba Colores
router.get('/prueba-colores', controller.getPruebaColores);

// Informacion de la prueba Terman
router.get('/prueba-terman', controller.getPruebaTerman);

// Vista con la información de la prueba Hartman
router.get('/prueba-hartman', controller.getPruebaHartman);

// Cuadernillo de respuestas de la prueba OTIS por aspirante
router.get('/cuadernillo-otis/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernilloOtis);

// Vista con el análisis de la prueba otis del aspirante
router.get('/analisis-otis/:idGrupo/:idAspirante/:idInstitucion', controller.getAnalisisOtis);

// Vista con el análisis de la prueba Colores del aspirante
router.get('/analisis-colores/:idGrupo/:idAspirante/:idInstitucion', controller.getAnalisisColores);
// CUADERNILLO COLORES
router.get('/cuadernillo-colores/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernilloColores);

router.get('/respuestas-otis', controller.getRespuestasOtis);

// Vista con el análisis de la prueba Hartman del aspirante
router.get('/analisis-hartman/:idGrupo/:idAspirante/:idInstitucion', controller.getAnalisisHartman);

// 16Pf y KOSTICK
router.get("/analisis-16PF/:idprueba/:idGrupo/:idAspirante/:idInstitucion", controller.get_respuestasA);
router.get("/analisis-KOSTICK/:idprueba/:idGrupo/:idAspirante/:idInstitucion", controller.get_respuestasA);
router.get('/cuadernillo-KOSTICK/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernilloKostick);
router.get('/cuadernillo-16PF/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernillo16PF);

router.get("/interpretacion/:idAspirante/:columna/:nivel", controller.get_interpretaciones16PF);

// Rutas de terman

// Ruta para obtener las respuestas de una serie Terman por INDIVIDUAL
router.get('/analisis-terman/:idAspirante/:idGrupo/serie/:idSerie', controller.getRespuestasSerie);
router.get('/analisis-terman/:idGrupo/:idAspirante/:idInstitucion', controller.getAnalisisTerman);
router.get('/analisis-terman/:idAspirante/:idGrupo/Test%20de%20Aptitud%20Mental%20TERMAN', controller.getAnalisisTerman);
router.get('/cuadernillo-terman/:idGrupo/:idAspirante/:idInstitucion', controller.getCuadernilloTerman);

//Rutas para reiniciar pruebas
router.post('/aspirantes/reiniciar-otis/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarOtis);
router.post('/aspirantes/reiniciar-colores/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarColores);
router.post('/aspirantes/reiniciar-hartman/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarHartman);
router.post('/aspirantes/reiniciar-16pf/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciar16pf);
router.post('/aspirantes/reiniciar-kostick/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarKostick);
router.post('/aspirantes/reiniciar-terman/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarTerman);

router.post('/aspirantes/formato-entrevista/reiniciar/:idAspirante/:idGrupo/:idInstitucion', controller.postReiniciarFormato);

router.get('/psicologos-registrados', controller.getPsicologosRegistrados);
router.get('/registrar-psicologo', controller.getRegistrarPsicologos);
router.post('/registrar-psicologo', controller.postRegistrarPsicologos);
router.get('/editar-psicologo/:idUsuario', controller.getEditarPsicologo);
router.post('/editar-psicologo/:idUsuario', controller.postEditarPsicologo);

// MODIFICACIONES PARA NOTIFICACIONES (Ruta para solicitar documentos individualmente)
router.post('/solicitar-documentos/:idInstitucion/:idGrupo/:idAspirante',
    controller.postSolicitarDocumentos
);

router.post('/grupos/:idGrupo/meeting', controller.createGroupMeeting);
router.post('/grupos/:idGrupo/meeting/:idReunion', controller.updateGroupMeeting);
router.post('/grupos/:idGrupo/meeting/:idReunion/delete', controller.deleteGroupMeeting);

router.post('/aspirantes/eliminar/:idAspirante/:idGrupo/:idInstitucion', controller.postEliminarAspirante);
router.post('/grupos/eliminar/:idGrupo/:idInstitucion', controller.postEliminarGrupo);
router.post('/instituciones/eliminar/:idInstitucion', controller.PostEliminarInstitucion);

module.exports = router;