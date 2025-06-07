const Prueba = require('../models/prueba.model');

const canAspiranteTakeTest = async (idAspirante, idGrupo, idPrueba) => {
    const [statusRows] = Prueba.getEstatusPrueba(idAspirante, idGrupo, idPrueba);
    if (statusRows.length > 0 && statusRows[0].idEstatus !== 2) {
        return true;
    }
    return false;
}

module.exports = { canAspiranteTakeTest };