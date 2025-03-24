const db = require('../util/database');



module.exports = class Institucion {
  constructor() {
  }

  static fetchAll(){
    return db.execute(`SELECT I.nombreInstitucion, I.estatusInstitucion, 
        nombreTipoInstitucion, COUNT(idGrupo) as numeroGrupos
        FROM institucion I, grupos G, tipoinstitucion TI 
        WHERE I.idInstitucion = G.idInstitucion 
        AND I.idTipoInstitucion = TI.idTipoInstitucion 
        GROUP BY I.idInstitucion
        ORDER BY I.nombreInstitucion
        AND I.estatusInstitucion`);
  }
}


