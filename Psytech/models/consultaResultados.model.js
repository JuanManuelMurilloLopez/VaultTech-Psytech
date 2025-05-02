const db = require('../util/database');

module.exports = class consultaResultados {

    static fetchHartmanAspirante(idAspirante, idGrupo) {
        return db.execute(
            `SELECT 
                u.idUsuario AS idAspirante, 
                u.nombreUsuario AS nombreAspirante, 
                u.apellidoPaterno AS apellidoPaternoAspirante, 
                u.apellidoMaterno AS apellidoMaternoAspirante, 
                r.* 
            FROM aspirantes a
            JOIN usuarios u ON a.idUsuario = u.idUsuario
            JOIN resultadoshartman r ON r.idAspirante = a.idAspirante
            WHERE r.idGrupo = ? AND a.idAspirante = ?`,
            [idGrupo, idAspirante]
        );
    }    
    
    static fetchCalificacionTerman(idAspirante, idGrupo) {
        return db.execute(
            "SELECT u.idUsuario AS idAspirante, u.nombreUsuario AS nombreAspirante, u.apellidoPaterno AS apellidoPaternoAspirante, u.apellidoMaterno AS apellidoMaternoAspirante, c.idCalificacionTerman, c.puntosTotales, c.rango, c.coeficienteIntelectual FROM usuarios u, calificacionesterman c WHERE c.idGrupo = ? AND c.idAspirante = u.idUsuario AND u.idUsuario = ?" ,
            [idGrupo, idAspirante]
        );
    }

    static fetchResultadosSerieTerman(idAspirante, idGrupo, idSerie, idCalificacion) {
        return db.execute(
            "SELECT puntuacion, rango FROM resultadosseriesterman WHERE idAspirante = ? AND idGrupo = ? AND idSerieTerman = ? AND idCalificacionTerman = ?",
            [idAspirante, idGrupo, idSerie, idCalificacion]
        );
    }
}