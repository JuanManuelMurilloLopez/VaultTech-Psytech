const db = require('../util/database');
const { v4: uuidv4 } = require('uuid');

class Reuniones {
    /**
     * Create a new meeting (group or 1on1)
     * @param {Object} data - Meeting data
     * @returns {Promise}
     */
    static async create({ tipo, idGrupo, idAspirante = null, idPsicologo = null, titulo, fecha, horaInicio, horaFin, link, creadaPor }) {
        const idReunion = uuidv4();
        return db.execute(
            `INSERT INTO reuniones (idReunion, tipo, idGrupo, idAspirante, idPsicologo, titulo, fecha, horaInicio, horaFin, link, creadaPor)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [idReunion, tipo, idGrupo, idAspirante, idPsicologo, titulo, fecha, horaInicio, horaFin, link, creadaPor]
        );
    }

    /**
     * Update a meeting by id
     */
    static async update(idReunion, { titulo, fecha, horaInicio, horaFin, link }) {
        return db.execute(
            `UPDATE reuniones SET titulo = ?, fecha = ?, horaInicio = ?, horaFin = ?, link = ? WHERE idReunion = ?`,
            [titulo, fecha, horaInicio, horaFin, link, idReunion]
        );
    }

    /**
     * Delete a meeting by id
     */
    static async delete(idReunion) {
        return db.execute(`DELETE FROM reuniones WHERE idReunion = ?`, [idReunion]);
    }

    /**
     * Fetch a meeting by id
     */
    static async fetchById(idReunion) {
        return db.execute(`SELECT * FROM reuniones WHERE idReunion = ?`, [idReunion]);
    }

    /**
     * Fetch the group meeting for a group
     */
    static async fetchGroupMeeting(idGrupo) {
        return db.execute(`SELECT * FROM reuniones WHERE idGrupo = ? AND tipo = 'group'`, [idGrupo]);
    }

    /**
     * Fetch all 1on1 meetings for a group
     * @param {string} idGrupo
     * @returns {Promise}
     */
    static async fetchAll1on1ByGroup(idGrupo) {
        return db.execute(`SELECT * FROM reuniones WHERE idGrupo = ? AND tipo = '1on1'`, [idGrupo]);
    }

    /**
     * Fetch all 1on1 meetings for a specific aspirante (across all groups)
     * @param {string} idAspirante
     * @returns {Promise}
     */
    static async fetchAll1on1ByAspirante(idAspirante) {
        return db.execute(`SELECT * FROM reuniones WHERE idAspirante = ? AND tipo = '1on1'`, [idAspirante]);
    }

    /**
     * Fetch all 1on1 meetings for a specific psicologo (across all groups)
     * @param {string} idPsicologo
     * @returns {Promise}
     */
    static async fetchAll1on1ByPsicologo(idPsicologo) {
        return db.execute(`SELECT * FROM reuniones WHERE idPsicologo = ? AND tipo = '1on1'`, [idPsicologo]);
    }

    /**
     * Fetch a 1on1 meeting for an aspirante+group
     * @param {string} idGrupo
     * @param {string} idAspirante
     * @returns {Promise}
     */
    static async fetch1on1ByAspirante(idGrupo, idAspirante) {
        return db.execute(`SELECT * FROM reuniones WHERE idGrupo = ? AND idAspirante = ? AND tipo = '1on1'`, [idGrupo, idAspirante]);
    }

    /**
     * Fetch all meetings created by a psychologist (by user id)
     */
    static async fetchByPsicologo(idPsicologo, participant = false) {
        if (participant) {
            return db.execute(`SELECT * FROM reuniones WHERE idPsicologo = ?`, [idPsicologo]);
        } else {
            return db.execute(`SELECT * FROM reuniones WHERE idPsicologo = ? OR creadaPor = ?`, [idPsicologo, idPsicologo]);
        }
    }

    /**
     * Fetch all meetings for a group (group + 1on1)
     */
    static async fetchAllByGroup(idGrupo) {
        return db.execute(`SELECT * FROM reuniones WHERE idGrupo = ?`, [idGrupo]);
    }
}

module.exports = Reuniones;
