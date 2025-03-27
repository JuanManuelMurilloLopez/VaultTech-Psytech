const db = require('../util/database');
const bcrypt = require('bcryptjs');


class Usuario {
  constructor(usuario, contrasenia, rol) {
    this.usuario = usuario;
    this.contrasenia = contrasenia;
    this.rol = rol;
  }

  static recuperarUno = async (usuario) => {
    try {
      const [filas] = await db.execute('SELECT * FROM usuarios WHERE usuario = ?', [usuario]);

      if (filas.length === 0) {
        console.log('Usuario no encontrado en la base de datos.');
      }
      
      return filas;
    } catch (error) {
      console.error('Error en recuperarUno:', error);
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