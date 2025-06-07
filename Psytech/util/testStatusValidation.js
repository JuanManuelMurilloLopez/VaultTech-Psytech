const Prueba = require('../models/prueba.model');

const canAspiranteTakeTest = async (idAspirante, idGrupo, idPrueba) => {
    if (!idAspirante || !idGrupo || !idPrueba) {
        console.error(`Error al validar el estado de la prueba: ${idAspirante}, ${idGrupo}, ${idPrueba}`, new Error().stack);
        return true;
    }
    const [statusRows] = await Prueba.getEstatusPrueba(idAspirante, idGrupo, idPrueba);
    if (statusRows.length > 0 && statusRows[0].idEstatus === 2) {
        return true;
    }
    return false;
}

module.exports = { canAspiranteTakeTest };