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
        this.institucionProcedencia = infoAspirante.institucionProcedencia,
        this.idPais = infoAspirante.idPais,
        this.idEstado = infoAspirante.idEstado
    }
    save(idGrupo){
        return db.execute(`
            CALL registraraspiranteengrupo 
            (?, ?, ?, ?, ?, ?, ?, 'aspirante', ?, ?, ?, ?)
            `
            , [this.usuario, this.nombreUsuario, 
                this.apellidoPaterno, this.apellidoMaterno, this.correo, 
                this.lada, this.numeroTelefono, this.institucionProcedencia, this.idPais, this.idEstado, 
                idGrupo])
    }

    getIdAspirante(idGrupo){
        return db.execute(`
            SELECT aspirantes.idAspirante
            FROM aspirantes, usuarios, gruposaspirantes
            WHERE aspirantes.idUsuario = usuarios.idUsuario
            AND usuarios.usuario = ?
            AND aspirantes.idAspirante = gruposaspirantes.idAspirante
            AND gruposaspirantes.idGrupo = ?
            `, [this.usuario, idGrupo])
    }

    vincularPrueba(idAspirante, idGrupo, prueba){
        return db.execute(`
                INSERT INTO aspirantesgrupospruebas
                VALUES (?, ?, ?, 2, CURRENT_DATE(), ?)
            `, [idGrupo, prueba.idPrueba, idAspirante, prueba.fechaLimite.toISOString().substring(0, 10)])
    }

    static getExpedientes(idAspirante){
        return db.execute(`
                SELECT kardex, cv
                FROM aspirantes
                WHERE idAspirante = ?
            `, [idAspirante]);
    }

    static addKardex(idAspirante, rutaKardex){
        return db.execute(`
                UPDATE aspirantes
                SET kardex = ?
                WHERE idAspirante = ?
            `, [rutaKardex, idAspirante])
    }

    static addCv(idAspirante, rutaCv){
        return db.execute(`
                UPDATE aspirantes
                SET cv = ?
                WHERE idAspirante = ?
            `, [rutaCv, idAspirante])
    }

    static getInformacionAspirante(idAspirante){
        return db.execute(`
                SELECT *
                FROM aspirantes, usuarios, paises, estados
                WHERE aspirantes.idUsuario = usuarios.idUsuario
                AND idAspirante = ?
                AND aspirantes.idPais = paises.idPais
                AND aspirantes.idEstado = estados.idEstado
            `, [idAspirante]);
    }

    static getMisPruebas(idAspirante, idGrupo){
        return db.execute(`
                SELECT nombre, nombreEstatus, fechaLimite
                FROM vistapruebasaspirantes vpa, grupos
                WHERE idAspirante = ?
                AND vpa.nombreGrupo = grupos.nombreGrupo
                AND idGrupo = ?
            `,[idAspirante, idGrupo]);
    }

}