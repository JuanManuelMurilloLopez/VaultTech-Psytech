const db = require('../util/database');
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


  static getIdAspirante(usuario) {
    return db.execute(
        `SELECT idAspirante 
         FROM aspirantes 
         WHERE idUsuario = ?`, 
        [usuario]
    );
  }

  static findUsuario(idUsuario){
    return db.execute(`
                              SELECT *
                              FROM usuarios
                              WHERE idUsuario = ?
      `, [idUsuario]);
  }

  static modificarUsuario(
                          idAspirante, nombreUsuario, apellidoPaterno, 
                          apellidoMaterno, correo, lada, numeroTelefono, 
                          estatusUsuario){
    return db.execute(`
                        UPDATE usuarios u
                        JOIN aspirantes a on u.idUsuario = a.idUsuario
                        SET u.nombreUsuario = ?,
                        u.apellidoPaterno = ?,
                        u.apellidoMaterno = ?,
                        u.correo = ?,
                        u.lada = ?,
                        u.numeroTelefono = ?,
                        u.estatusUsuario = ?
                        WHERE a.idAspirante = ?
      `, [nombreUsuario, apellidoPaterno, apellidoMaterno, 
          correo, lada, numeroTelefono, estatusUsuario, idAspirante]);
  }

  static getDatosParaSoporte(usuario) {
    return db.execute(`
      SELECT u.nombreUsuario, u.apellidoPaterno, u.apellidoMaterno, u.correo, g.nombreGrupo
      FROM usuarios u
      JOIN aspirantes a ON u.idUsuario = a.idUsuario
      JOIN gruposaspirantes ga ON a.idAspirante = ga.idAspirante
      JOIN grupos g ON ga.idGrupo = g.idGrupo
      WHERE u.usuario = ?
    `, [usuario]);
  }
}


module.exports = Usuario;