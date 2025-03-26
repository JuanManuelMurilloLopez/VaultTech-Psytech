const db = require('../util/database');

module.exports = class Familiar{
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
    
}