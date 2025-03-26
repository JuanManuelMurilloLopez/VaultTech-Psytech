const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Aspirante {

    constructor(infoAspirante) {
        this.nombreUsuario = infoAspirante.nombreUsuario,
        this.apellidoPaterno = infoAspirante.apellidoPaterno,
        this.apellidoMaterno = infoAspirante.apellidoMaterno,
        this.correo = infoAspirante.correo,
        this.lada = infoAspirante.lada,
        this.numeroTelefono = infoAspirante.numeroTelefono,
        this.usuario = this.correo,
        this.contrasenia = this.nombreUsuario,
        this.institucionProcedencia = infoAspirante.institucionProcedencia,
        this.idPais = infoAspirante.idPais,
        this.idEstado = infoAspirante.idEstado
    }
    save(idGrupo){
        return db.execute(`
            CALL RegistrarAspiranteEnGrupo 
            (?, ?, ?, ?, ?, ?, ?, ?, 'Aspirante', ?, ?, ?, ?)
            `
            , [this.usuario, this.contrasenia, this.nombreUsuario, 
                this.apellidoPaterno, this.apellidoMaterno, this.correo, 
                this.lada, this.numeroTelefono, this.institucionProcedencia, this.idPais, this.idEstado, 
                idGrupo])
    }

    getIdAspirante(idGrupo){
        return db.execute(`
            SELECT aspirantes.idAspirante
            FROM aspirantes, usuarios, gruposAspirantes
            WHERE aspirantes.idUsuario = usuarios.idUsuario
            AND usuarios.usuario = ?
            AND aspirantes.idAspirante = gruposAspirantes.idAspirante
            AND gruposAspirantes.idGrupo = ?
            `, [this.usuario, idGrupo])
    }

    vincularPrueba(idAspirante, idGrupo, prueba){
        return db.execute(`
                INSERT INTO aspirantesGruposPruebas
                VALUES (?, ?, ?, 1, CURRENT_DATE(), ?)
            `, [idGrupo, prueba.idPrueba, idAspirante, prueba.fechaLimite.toISOString().substring(0, 10)])
    }

}