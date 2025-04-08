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

  static fetchAllInstitucion(idInstitucion){
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

  static getInstituciones() {
    return db.execute('SELECT idInstitucion, nombreInstitucion FROM institucion');
  }

  static getNiveles() {
    return db.execute('SELECT idNivelAcademico, nombreNivelAcademico FROM nivelAcademico');
  }

  static getPruebas() {
    return db.execute('SELECT idPrueba, nombre FROM pruebas');
  }

  static existe(nombreGrupo) {
    return db.execute('SELECT * FROM grupos WHERE nombreGrupo = ?', [nombreGrupo]);
  }

  saveGrupo() {
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


  savePruebasSeleccionadas(pruebasSeleccionadas) {
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

  saveGrupoYPruebas(pruebasSeleccionadas) {
    return this.saveGrupo()
      .then(() => this.savePruebasSeleccionadas(pruebasSeleccionadas));
  }


  // EDITAR GRUPO
  // Actualizar un grupo que ya existe
  static update(idGrupo, nombreGrupo, carrera, cicloEscolar, anioGeneracion, idNivelAcademico, estatusGrupo) {
    return db.execute(
      `UPDATE grupos 
       SET nombreGrupo = ?, 
           carrera = ?, 
           cicloEscolar = ?, 
           anioGeneracion = ?, 
           idNivelAcademico = ?, 
           estatusGrupo = ? 
       WHERE idGrupo = ?`,
      [nombreGrupo, carrera, cicloEscolar, anioGeneracion, idNivelAcademico, estatusGrupo, idGrupo]
    );
  }

  // Obtener las pruebas asignadas a un grupo
  static getPruebasAsignadas(idGrupo) {
    return db.execute(
      `SELECT gp.idGrupo, gp.idPrueba, p.nombre, gp.fechaAsignacion, gp.fechaLimite 
       FROM grupospruebas gp
       JOIN pruebas p ON gp.idPrueba = p.idPrueba
       WHERE gp.idGrupo = ?`,
      [idGrupo]
    );
  }

  // Actualizar las pruebas asignadas a un grupo
  static actualizarPruebasAsignadas(idGrupo, pruebasSeleccionadas, fechaLimite) {
    // Si no se pusieron pruebas no hacer nada
    if (!pruebasSeleccionadas) {
      return Promise.resolve();
    }

    // Convertir pruebas seleccionadas a arreglo si no lo son
    if (!Array.isArray(pruebasSeleccionadas)) {
      pruebasSeleccionadas = [pruebasSeleccionadas];
    }

    // Eliminamos asignaciones anteriores
    return db.execute(
      'DELETE FROM grupospruebas WHERE idGrupo = ?',
      [idGrupo]
    ).then(() => {
      // Si no hay terminar
      if (pruebasSeleccionadas.length === 0) {
        return Promise.resolve();
      }
      
      const promises = [];
      const fechaActual = new Date().toISOString().slice(0, 10); // YYYY-MM-DD
      
      for (const idPrueba of pruebasSeleccionadas) {
        promises.push(
          db.execute(
            'INSERT INTO grupospruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES (?, ?, ?, ?)',
            [idGrupo, idPrueba, fechaActual, fechaLimite]
          )
        );
      }
      
      return Promise.all(promises);
    });
  }

}