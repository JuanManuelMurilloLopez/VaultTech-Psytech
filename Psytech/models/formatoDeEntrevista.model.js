const db = require('../util/database');

module.exports = class FormatoEntrevista{
    constructor(respuestas){
        this.respuestas = respuestas;
    }

    static fetchAll(){
        return db.execute(
            `SELECT * 
            FROM preguntasFormatoEntrevista`
        );
    }

    saveRespuestaAspirante() {
        // Sintaxis para insertar arrays de arrays
        const sql = `
            INSERT INTO aspirantesPreguntasFormatoEntrevista 
            (idAspirante, idPreguntaFormatoEntrevista, respuestaAspirante) 
            VALUES ?`;

        return db.query(sql, [this.respuestas]);
    }
}