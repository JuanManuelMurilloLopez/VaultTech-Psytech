const db = require('../util/database');

module.exports = class Pais {

    static fetchAll() {
        return db.execute('SELECT * FROM paises');
    }

}