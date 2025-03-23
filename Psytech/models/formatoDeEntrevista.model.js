const db = require('../util/database');

module.exports = class FormatoEntrevista{
    constructor(){
        
    }

    static fetchAll(){
        return db.execute(
            `SELECT * 
            FROM preguntasFormatoEntrevista`
        );
    }

    saveRespuestaAspirante(){
        return db.execute(
            `INSERT INTO aspirantesPreguntasFormatoEntrevista 
            (idAspirante, idPreguntaFormatoEntrevista, respuestaAspirante) 
            VALUES (?)`,
            [this.respuestas]);
    }
}