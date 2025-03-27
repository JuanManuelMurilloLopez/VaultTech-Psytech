const db = require('../util/database');


module.exports = class Grupo {
  constructor(nombreGrupo, carrera, semestre, anioGeneracion, idInstitucion, idNivelAcademico, fechaLimite) {
    this.nombreGrupo = nombreGrupo;
    this.carrera = carrera;
    this.semestre = semestre;
    this.anioGeneracion = anioGeneracion;
    this.idInstitucion = idInstitucion;
    this.idNivelAcademico = idNivelAcademico,
    this.fechaLimite = fechaLimite;
  }

  static fetchAll(){
    return db.execute(`SELECT grupos.idGrupo, institucion.nombreInstitucion,
                      grupos.nombreGrupo, grupos.estatusGrupo, grupos.carrera,
                      grupos.anioGeneracion, grupos.cicloEscolar,
                      COUNT(gruposaspirantes.idAspirante) as numeroAspirantes 
                      FROM grupos
                      JOIN institucion ON 
                      grupos.idInstitucion = institucion.idInstitucion
                      LEFT JOIN gruposaspirantes ON 
                      grupos.idGrupo = gruposaspirantes.idGrupo
                      GROUP BY 
                          grupos.idGrupo, 
                          institucion.nombreInstitucion, 
                          grupos.nombreGrupo, 
                          grupos.estatusGrupo, 
                          grupos.carrera, 
                          grupos.anioGeneracion, 
                          grupos.cicloEscolar
                      ORDER BY grupos.nombreGrupo, grupos.estatusGrupo`
                    )
  }

  static fetchAll(idInstitucion){
    return db.execute(`SELECT grupos.idGrupo, institucion.nombreInstitucion,
                      grupos.nombreGrupo, grupos.estatusGrupo, grupos.carrera,
                      grupos.anioGeneracion, grupos.cicloEscolar,
                      COUNT(gruposaspirantes.idAspirante) as numeroAspirantes 
                      FROM grupos
                      JOIN institucion ON 
                      grupos.idInstitucion = institucion.idInstitucion
                      LEFT JOIN gruposaspirantes ON 
                      grupos.idGrupo = gruposaspirantes.idGrupo
                      WHERE institucion.idInstitucion = ?
                      GROUP BY 
                          grupos.idGrupo, 
                          institucion.nombreInstitucion, 
                          grupos.nombreGrupo, 
                          grupos.estatusGrupo, 
                          grupos.carrera, 
                          grupos.anioGeneracion, 
                          grupos.cicloEscolar
                      ORDER BY grupos.nombreGrupo, grupos.estatusGrupo
                      `, [idInstitucion])
  }

  static fetchOne(idGrupo){
    return db.execute(`
        SELECT *, nombreNivelAcademico
        FROM grupos, nivelAcademico
        WHERE grupos.idNivelAcademico = nivelAcademico.idNivelAcademico
        AND grupos.idGrupo = ?
      `, [idGrupo])
  }

  static getAspirantes(idGrupo){
    return db.execute(`
        SELECT usuarios.nombreUsuario, usuarios.apellidoPaterno, 
        usuarios.apellidoMaterno
        FROM usuarios, aspirantes, gruposAspirantes
        WHERE aspirantes.idUsuario = usuarios.idUsuario
        AND aspirantes.idAspirante = gruposAspirantes.idAspirante
        AND gruposAspirantes.idGrupo = ?
        ORDER BY usuarios.nombreUsuario, usuarios.estatusUsuario;
      `, [idGrupo])
  }

  static getInformacionGruposPruebas(idGrupo){
    return db.execute(`
        SELECT idPrueba, fechaLimite
        FROM gruposPruebas
        WHERE idGrupo = ?
      `, [idGrupo])
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
       VALUES (uuid(), ?, true, ?, ?, ?, ?, ?)`,
      [
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
        `INSERT INTO gruposPruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES ((SELECT idGrupo FROM grupos WHERE grupos.nombreGrupo = ?), ?, CURRENT_DATE(), ?)`,
        [this.nombreGrupo, idPrueba, this.fechaLimite]
      );
    });

    return Promise.all(inserts);
  }

  guardarGrupoYPruebas(pruebasSeleccionadas) {
    return this.guardarGrupo()
      .then(() => this.guardarPruebasSeleccionadas(pruebasSeleccionadas));
  }

}