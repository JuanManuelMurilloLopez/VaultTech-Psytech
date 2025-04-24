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
            'SELECT idPreguntaTerman, opcionTerman, descripcionTerman FROM opcionesterman WHERE idPreguntaTerman IN (SELECT idPreguntaTerman FROM preguntasTerman WHERE idSerieTerman = ?)',
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
}

module.exports = Terman;