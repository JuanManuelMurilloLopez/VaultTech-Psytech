const db = require("../util/database");
const bcrypt = require("bcryptjs");
const { v4: uuidv4 } = require("uuid");

module.exports = class RespondeKostick {
  constructor(
    mi_idPreguntaKostick,
    mi_idGrupo,
    mi_idAspirante,
    mi_idOpcionKostick,
    mi_tiempo
  ) {
    this.idRespuestaKostick = uuidv4();
    this.idPreguntaKostick = mi_idPreguntaKostick;
    this.idGrupo = mi_idGrupo;
    this.idAspirante = mi_idAspirante;
    this.idOpcionKostick = mi_idOpcionKostick;
    this.tiempo = mi_tiempo;
  }
  save() {
    return db
      .execute(
        "INSERT INTO respondekostick (idRespuestaKostick, idPreguntaKostick, idGrupo, idAspirante, idOpcionKostick, tiempo) VALUES (?,?,?,?,?,?)",
        [
          this.idRespuestaKostick,
          this.idPreguntaKostick,
          this.idGrupo,
          this.idAspirante,
          this.idOpcionKostick,
          this.tiempo,
        ]
      )
      .then(([result]) => {
        return {
          idPreguntaKostick: this.idPreguntaKostick,
          idGrupo: this.idGrupo,
          idAspirante: this.idAspirante,
        };
      }).catch(err => {
      if (err.code === 'ER_DUP_ENTRY') {
        return db.execute(
          'UPDATE respondekostick SET idOpcionKostick = ?, tiempo = ? WHERE idPreguntaKostick = ? AND idGrupo = ? AND idAspirante = ?',
          [this.idOpcionKostick, this.tiempo, this.idPreguntaKostick, this.idGrupo, this.idAspirante]
        ).then(() => {
          return {
            idPreguntaKostick: this.idPreguntaKostick,
            idGrupo: this.idGrupo,
            idAspirante: this.idAspirante
          };
        });
      }
      throw err;
      });
  }

  static fetchRespuesta(idGrupo, idAspirante, numeroPreguntaKostick) {
    return db.execute(
      "SELECT opcionKostick FROM opcioneskostick WHERE idOpcionKostick = (SELECT idOpcionKostick FROM respondekostick WHERE idGrupo = ? AND idAspirante = ? AND idPreguntaKostick = (SELECT idPreguntaKostick FROM preguntaskostick WHERE numeroPreguntaKostick = ?))",
      [idGrupo, idAspirante, numeroPreguntaKostick]
    );
  }

  static fetchRespuestasAspirante(idGrupo, idAspirante){
    return db.execute(`
                        SELECT * 
                        FROM opcioneskostick 
                        WHERE idOpcionKostick IN 
                                                (SELECT idOpcionKostick 
                                                  FROM respondekostick 
                                                  WHERE idGrupo = ? 
                                                  AND idAspirante = ?)
      `, [idGrupo, idAspirante]);
  }

};