const db = require('../util/database');

module.exports = class Prueba{


    static fetchInstrucciones() {
            return db.execute('SELECT instrucciones FROM pruebas WHERE nombre = "Colores de Luscher"');
        }

    static saveDatosPersonales(idAspirante, idGrupo, idPrueba, datosPersonales){
        // Ya existen datos?
        return db.execute(`
            SELECT idDatosPersonales FROM datosPersonales 
            WHERE idGrupo = ? AND idPrueba = ? AND idAspirante = ?
        `, [idGrupo, idPrueba, idAspirante])
        .then(([rows]) => {
            if (rows.length > 0) {
                // Si ya existen datos, actualizarlos
                return db.execute(`
                    UPDATE datosPersonales 
                    SET nombre = ?, apellidoPaterno = ?, apellidoMaterno = ?, 
                        puestoSolicitado = ?, fecha = ?
                    WHERE idGrupo = ? AND idPrueba = ? AND idAspirante = ?
                `, [
                    datosPersonales.nombre,
                    datosPersonales.apellidoPaterno, 
                    datosPersonales.apellidoMaterno,
                    datosPersonales.puestoSolicitado,
                    datosPersonales.fecha,
                    idGrupo,
                    idPrueba,
                    idAspirante
                ]);
            } else {
                // Si no existen, insertarlos
                return db.execute(`
                    INSERT INTO datosPersonales 
                    (idDatosPersonales, idGrupo, idPrueba, idAspirante, nombre, 
                     apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha)
                    VALUES (UUID(), ?, ?, ?, ?, ?, ?, ?, ?)
                `, [
                    idGrupo,
                    idPrueba,
                    idAspirante,
                    datosPersonales.nombre,
                    datosPersonales.apellidoPaterno, 
                    datosPersonales.apellidoMaterno,
                    datosPersonales.puestoSolicitado,
                    datosPersonales.fecha
                ]);
            }
        });
    }

    static getPreguntasOtis(){}

    static getPreguntas16PF(){}

    static getPreguntasHartman(){}

    static getPreguntasKostick(){}

    static getPreguntasTerman(){}


    static addRespuestaOtis(){}

    static addRespuesta16PF(){}

    static addRespuestaHartman(){}

    static addRespuestaKostick(){}

    static addRespuestaTerman(){}

    static fetchColores(){
        return db.execute('SELECT * FROM colores ORDER BY numeroColor');
    }

    static saveSeleccion(idAspirante, idGrupo, idPrueba, fase, seleccion){
        const promesas = [];
        
        for (let i = 0; i < seleccion.length; i++) {
            promesas.push(
                db.execute(
                    `INSERT INTO seleccionesColores 
                    (idSeleccionColores, idPrueba, idAspirante, idGrupo, idColor, posicion, fase) 
                    VALUES (UUID(), ?, ?, ?, ?, ?, ?)`,
                    [idPrueba, idAspirante, idGrupo, seleccion[i].idColor, i, fase]
                ).catch((error) => {
                    console.error(`Error al insertar la selección ${i}:`, error);
                    throw error;
                })
            );
        }
        
        return Promise.all(promesas);
    }

    static getGrupoPrueba(idAspirante, idPrueba){
        return db.execute(`
            SELECT idGrupo 
            FROM aspirantesGruposPruebas 
            WHERE idAspirante = ? AND idPrueba = ?
        `, [idAspirante, idPrueba]);       
    }

    static getEstatusPrueba(idAspirante, idGrupo, idPrueba){
        return db.execute(
            `SELECT idEstatus 
            FROM aspirantesGruposPruebas 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );       
    }

    // Actualizar estado de prueba
    static updateEstatusPrueba(idAspirante, idGrupo, idPrueba, idEstatus = 1) {
        return db.execute(
            `UPDATE aspirantesGruposPruebas 
            SET idEstatus = ? 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idEstatus, idAspirante, idGrupo, idPrueba]
        );
    }

    static verificarExistencia(idAspirante, idGrupo, idPrueba) {
        return db.execute(
            `SELECT * FROM aspirantesGruposPruebas 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );
    }
}