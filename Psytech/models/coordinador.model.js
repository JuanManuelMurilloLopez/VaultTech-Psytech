const db = require('../util/database');


module.exports = class Coordinador {
  constructor(usuario, estatusUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, correo, lada, numeroTelefono, idRol) {
    this.usuario = usuario;
    this.estatusUsuario = estatusUsuario;
    this.nombreUsuario = nombreUsuario;
    this.apellidoPaterno = apellidoPaterno;
    this.apellidoMaterno = apellidoMaterno;
    this.correo = correo;
    this.lada = lada;
    this.numeroTelefono = numeroTelefono;
    this.idRol = idRol;
  }

  static fetchAll() {
    return db.execute(`SELECT
                          usuarios.idUsuario,
                          usuarios.usuario,
                          usuarios.estatusUsuario,
                          usuarios.nombreUsuario,
                          usuarios.apellidoPaterno,
                          usuarios.apellidoMaterno,
                          usuarios.correo,
                          usuarios.lada,
                          usuarios.numeroTelefono,
                          roles.nombreRol
                        FROM usuarios
                        JOIN roles ON usuarios.idRol = roles.idRol
                        WHERE usuarios.idRol = 1
                        ORDER BY usuarios.nombreUsuario, usuarios.apellidoPaterno`);
  }

  static fetchOne(idUsuario) {
    return db.execute(
      `SELECT *
       FROM usuarios
       WHERE idUsuario = ? AND idRol = 1`,
      [idUsuario]
    );
  }  

  saveCoordinador() {
    const usuario = this.usuario || null;
    const estatusUsuario = this.estatusUsuario || 1;
    const nombreUsuario = this.nombreUsuario || null;
    const apellidoPaterno = this.apellidoPaterno || null;
    const apellidoMaterno = this.apellidoMaterno || null;
    const correo = this.correo || null;
    const lada = this.lada || null;
    const numeroTelefono = this.numeroTelefono || null;
    const idRol = this.idRol || 1; 

    return db.execute(
      `INSERT INTO usuarios
       (idUsuario, usuario, estatusUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, correo, lada, numeroTelefono, idRol)
       VALUES (uuid(), ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        usuario,
        estatusUsuario,
        nombreUsuario,
        apellidoPaterno,
        apellidoMaterno,
        correo,
        lada,
        numeroTelefono,
        idRol
      ]
    );
  }

  static correoExiste(correo) {
    return db.execute('SELECT COUNT(*) as total FROM usuarios WHERE correo = ?', [correo])
        .then(([rows]) => {
            return rows[0].total > 0;
        });
  }

  // EDITAR USUARIO
  // Actualizar un usuario que ya existe (sin modificar el rol)
  static update(idUsuario, usuario, estatusUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, correo, lada, numeroTelefono) {
    return db.execute(
      `UPDATE usuarios 
      SET usuario = ?, 
          estatusUsuario = ?, 
          nombreUsuario = ?, 
          apellidoPaterno = ?, 
          apellidoMaterno = ?, 
          correo = ?, 
          lada = ?, 
          numeroTelefono = ?
      WHERE idUsuario = ?`,
      [usuario, estatusUsuario, nombreUsuario, apellidoPaterno, apellidoMaterno, correo, lada, numeroTelefono, idUsuario]
    );
  }

  // ACTUALIZAR ESTATUS DE USUARIO
  static updateEstatus(idUsuario, estatusUsuario) {
    return db.execute(
      'UPDATE usuarios SET estatusUsuario = ? WHERE idUsuario = ?',
      [estatusUsuario, idUsuario]
    );
  }
}
