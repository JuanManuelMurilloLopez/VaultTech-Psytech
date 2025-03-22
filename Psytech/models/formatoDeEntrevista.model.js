const db = require('../util/database');

module.exports = class RespuestaAspirante{
    constructor(respuestas){
        this.respuestas = respuestas;
    }

    save(){
        return db.execute(
            'INSERT INTO aspirantesPreguntasFormatoEntrevista (idAspirante, idPreguntaFormatoEntrevista, respuestaAspirante) VALUES (?)',
            [this.respuestas]);
    }
}