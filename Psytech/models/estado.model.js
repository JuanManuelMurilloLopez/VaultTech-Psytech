const db = require('../util/database');

module.exports = class Estado {

    static fetchAll() {
        return db.execute('SELECT * FROM estados');
    }

    static findEstado(aspiranteEstado) {
        return db.execute(`SELECT idEstado
                            FROM estados
                            WHERE nombreEstado = ?`, [aspiranteEstado]);
    }

}