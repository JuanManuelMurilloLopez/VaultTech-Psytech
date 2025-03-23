const db = require('../util/database');

module.exports = class ConsultarPruebas{

    static obtenerPruebas(idAspirante){
        return db.execute(`SELECT nombre, nombreEstatus, descripcion, fechaLimite, tiempo, idAspirante 
                            FROM vistapruebasaspirantes
                            WHERE idAspirante = ?`, [idAspirante]
        );
    }
}