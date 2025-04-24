const db = require('../util/database');

module.exports = class FormatoEntrevista{
    constructor(respuestas){
        this.respuestas = respuestas;
    }

    static fetchAll(){
        return db.execute(
            `SELECT * 
            FROM preguntasformatoentrevista`
        );
    }

    saveRespuestaAspirante() {
        // Sintaxis para insertar arrays de arrays
        const sql = `
            INSERT INTO aspirantespreguntasformatoentrevista 
            (idAspirante, idPreguntaFormatoEntrevista, respuestaAspirante) 
            VALUES ?`;

        return db.query(sql, [this.respuestas]);
    }

    static getRespuestasFormatoAspirante(idGrupo, idAspirante){
        return db.execute(
            `SELECT PFE.idPreguntaFormatoEntrevista, PFE.nombrePreguntaFormatoEntrevista, PFE.tipoPregunta, PFE.seccion, APFE.respuestaAspirante 
            FROM gruposaspirantes GA 
            JOIN aspirantespreguntasformatoentrevista APFE ON GA.idAspirante = APFE.idAspirante 
            JOIN preguntasformatoentrevista PFE ON PFE.idPreguntaFormatoEntrevista = APFE.idPreguntaFormatoEntrevista 
            WHERE GA.idAspirante = ?
            AND GA.idGrupo = ? `, [idAspirante, idGrupo]);
    }
}