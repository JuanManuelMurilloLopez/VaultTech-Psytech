const db = require('../util/database');
const Grupo = require('../models/grupo.model');


module.exports = class Institucion {
  constructor(informacionInstitucion) {
    this.nombreInstitucion = informacionInstitucion.nombreInstitucion;
    this.idTipoInstitucion = informacionInstitucion.idTipoInstitucion;

  }

  save(){
    return db.execute(`INSERT INTO institucion
       VALUES (uuid(), ?, 1, ?, 0)`, 
       [this.nombreInstitucion, this.idTipoInstitucion]);
  }

  static fetchOne(idInstitucion){
    return Grupo.fetchAllInstitucion(idInstitucion)
    .then(([rows, fieldData]) => {
        return db.execute(`SELECT nombreInstitucion, 
          estatusInstitucion, nombreTipoInstitucion 
            FROM institucion, tipoinstitucion 
            WHERE institucion.idTipoInstitucion = 
            tipoinstitucion.idTipoInstitucion 
            AND institucion.idInstitucion = ?
            ORDER BY institucion.nombreInstitucion, 
            institucion.estatusInstitucion
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
            COUNT(CASE WHEN G.eliminado = 0 THEN 1 ELSE NULL END) AS numeroGrupos
        FROM institucion I
        LEFT JOIN grupos G ON I.idInstitucion = G.idInstitucion
        JOIN tipoinstitucion TI ON I.idTipoInstitucion = TI.idTipoInstitucion
        WHERE I.eliminado = 0
        GROUP BY 
            I.idInstitucion, 
            I.nombreInstitucion, 
            I.estatusInstitucion, 
            TI.nombreTipoInstitucion
        ORDER BY 
            I.nombreInstitucion, 
            I.estatusInstitucion;
   `);
  }

  static modificarInstitucion(idInstitucion, nombreInstitucion, 
                              estatusInstitucion, idTipoInstitucion){
    return db.execute(`UPDATE institucion
                SET nombreInstitucion = ?,
                estatusInstitucion = ?,
                idTipoInstitucion = ?
                WHERE idInstitucion = ?`
      , [nombreInstitucion, estatusInstitucion, 
        idTipoInstitucion, idInstitucion])
  }

  static eliminarInstitucion(idInstitucion){
    return db.execute(`
                        UPDATE institucion
                        SET eliminado = 1
                        WHERE idInstitucion = ?
      `, [idInstitucion]);
  }

}


