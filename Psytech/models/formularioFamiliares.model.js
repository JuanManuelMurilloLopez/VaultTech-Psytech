const db = require('../util/database');

module.exports = class Familiar{
    constructor(idAspirante, respuestas){
        this.respuestas = respuestas;
        this.idAspirante = idAspirante;
    }

    static fetchAll(){
        return db.execute(
            `SELECT rolFamiliar, 
                                nombreFamiliar, 
                                edadFamiliar, 
                                hijoDe, 
                                estadoDeVida 
            FROM familiares`
        );
    }

    saveFamiliar() {
        const sql = `
            INSERT INTO familiares 
            (idFamiliar, idAspirante, rolFamiliar, nombreFamiliar, edadFamiliar, idGenero, idEstadoCivil, hijoDe, estadoDeVida) 
            VALUES (uuid(), ?, ?, ?, ?, ?, ?, ?, ?)
        `;
    
        return db.query(sql, [this.idAspirante, ...this.respuestas]);
    }
    
}