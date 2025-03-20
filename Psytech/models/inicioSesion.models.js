const db = require('../util/database');
const bcrypt = require('bcryptjs');

class Usuario {
  constructor(usuario, contrasenia, rol) {
    this.usuario = usuario;
    this.contrasenia = contrasenia;
    this.rol = rol;
  }

  // Método comparar la contraseña ingresada con la guardada
  static compararContrasenia(contraseniaGuardada, contraseniaCandidata) {
    return bcrypt.compare(contraseniaCandidata, contraseniaGuardada);
  }

  // Método para encontrar un usuario por su nombre
  static recuperarUno(usuario) {
    return db.execute('SELECT * FROM usuarios WHERE usuario = ?', [usuario]);
  }

}

module.exports = Usuario;
