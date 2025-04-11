const db = require('../util/database');

module.exports = class TipoInstitucion {

    static fetchAll() {
        return db.execute('SELECT * FROM tipoinstitucion');
    }

}