const db = require('../util/database');
const Grupo = require('../models/Grupo');


module.exports = class Institucion {
  constructor() {
  }

  static fetchOne(idInstitucion){
    return Grupo.fetchAllInstitucion(idInstitucion)
    .then(([rows, fieldData]) => {
        return db.execute(`SELECT nombreInstitucion, estatusInstitucion, nombreTipoInstitucion 
            FROM institucion, tipoinstitucion 
            WHERE institucion.idTipoInstitucion = tipoinstitucion.idTipoInstitucion 
            AND institucion.idInstitucion = ?
            ORDER BY institucion.nombreInstitucion, institucion.estatusInstitucion
            `,[idInstitucion])
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
    return db.execute(`SELECT 
    I.idInstitucion, 
    I.nombreInstitucion, 
    I.estatusInstitucion, 
    TI.nombreTipoInstitucion, 
    COUNT(G.idGrupo) AS numeroGrupos
FROM institucion I
JOIN grupos G ON I.idInstitucion = G.idInstitucion
JOIN tipoinstitucion TI ON I.idTipoInstitucion = TI.idTipoInstitucion
GROUP BY 
    I.idInstitucion, 
    I.nombreInstitucion, 
    I.estatusInstitucion, 
    TI.nombreTipoInstitucion
ORDER BY 
    I.nombreInstitucion, 
    I.estatusInstitucion;`);
  }
}


