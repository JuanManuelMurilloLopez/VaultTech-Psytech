const db = require('../util/database');

module.exports = class InfoPruebas {
    // Metodos para la prueba OTIS
    static getPreguntasOtis() {
        return db.execute(
            `SELECT * FROM preguntasotis`
        );
    }

    static getOpcionesOtis() {
        return db.execute(
            `SELECT * FROM opcionesotis`
        );
    }

    static getOpcionesByPreguntaOtis(idPregunta) {
        return db.execute(
            `SELECT * FROM opcionesotis WHERE idPreguntaOtis = ?`,
            [idPregunta]
        );
    }

    // Metodo general para obtener info de cualquier prueba
    static getInfoPrueba(idPrueba) {
        return db.execute(
            `SELECT * FROM pruebas WHERE idPrueba = ?`,
            [idPrueba]
        );
    }
    
    // Metodo para obtener todos los colores para la prueba colores
    static getColores() {
        return db.execute(
            `SELECT * FROM colores ORDER BY idColor`
        );
    }

    static getInfoTerman(){
        return db.execute(`SELECT st.idSerieTerman, st.nombreSeccion, st.instruccion, st.duracion, p.idPreguntaTerman,
        p.numeroPregunta, p.preguntaTerman, o.idOpcionTerman, o.opcionTerman, o.descripcionTerman, o.esCorrecta
        FROM seriesterman st
        JOIN preguntasterman p ON st.idSerieTerman = p.idSerieTerman
        JOIN opcionesterman o ON p.idPreguntaTerman = o.idPreguntaTerman
        ORDER BY st.idSerieTerman ASC, p.numeroPregunta ASC, o.opcionTerman ASC;`)
    }
};