const db = require('../util/database');

module.exports = class PruebaColores {
    constructor(seleccion) {
        this.seleccion = seleccion;
    }

    static fetchColores() {
        return db.execute('SELECT * FROM colores ORDER BY numeroColor');
    }

    static fetchInstrucciones() {
        return db.execute('SELECT instrucciones FROM pruebas WHERE nombre = "Colores de Luscher"');
    }

    static obtenerGrupoParaPrueba(idAspirante, idPrueba) {
        return db.execute(`
            SELECT idGrupo 
            FROM aspirantesGruposPruebas 
            WHERE idAspirante = ? AND idPrueba = ?
        `, [idAspirante, idPrueba]);
    }

    // Guardar datos personales
    static guardarDatosPersonales(idAspirante, idGrupo, idPrueba, datosPersonales) {
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

    // Guarda selecciones de colores
    saveSeleccion(idAspirante, idGrupo, idPrueba, fase) {
        const promesas = [];
        
        for (let i = 0; i < this.seleccion.length; i++) {
            promesas.push(
                db.execute(
                    `INSERT INTO seleccionesColores 
                    (idSeleccionColores, idPrueba, idAspirante, idGrupo, idColor, posicion, fase) 
                    VALUES (UUID(), ?, ?, ?, ?, ?, ?)`,
                    [idPrueba, idAspirante, idGrupo, this.seleccion[i].idColor, i, fase]
                ).catch((error) => {
                    console.error(`Error al insertar la selección ${i}:`, error);
                    throw error;
                })
            );
        }
        
        return Promise.all(promesas);
    }
    

    // Ya completó la prueba?
    static checkEstadoPrueba(idAspirante, idGrupo, idPrueba) {
        return db.execute(
            `SELECT idEstatus 
            FROM aspirantesGruposPruebas 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );
    }

    // Actualizar estado de prueba
    static updateEstadoPrueba(idAspirante, idGrupo, idPrueba, idEstatus = 1) {
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
};