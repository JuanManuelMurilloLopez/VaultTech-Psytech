const db = require('../util/database');

module.exports = class Genero{
    static fetchAll(){
        return db.execute(`SELECT * FROM generos`);
    }
}