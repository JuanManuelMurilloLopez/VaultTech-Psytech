const db = require('../util/database.js');

module.exports = class PreguntaOtis {
    constructor(idPreguntaOtis, numeroPregunta, preguntaOtis, idPrueba) {
        this.idPreguntaOtis = idPreguntaOtis;
        this.numeroPregunta = numeroPregunta;
        this.preguntaOtis = preguntaOtis;
        this.idPrueba = idPrueba;
    }

    static fetchAll() {
        return db.execute(
            `SELECT * FROM PreguntasOtis`
        );
    }
}
