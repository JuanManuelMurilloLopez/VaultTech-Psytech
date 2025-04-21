const db = require('../util/database');

module.exports = class Pais {

    static fetchAll() {
        return db.execute('SELECT * FROM paises');
    }

    static findPais(aspirantePais) {
        return db.execute(`SELECT idPais
                            FROM paises
                            WHERE nombrePais = ?`, [aspirantePais]);
    }

}