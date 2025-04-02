const db = require('../util/database');

class OTP {
  constructor(idOTP, idUsuario, codigo, validez, usado) {
    this.idOTP = idOTP;
    this.idUsuario = idUsuario;
    this.codigo = codigo;
    this.validez = validez;
    this.usado = usado;
  }

  static async crearOTP(idUsuario, codigo, validez) {
    try {
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
      const [filas] = await db.execute(
        'SELECT * FROM OTP WHERE idUsuario = ? AND usado = false AND validez > NOW() ORDER BY validez DESC LIMIT 1',
        [idUsuario]
      );
      return filas[0];
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

module.exports = OTP;
