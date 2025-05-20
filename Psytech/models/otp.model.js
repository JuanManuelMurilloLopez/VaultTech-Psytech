const db = require('../util/database');

class Usuario {
  constructor(idUsuario, correo, usuario, rol) {
    this.idUsuario = idUsuario;
    this.correo = correo;
    this.usuario = usuario;
    this.rol = rol;
  }

  static fetchOne = async (usuario) => {
    try {
      const [filas] = await db.execute('SELECT * FROM usuarios WHERE idUsuario = ?', [usuario]);
  
      if (filas.length === 0) {
        console.log('Usuario no encontrado en la base de datos.');
        return null;
      }
  
      return filas[0].idUsuario; 
    } catch (error) {
      console.error('Error en fetchOne:', error);
      throw error;
    }
  };  
}

class OTP {
  constructor(idOTP, idUsuario, codigo, validez, usado) {
    this.idOTP = idOTP; //uuid()
    this.idUsuario = idUsuario;
    this.codigo = codigo;
    this.validez = validez;
    this.usado = usado;
  }

  static async crearOTP(usuario, codigo, validez) {
    try {
      const idUsuario = await Usuario.fetchOne(usuario);

      await db.execute(
        'INSERT INTO OTP (idUsuario, codigo, validez, usado) VALUES (?, ?, ?, false)',
        [idUsuario, codigo, validez]
      );
    } catch (error) {
      console.error('Error al crear OTP:', error);
      throw error;
    }
  }  

  static async obtenerOTP(idUsuario) {
    try {
        if (typeof idUsuario === 'undefined' || idUsuario === null) {
            throw new Error('ID de usuario no proporcionado');
        }
        const [filas] = await db.execute(
            'SELECT * FROM OTP WHERE idUsuario = ? AND usado = false AND validez > NOW() ORDER BY validez DESC LIMIT 1',
            [idUsuario]
        );
        return filas.length > 0 ? filas[0] : null;
    } catch (error) {
        console.error('Error al obtener OTP:', error);
        throw error;
    }
 }

  static async usarOTP(idOTP) {
    try {
      await db.execute(
        'UPDATE OTP SET usado = true WHERE idOTP = ?',
        [idOTP]
      );
    } catch (error) {
      console.error('Error al usar OTP:', error);
      throw error;
    }
  }
}

module.exports = { Usuario, OTP };
