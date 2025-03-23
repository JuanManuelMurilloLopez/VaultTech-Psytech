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

    saveUsuario(){
        return bcrypt.hash(this.contrasenia, 12)
        .then((contraseniaCifrada) => {
            return db.execute(`
                INSERT INTO Usuarios VALUES 
                (uuid(), ?, ?, true, ?, ?, ?, ?, ?, ?, 
                (SELECT idRol FROM Roles WHERE nombreRol = 'Aspirante')
                )`, 
                [this.usuario, contraseniaCifrada, this.nombreUsuario, 
                    this.apellidoPaterno, this.apellidoMaterno, this.correo, 
                    this.lada, this.numeroTelefono]);
        })
        .catch((error) => {
            console.log(error);
        });
         
    }
    getIdUsuario(){
        return db.execute(`
            SELECT idUsuario
            FROM Usuarios
            WHERE nombreUsuario = ?
            `, 
            [this.nombreUsuario]);
    }

    saveAspirante(idUsuario){
        return db.execute(`
            INSERT INTO Aspirantes VALUES (uuid(), ?, ?, ?, ?, null, null)
            `, 
            [idUsuario, this.institucionProcedencia, this.idPais, this.idEstado]);
    }

}