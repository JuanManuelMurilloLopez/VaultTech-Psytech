const db = require('../util/database');

module.exports = class EstadoCivil{
    static fetchAll(){
        return db.execute(`SELECT * FROM estadoCivil`);
    }
}