const db = require('../util/database');
module.exports = class Cuadernillo{

    // Obtiene el timpo en que el aspirante respindio la prueba
    static getTiempoTotal(idGrupo, idAspirante){
        return db.execute (`SELECT SUM(tiempoRespuesta) AS Tiempo 
            FROM respuestastermanaspirante 
            WHERE idAspirante = ? 
            AND idGrupo = ?`, [idAspirante, idGrupo]);
    }

    // Obtiene las preguntas, opciones y la respuesta del aspirante 
    static getRespuestasTermanAspirante(idGrupo, idAspirante){
        return db.execute(`SELECT p.idPreguntaTerman, p.numeroPregunta, p.preguntaTerman, 
            st.idSerieTerman, st.nombreSeccion, o.idOpcionTerman, o.opcionTerman, 
            o.descripcionTerman, o.esCorrecta, r.respuestaAbierta, r.tiempoRespuesta,
            CASE WHEN o.opcionTerman = CAST(r.respuestaAbierta AS UNSIGNED) THEN 1 ELSE 0 END AS opcionSeleccionada
            FROM preguntasterman p
            JOIN respuestastermanaspirante r ON p.idPreguntaTerman = r.idPreguntaTerman
            JOIN opcionesterman o ON o.idPreguntaTerman = p.idPreguntaTerman
            JOIN seriesterman st ON p.idSerieTerman = st.idSerieTerman
            WHERE r.idAspirante = ? 
            AND r.idGrupo = ?
            ORDER BY st.idSerieTerman ASC, p.numeroPregunta ASC, o.opcionTerman ASC`, 
            [idAspirante, idGrupo]);
    }
}