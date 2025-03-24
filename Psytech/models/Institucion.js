const db = require('../util/database');
const Grupo = require('../models/Grupo');


module.exports = class Institucion {
  constructor() {
  }

  static fetchOne(idInstitucion){
    return Grupo.fetchAll(idInstitucion)
    .then(([rows, fieldData]) => {
        return db.execute(`SELECT nombreInstitucion, estatusInstitucion, nombreTipoInstitucion 
            FROM institucion, tipoinstitucion 
            WHERE institucion.idTipoInstitucion = tipoinstitucion.idTipoInstitucion 
            AND institucion.idInstitucion = ?`,[idInstitucion])
            .then(([institucionRows])=> {
                return [institucionRows[0], rows];
            })
            .catch((error) => {
                console.log(error);
            });
    })
    .catch((error) => {
        console.log(error);
    });
  }

  static fetchAll(){
    return db.execute(`SELECT I.idInstitucion, I.nombreInstitucion, I.estatusInstitucion, 
        nombreTipoInstitucion, COUNT(idGrupo) as numeroGrupos
        FROM institucion I, grupos G, tipoinstitucion TI 
        WHERE I.idInstitucion = G.idInstitucion 
        AND I.idTipoInstitucion = TI.idTipoInstitucion 
        GROUP BY I.idInstitucion
        ORDER BY I.nombreInstitucion
        AND I.estatusInstitucion`);
  }
}


