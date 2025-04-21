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

    static fetchHijoDe(idAspirante){
        return db.execute(
            `SELECT idFamiliar, nombreFamiliar, idAspirante 
            FROM familiares WHERE idAspirante = ?`, [idAspirante]
        );
    }
    
    static getFamiliaresAspirante(idGrupo, idAspirante){
        return db.execute(
            `SELECT * FROM familiares F 
            JOIN gruposaspirantes GA ON F.idAspirante = GA.idAspirante 
            WHERE GA.idGrupo = ?  AND GA.idAspirante = ?`, [idGrupo, idAspirante]);
    }

}