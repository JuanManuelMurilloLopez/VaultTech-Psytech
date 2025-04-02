const db = require('../util/database');

module.exports = class Estado {

    static fetchAll() {
        return db.execute('SELECT * FROM estados');
    }

}