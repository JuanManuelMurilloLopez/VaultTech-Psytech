const db = require('../util/database');

module.exports = class CatalogoPruebas {
  constructor(prueba) {
    this.nombre = prueba.nombre;
    this.descripcion = prueba.descripcion;
    this.instrucciones = prueba.instrucciones;
    this.tiempo = prueba.tiempo;
  }

  static fetchAll() {
    return db.execute(`
      SELECT idPrueba, nombre, descripcion, instrucciones, tiempo
      FROM pruebas
      ORDER BY nombre
    `);
  }
}