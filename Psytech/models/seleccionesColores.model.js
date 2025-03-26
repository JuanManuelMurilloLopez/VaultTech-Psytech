const db = require('../util/database'); 

const { v4: uuidv4 } = require('uuid');

exports.insertarSeleccionColor = async ({ idPrueba, idAspirante, idGrupo, idColor, posicion, fase }) => {
  const idSeleccionColores = uuidv4();
  await db.execute(
    `INSERT INTO seleccionesColores (idSeleccionColores, idPrueba, idAspirante, idGrupo, idColor, posicion, fase)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [idSeleccionColores, idPrueba, idAspirante, idGrupo, idColor, posicion, fase]
  );
};