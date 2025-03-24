const db = require('../util/database');
const { v4: uuidv4 } = require('uuid');

class Grupo {
  constructor(nombreGrupo, carrera, semestre, anioGeneracion, idInstitucion, idNivelAcademico) {
    this.idGrupo = uuidv4();
    this.nombreGrupo = nombreGrupo;
    this.carrera = carrera;
    this.semestre = semestre;
    this.anioGeneracion = anioGeneracion;
    this.idInstitucion = idInstitucion;
    this.idNivelAcademico = idNivelAcademico;
  }

  static obtenerInstituciones() {
    return db.execute('SELECT idInstitucion, nombreInstitucion FROM institucion');
  }

  static obtenerNiveles() {
    return db.execute('SELECT idNivelAcademico, nombreNivelAcademico FROM nivelAcademico');
  }

  static obtenerPruebas() {
    return db.execute('SELECT idPrueba, nombre FROM pruebas');
  }

  static existe(nombreGrupo) {
    return db.execute('SELECT * FROM grupos WHERE nombreGrupo = ?', [nombreGrupo]);
  }

  guardarGrupo() {
    return db.execute(
      `INSERT INTO grupos (idGrupo, nombreGrupo, estatusGrupo, cicloEscolar, anioGeneracion, carrera, idInstitucion, idNivelAcademico)
       VALUES (?, ?, true, ?, ?, ?, ?, ?)`,
      [
        this.idGrupo,
        this.nombreGrupo,
        this.semestre,
        this.anioGeneracion,
        this.carrera,
        this.idInstitucion,
        this.idNivelAcademico
      ]
    );
  }

  guardarPruebasSeleccionadas(pruebasSeleccionadas) {
    if (!Array.isArray(pruebasSeleccionadas)) {
      pruebasSeleccionadas = [pruebasSeleccionadas];
    }

    const inserts = pruebasSeleccionadas.map(idPrueba => {
      return db.execute(
        `INSERT INTO gruposPruebas (idGrupo, idPrueba) VALUES (?, ?)`,
        [this.idGrupo, idPrueba]
      );
    });

    return Promise.all(inserts);
  }

  guardarGrupoYPruebas(pruebasSeleccionadas) {
    return this.guardarGrupo()
      .then(() => this.guardarPruebasSeleccionadas(pruebasSeleccionadas));
  }
}

module.exports = Grupo;