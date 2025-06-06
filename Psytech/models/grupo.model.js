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
                      grupos.anioGeneracion, grupos.cicloEscolar, grupos.idInstitucion,
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
        FROM grupos, nivelacademico
        WHERE grupos.idNivelAcademico = nivelacademico.idNivelAcademico
        AND grupos.idGrupo = ?
      `, [idGrupo])
  }

  static getAspirantes(idGrupo){
    return db.execute(`
        SELECT usuarios.nombreUsuario, usuarios.apellidoPaterno, 
        usuarios.apellidoMaterno, usuarios.estatusUsuario,
        aspirantes.idAspirante
        FROM usuarios, aspirantes, gruposaspirantes
        WHERE aspirantes.idUsuario = usuarios.idUsuario
        AND aspirantes.idAspirante = gruposaspirantes.idAspirante
        AND gruposaspirantes.idGrupo = ?
        ORDER BY usuarios.nombreUsuario, usuarios.estatusUsuario;
      `, [idGrupo])
  }

  static getInformacionGruposPruebas(idGrupo){
    return db.execute(`
        SELECT idPrueba, fechaLimite
        FROM grupospruebas
        WHERE idGrupo = ?
      `, [idGrupo])
  }

  static getInstituciones() {
    return db.execute('SELECT idInstitucion, nombreInstitucion FROM institucion');
  }

  static getNiveles() {
    return db.execute('SELECT idNivelAcademico, nombreNivelAcademico FROM nivelacademico');
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
        `INSERT INTO grupospruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES ((SELECT idGrupo FROM grupos WHERE grupos.nombreGrupo = ?), ?, CURRENT_DATE(), ?)`,
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
    
    if (!pruebasSeleccionadas) {
      pruebasSeleccionadas = [];
    }
  
    
    if (!Array.isArray(pruebasSeleccionadas)) {
      pruebasSeleccionadas = [pruebasSeleccionadas];
    }
  
    // Obtener las pruebas actualmente asignadas
    return db.execute(
      'SELECT idPrueba FROM grupospruebas WHERE idGrupo = ?',
      [idGrupo]
    ).then(([pruebasActuales]) => {
      const idsPruebasActuales = pruebasActuales.map(p => p.idPrueba.toString());
      const fechaActual = new Date().toISOString().slice(0, 10);
      
      // Pruebas eliminadas 
      const pruebasEliminadas = idsPruebasActuales.filter(p => !pruebasSeleccionadas.includes(p));
      
      // Pruebas nuevas 
      const pruebasNuevas = pruebasSeleccionadas.filter(p => !idsPruebasActuales.includes(p));
      
      // Eliminar todas las relaciones en grupospruebas
      return db.execute(
        'DELETE FROM grupospruebas WHERE idGrupo = ?',
        [idGrupo]
      ).then(() => {
        // Si no hay pruebas seleccionadas terminar
        if (pruebasSeleccionadas.length === 0) {
          return Promise.resolve();
        }
        
        // Poner las pruebas seleccionadas en grupospruebas
        const promisesGruposPruebas = [];
        for (const idPrueba of pruebasSeleccionadas) {
          promisesGruposPruebas.push(
            db.execute(
              'INSERT INTO grupospruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES (?, ?, ?, ?)',
              [idGrupo, idPrueba, fechaActual, fechaLimite]
            )
          );
        }
        
        return Promise.all(promisesGruposPruebas);
      }).then(() => {
        // Obtener los aspirantes del grupo
        return db.execute(
          'SELECT idAspirante FROM gruposaspirantes WHERE idGrupo = ?',
          [idGrupo]
        );
      }).then(([aspirantes]) => {
        if (aspirantes.length === 0) {
          return Promise.resolve();
        }
        
        const promises = [];
        
        // Si hay pruebas eliminadas tmb eliminarlas para los aspirantes
        if (pruebasEliminadas.length > 0) {
          for (const aspirante of aspirantes) {
            for (const idPrueba of pruebasEliminadas) {
              promises.push(
                db.execute(
                  'DELETE FROM aspirantesgrupospruebas WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?',
                  [aspirante.idAspirante, idGrupo, idPrueba]
                )
              );
            }
          }
        }
        
        // Poner las pruebas nuevas a los aspirantes con estado "Pendiente"
        if (pruebasNuevas.length > 0) {
          for (const aspirante of aspirantes) {
            for (const idPrueba of pruebasNuevas) {
              promises.push(
                db.execute(
                  'INSERT IGNORE INTO aspirantesgrupospruebas (idAspirante, idGrupo, idPrueba, idEstatus, fechaAsignacion, fechaLimite) VALUES (?, ?, ?, 2, ?, ?)',
                  [aspirante.idAspirante, idGrupo, idPrueba, fechaActual, fechaLimite]
                )
              );
            }
          }
        }
        
        return Promise.all(promises);
      });
    });
  }
  
  // Metodo para actualizar solo el estado del grupo
  static updateEstatus(idGrupo, estatusGrupo) {
    return db.execute(
      'UPDATE grupos SET estatusGrupo = ? WHERE idGrupo = ?',
      [estatusGrupo, idGrupo]
    );
  }
}