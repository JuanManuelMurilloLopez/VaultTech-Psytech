const db = require('../util/database');
module.exports = class Cuadernillo {

    // Obtiene el timpo en que el aspirante respindio la prueba
    static getTiempoTotal(idGrupo, idAspirante) {
        return db.execute(`SELECT SUM(tiempoRespuesta) AS Tiempo 
            FROM respuestastermanaspirante 
            WHERE idAspirante = ? 
            AND idGrupo = ?`, [idAspirante, idGrupo]);
    }

    // Obtiene las preguntas, opciones y la respuesta del aspirante 
    static getRespuestasTermanAspirante(idGrupo, idAspirante) {
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

    static getPreguntasOpcionesTerman() {
        return db.execute(`
            SELECT 
                p.idPreguntaTerman,
                p.numeroPregunta,
                p.preguntaTerman,
                st.idSerieTerman,
                st.nombreSeccion,
                o.idOpcionTerman,
                o.opcionTerman,
                o.descripcionTerman,
                o.esCorrecta
            FROM preguntasterman p
            JOIN opcionesterman o ON o.idPreguntaTerman = p.idPreguntaTerman
            JOIN seriesterman st ON p.idSerieTerman = st.idSerieTerman
            ORDER BY st.idSerieTerman ASC, p.numeroPregunta ASC, o.opcionTerman ASC`);
    }

    static getRespuestasTermanAspirante2(idGrupo, idAspirante) {
        return db.execute(`
            SELECT 
                p.idSerieTerman,
                r.idPreguntaTerman,
                r.respuestaAbierta,
                o.idOpcionTerman,
                o.opcionTerman,
                o.descripcionTerman,
                COALESCE(o.esCorrecta, 0) as esCorrecta,
                r.tiempoRespuesta
            FROM respuestastermanaspirante r
            LEFT JOIN opcionesterman o ON o.idPreguntaTerman = r.idPreguntaTerman AND r.respuestaAbierta = o.opcionTerman
            LEFT JOIN preguntasterman p ON p.idPreguntaTerman = r.idPreguntaTerman
            WHERE r.idAspirante = ?
            AND r.idGrupo = ?
            ORDER BY r.idPreguntaTerman ASC`, [idAspirante, idGrupo]);
    }
}