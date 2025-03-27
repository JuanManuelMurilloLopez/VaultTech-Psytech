const db = require('../util/database');

module.exports = class Estado {

    static fetchAll() {
        return db.execute('SELECT * FROM estados');
    }

    static fetchOne(idEstado) {
        return db.execute('SELECT * FROM estados WHERE idEstado=?', [idEstado]);
    }

    static fetch(idEstado) {
        if (idEstado) {
            return this.fetchOne(idEstado);
        } else {
            return this.fetchAll();
        }
    }

}