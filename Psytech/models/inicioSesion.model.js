const db = require('../util/database');
const bcrypt = require('bcryptjs');


class Usuario {
  constructor(usuario, contrasenia, rol) {
    this.usuario = usuario;
    this.contrasenia = contrasenia;
    this.rol = rol;

    this.compararContrasenia = async (contraseniaCandidata) => {
      if (!this.contrasenia) {
        console.error('Error: La contraseña es NULL o undefined.');
        throw new Error('La contraseña guardada no es válida.');
      }
      return bcrypt.compare(contraseniaCandidata, this.contrasenia);
    };
  }

  static recuperarUno = async (usuario) => {
    try {
      const [filas] = await db.execute('SELECT * FROM usuarios WHERE usuario = ?', [usuario]);

      if (filas.length === 0) {
        console.log('Usuario no encontrado en la base de datos.');
      } else {
        console.log('Usuario encontrado:', filas[0]);
      }
      return filas;
    } catch (error) {
      console.error('Error en recuperarUno:', error);
      throw error;
    }
  };
}

module.exports = Usuario;
