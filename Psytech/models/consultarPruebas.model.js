const db = require('../util/database');

module.exports = class ConsultarPruebas{

    static fetchAll(idAspirante){
        return db.execute(`
            SELECT nombre, nombreEstatus, descripcion, fechaLimite, tiempo, idAspirante, nombreGrupo 
            FROM vistaPruebasAspirantes
            WHERE idAspirante = ?`, 
            [idAspirante]
        );
    }

    static fetchAllPendientes(idAspirante){
        return db.execute(`
            SELECT nombre, nombreEstatus, descripcion, fechaLimite, tiempo, idAspirante, nombreGrupo 
            FROM vistaPruebasAspirantes
            WHERE idAspirante = ? 
            AND nombreEstatus = 'Pendiente'`, 
            [idAspirante]
        );
    }

    static fetchAllCompletadas(idAspirante){
        return db.execute(`
            SELECT nombre, nombreEstatus, descripcion, fechaLimite, tiempo, idAspirante, nombreGrupo 
            FROM vistaPruebasAspirantes
            WHERE idAspirante = ? 
            AND nombreEstatus = 'Completada'`, 
            [idAspirante]
        );
    }
    
}
