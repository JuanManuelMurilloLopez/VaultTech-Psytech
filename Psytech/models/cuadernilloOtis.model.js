const db = require('../util/database');

module.exports = class Cuadernillo{
    
    // Obtiene las respuestas correctas que el aspirante tuvo en la prueba
    static getRespuestasCorrectas(idGrupo, idAspirante){
        return db.execute (`SELECT COUNT(*) AS RespuestasCorrectas 
            FROM respuestaOtisAspirante ROA JOIN opcionesOtis OO ON ROA.idOpcionOtis = OO.idOpcionOtis 
            WHERE ROA.idAspirante = ? AND ROA.idPrueba = 5 AND ROA.idGrupo = ? AND OO.esCorrecta = TRUE
            `, [idAspirante, idGrupo]);
    }

    static getTiempoTotal(idGrupo, idAspirante){
        return db.execute (`SELECT SUM(tiempoRespuesta) AS Tiempo 
            FROM respuestaotisaspirante 
            WHERE idAspirante = ? 
            AND idPrueba = 5 
            AND idGrupo = ?`, [idAspirante, idGrupo]);
    }
}