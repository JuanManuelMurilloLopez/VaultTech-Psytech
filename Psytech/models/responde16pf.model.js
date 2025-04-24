const db = require("../util/database");
const { v4: uuidv4 } = require("uuid");

module.exports = class Responde16PF {
  constructor(
    mi_idPregunta16PF,
    mi_idGrupo,
    mi_idAspirante,
    mi_idOpcion16PF,
    mi_tiempo
  ) {
    this.idRespuesta16PF = uuidv4();
    this.idPregunta16PF = mi_idPregunta16PF;
    this.idGrupo = mi_idGrupo;
    this.idAspirante = mi_idAspirante;
    this.idOpcion16PF = mi_idOpcion16PF;
    this.tiempo = mi_tiempo;
  }
  save() {
    return db
      .execute(
        "INSERT INTO responde16pf (idRespuesta16PF, idPregunta16PF, idGrupo, idAspirante, idOpcion16PF, tiempo) VALUES (?,?,?,?,?,?)",
        [
          this.idRespuesta16PF,
          this.idPregunta16PF,
          this.idGrupo,
          this.idAspirante,
          this.idOpcion16PF,
          this.tiempo,
        ]
      )
      .then(([result]) => {
        return {
          idPregunta16PF: this.idPregunta16PF,
          idGrupo: this.idGrupo,
          idAspirante: this.idAspirante,
        };
      });
  }
};