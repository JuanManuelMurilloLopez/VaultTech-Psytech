const db = require('../util/database');

module.exports = class Psicologo {
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
                        WHERE usuarios.idRol = 2
                        ORDER BY usuarios.nombreUsuario, usuarios.apellidoPaterno`);
  }

  savePsicologo() {
    const usuario = this.usuario || null;
    const estatusUsuario = this.estatusUsuario || 1;
    const nombreUsuario = this.nombreUsuario || null;
    const apellidoPaterno = this.apellidoPaterno || null;
    const apellidoMaterno = this.apellidoMaterno || null;
    const correo = this.correo || null;
    const lada = this.lada || null;
    const numeroTelefono = this.numeroTelefono || null;
    const idRol = this.idRol || 2; 

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
}
