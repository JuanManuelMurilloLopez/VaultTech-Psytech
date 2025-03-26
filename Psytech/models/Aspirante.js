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
            EXEC RegistrarAspiranteEnGrupo 
            (?, ?, ?, ?, ?, ?, ?, ?, 'Aspirante', ?, ?, ?, ?)
            `
            , [this.usuario, this.contrasenia, this.nombreUsuario, 
                this.apellidoPaterno, this.apellidoMaterno, this.correo, 
                this.lada, this.numeroTelefono, this.idPais, this.idEstado, 
                idGrupo])
    }

    getIdAspirante(idGrupo){
        return db.execute(`
            SELECT idAspirante
            FROM aspirantes, usuarios, aspirantesGrupos
            WHERE aspirantes.idUsuario = usuarios.idUsuario
            AND usuarios.usuario = ?
            AND aspirantes.idAspirante = aspirantesGrupos.idAspirante
            AND aspirantesGrupos.idGrupo = ?
            `, [this.usuario, this.idGrupo])
    }

}