const db = require('../util/database');


module.exports = class Grupo {
  constructor() {
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

}