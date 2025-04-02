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
      if (!usuario) {
        throw new Error('El parámetro "usuario" está indefinido o es nulo.');
      }
  
      console.log('Parámetro de búsqueda:', usuario);
      const [filas] = await db.execute('SELECT * FROM usuarios WHERE idUsuario = ?', [usuario]);
  
      if (filas.length === 0) {
        console.log('Usuario no encontrado en la base de datos.');
        return null; // Retornar null si no hay resultados
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
    this.idOTP = idOTP;
    this.idUsuario = idUsuario;
    this.codigo = codigo;
    this.validez = validez;
    this.usado = usado;
  }

  // Método estático para crear un OTP
  static async crearOTP(usuario, codigo, validez) {
    try {
      // Obtener el ID del usuario por su nombre
      const idUsuario = await Usuario.fetchOne(usuario);
      console.log('Usuario recibido:', usuario);
  
      if (!idUsuario) {
        throw new Error('El usuario proporcionado no existe en la base de datos');
      }
  
      // Crear el OTP
      await db.execute(
        'INSERT INTO OTP (idUsuario, codigo, validez, usado) VALUES (?, ?, ?, false)',
        [idUsuario, codigo, validez]
      );
      console.log('OTP creado exitosamente.');
    } catch (error) {
      console.error('Error al crear OTP:', error);
      throw error;
    }
  }  

  // Método estático para obtener el OTP válido
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


  // Método estático para marcar el OTP como usado
  static async usarOTP(idOTP) {
    try {
      await db.execute(
        'UPDATE OTP SET usado = true WHERE idOTP = ?',
        [idOTP]
      );
      console.log('OTP marcado como usado.');
    } catch (error) {
      console.error('Error al usar OTP:', error);
      throw error;
    }
  }
}

// Exporta ambas clases, Usuario y OTP
module.exports = { Usuario, OTP };
