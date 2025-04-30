const db = require('../util/database');

class respuestasTerman {
    constructor(idAspirante, idGrupo, idPrueba, respuestas) {
        this.idAspirante = idAspirante;
        this.idGrupo = idGrupo;
        this.idPrueba = idPrueba;
        this.respuestas = respuestas; // [{ idPregunta, opcion, tiempo }, ...]
    }

    save() { 
        const promesas = this.respuestas.map(r => {
            // r = { idPregunta, opcion, tiempo }
            return db.execute(
                `INSERT INTO respuestastermanaspirante (idAspirante, idGrupo, idPreguntaTerman, idPrueba, respuestaAbierta, tiempoRespuesta) VALUES (?, ?, ?, ?, ?, ?)`,
                [
                    this.idAspirante,
                    this.idGrupo,
                    r.idPregunta,
                    this.idPrueba,
                    r.opcion,
                    r.tiempo || 0
                ]
            );
        });

        return Promise.all(promesas)
            .then(() => console.log('Respuestas guardadas.'))
            .catch(err => {
                console.error('Error al guardar respuestas:', err);
                throw err;
            });
    }

    async fetchRespuestasSerieById(idAspirante, idGrupo, idSerie) {
        const [respuestasAspirante] = await db.execute(
            'SELECT * from respuestasterman WHERE idAspirante = ? AND idGrupo = ? AND idPreguntaTerman IN (SELECT idPreguntaTerman FROM preguntasterman WHERE idSerieTerman = ?)',
            [idAspirante, idGrupo, idSerie]
        )
        return respuestasAspirante;
    }

    async fetchRespuestasOpciones(idAspirante, idGrupo, idSerie) {
        const [respuestasAspirante] = await db.execute(
            `SELECT 
                p.numeroPregunta,
                p.preguntaTerman,
                CASE 
                    WHEN r.respuestaAbierta = 0 THEN 'No contestó'
                    ELSE o.descripcionTerman
                END AS respuestaAspirante,
                r.tiempoRespuesta
            FROM 
                respuestasterman r
            INNER JOIN 
                preguntasterman p ON r.idPreguntaTerman = p.idPreguntaTerman
            LEFT JOIN 
                opcionesterman o ON o.idPreguntaTerman = p.idPreguntaTerman 
                                AND o.opcionTerman = r.respuestaAbierta
            WHERE 
                p.idSerieTerman = ?
                AND r.idAspirante = ?
                AND r.idGrupo = ?
            ORDER BY 
                p.numeroPregunta ASC;`,
            [idSerie, idAspirante, idGrupo]
        );
        return respuestasAspirante;
    }

    async fetchRespuestasTextoLibre(idAspirante, idGrupo, idSerie) {
        const [respuestasAspirante] = await db.execute(
            `SELECT 
                p.numeroPregunta,
                p.preguntaTerman,
                CASE 
                    WHEN r.respuestaAbierta = 0 THEN 'No contestó'
                    ELSE r.respuestaAbierta
                END AS respuestaAspirante,
                r.tiempoRespuesta
            FROM 
                respuestasterman r
            INNER JOIN 
                preguntasterman p ON r.idPreguntaTerman = p.idPreguntaTerman
            WHERE 
                p.idSerieTerman = ?
                AND r.idAspirante = ?
                AND r.idGrupo = ?
            ORDER BY 
                p.numeroPregunta ASC;`,
            [idSerie, idAspirante, idGrupo]
        );
        return respuestasAspirante;
    }


}

module.exports = respuestasTerman;