const db = require('../util/database');

class Terman {

    static getGrupoPrueba(idAspirante, idPrueba){
        return db.execute(`
            SELECT idGrupo 
            FROM aspirantesgrupospruebas 
            WHERE idAspirante = ? AND idPrueba = ?
        `, [idAspirante, idPrueba]);       
    }

    static async fetchSerieInfoById(idSerie) {
        const [info] = await db.execute(
            'SELECT * FROM seriesterman WHERE idSerieTerman = ?',
            [idSerie]
        );
        return info;
    }

    static async fetchPreguntaSerieById(idSerie) {
        const [preguntas] = await db.execute(
            'SELECT idPreguntaTerman, numeroPregunta, preguntaTerman FROM preguntasterman WHERE idSerieTerman = ?',
            [idSerie]
        );
        return preguntas;
    }

    static async fetchOpcionesSerieById(idSerie) {
        const [opciones] = await db.execute(
            'SELECT idPreguntaTerman, opcionTerman, descripcionTerman FROM opcionesterman WHERE idPreguntaTerman IN (SELECT idPreguntaTerman FROM preguntasterman WHERE idSerieTerman = ?)',
            [idSerie]
        );
        return opciones;
    }

    static async fetchOpcionesCorrectasById(idSerie) {
        const [opcionesCorrectas] = await db.execute(
            'SELECT OT.idPreguntaTerman, OT.opcionTerman, OT.descripcionTerman ,OT.esCorrecta FROM opcionesterman AS OT WHERE OT.esCorrecta = 1 AND OT.idPreguntaTerman IN (SELECT PT.idPreguntaTerman FROM preguntasterman AS PT WHERE PT.idSerieTerman = ?)',
            [idSerie]
        );
        return opcionesCorrectas;
    }

    static async fetchRespuestasAspiranteById(idAspirante, idGrupo, idSerie) {
        const [respuestasAspirante] = await db.execute(
            'SELECT p.numeroPregunta, p.preguntaTerman, o.descripcionTerman AS respuestaAspirante, r.tiempoRespuesta FROM respuestastermanaspirante r INNER JOIN preguntasterman p ON r.idPreguntaTerman = p.idPreguntaTerman INNER JOIN opcionesterman o ON o.idPreguntaTerman = p.idPreguntaTerman AND o.opcionTerman = r.respuestaAbierta WHERE p.idSerieTerman = ? AND r.idAspirante = ? AND r.idGrupo = ? ORDER BY p.numeroPregunta ASC;',
            [idSerie, idAspirante, idGrupo]
        )
        return respuestasAspirante;
    };

    static updateEstatusPrueba(idAspirante, idGrupo, idPrueba, idEstatus = 1) {
        return db.execute(
            `UPDATE aspirantesgrupospruebas
            SET idEstatus = ? 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idEstatus, idAspirante, idGrupo, idPrueba]
        );
    }

    static verificarExistencia(idAspirante, idGrupo, idPrueba) {
        return db.execute(
            `SELECT * FROM aspirantesgrupospruebas 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );
    }
}

module.exports = Terman;