const db = require('../util/database');


module.exports = class Grupo {
  constructor() {
  }

  static fetchAll(){
    return db.execute(`SELECT nombreInstitucion, nombreGrupo, estatusGrupo, 
        carrera, anioGeneracion, cicloEscolar, 
        COUNT(idAspirante) as numeroAspirantes
        FROM grupos, institucion, gruposaspirantes 
        WHERE grupos.idInstitucion = institucion.idInstitucion 
        AND grupos.idGrupo = gruposaspirantes.idGrupo 
        GROUP BY grupos.idGrupo`)
  }

  static fetchAll(idInstitucion){
    return db.execute(`SELECT nombreInstitucion, nombreGrupo, estatusGrupo, 
        carrera, anioGeneracion, cicloEscolar, 
        COUNT(idAspirante) as numeroAspirantes 
        FROM grupos, institucion, gruposaspirantes 
        WHERE grupos.idInstitucion = institucion.idInstitucion 
        AND grupos.idGrupo = gruposaspirantes.idGrupo 
        AND grupos.idInstitucion = ? 
        GROUP BY grupos.idGrupo`, [idInstitucion])
  }

}