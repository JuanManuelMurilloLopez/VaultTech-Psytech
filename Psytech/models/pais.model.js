const db = require('../util/database');

module.exports = class Pais {

    static fetchAll() {
        return db.execute('SELECT * FROM paises');
    }

    static fetchOne(idPais) {
        return db.execute('SELECT * FROM paises WHERE idPais=?', [idPais]);
    }

    static fetch(idPais) {
        if (idPais) {
            return this.fetchOne(idPais);
        } else {
            return this.fetchAll();
        }
    }

}