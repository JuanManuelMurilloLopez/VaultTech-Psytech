const db = require('../util/database');
const crypto = require('crypto');
const bcrypt = require('bcryptjs');


class Usuario {
  constructor(idUsuario, correo, usuario, rol) {
    this.idUsuario = idUsuario;
    this.correo = correo;
    this.usuario = usuario;
    this.rol = rol;
  }

  static fetchOne = async (usuario) => {
    try {
      const [filas] = await db.execute('SELECT * FROM usuarios WHERE usuario = ?', [usuario]);

      if (filas.length === 0) {
        console.log('Usuario no encontrado en la base de datos.');
      }
      
      return filas;
    } catch (error) {
      console.error('Error en fetchOne:', error);
      throw error;
    }
  };

  static getIdAspirante(usuario){
    return db.execute(`SELECT IdAspirante 
      FROM Aspirantes 
      WHERE IdUsuario = 
        (SELECT IdUsuario FROM Usuarios WHERE idUsuario = ?)`, 
        [usuario]
      );
  }
}


module.exports = Usuario;