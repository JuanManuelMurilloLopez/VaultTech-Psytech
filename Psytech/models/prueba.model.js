const db = require('../util/database');

module.exports = class Prueba{

    static fetchOneByName(nombrePrueba){
        return db.execute(`
                            SELECT *
                            FROM pruebas
                            WHERE nombre = ?
            `, [nombrePrueba]);
    }

    // Ya no leera archivos, que devolvera promesa vacia
    static fetchInstrucciones() {
        return Promise.resolve([
            [{ instrucciones: '' }], 
            []
        ]);
    }

    // Obtiene los datos personales de un aspirante según el grupo y la prueba OTIS.
    static getDatosPersonalesAspiranteOtis(idGrupo, idAspirante){
        return db.execute(`SELECT nombre, apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha 
            FROM datospersonales 
            WHERE idAspirante = ? 
            AND idPrueba = 5
            AND idGrupo = ?`, [idAspirante, idGrupo])
    }

    // Obtiene los datos personales de un aspirante según el grupo y la prueba OTIS.
    static getDatosPersonalesAspiranteColores(idGrupo, idAspirante){
        return db.execute(`SELECT nombre, apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha 
            FROM datospersonales 
            WHERE idAspirante = ? 
            AND idPrueba = 6
            AND idGrupo = ?`, [idAspirante, idGrupo])
    }

    static async saveDatosPersonales(idAspirante, idGrupo, idPrueba, datosPersonales) {
        // Intentar actualizar primero
        const [result] = await db.execute(`
            UPDATE datospersonales 
            SET nombre = ?, apellidoPaterno = ?, apellidoMaterno = ?, 
                puestoSolicitado = ?, fecha = NOW()
            WHERE idGrupo = ? AND idPrueba = ? AND idAspirante = ?
        `, [
            datosPersonales.nombre,
            datosPersonales.apellidoPaterno, 
            datosPersonales.apellidoMaterno,
            datosPersonales.puestoSolicitado,
            idGrupo,
            idPrueba,
            idAspirante
        ]);

    
        // Si no se actualizó ningún registro, hacer INSERT
        if (result.affectedRows === 0) {
            return db.execute(`
                INSERT INTO datospersonales 
                (idDatosPersonales, idGrupo, idPrueba, idAspirante, nombre, 
                apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha)
                VALUES (UUID(), ?, ?, ?, ?, ?, ?, ?, NOW())
            `, [
                idGrupo,
                idPrueba,
                idAspirante,
                datosPersonales.nombre,
                datosPersonales.apellidoPaterno, 
                datosPersonales.apellidoMaterno,
                datosPersonales.puestoSolicitado
            ]);
        }
    
        return result;
    }    

    // Solo para 16PF
    static async saveDatosPersonales16PF(idAspirante, idGrupo, idPrueba, datosPersonales) {
        // Intentar actualizar primero
        const [result] = await db.execute(`
            UPDATE datospersonales 
            SET nombre = ?, apellidoPaterno = ?, apellidoMaterno = ?, 
                puestoSolicitado = ?, fecha = NOW(), idGenero = ?
            WHERE idGrupo = ? AND idPrueba = ? AND idAspirante = ?
        `, [
            datosPersonales.nombre,
            datosPersonales.apellidoPaterno, 
            datosPersonales.apellidoMaterno,
            datosPersonales.puestoSolicitado,
            datosPersonales.idGenero,
            idGrupo,
            idPrueba,
            idAspirante
        ]);

    
        // Si no se actualizó ningún registro, hacer INSERT
        if (result.affectedRows === 0) {
            return db.execute(`
                INSERT INTO datospersonales 
                (idDatosPersonales, idGrupo, idPrueba, idAspirante, nombre, 
                apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha, idGenero)
                VALUES (UUID(), ?, ?, ?, ?, ?, ?, ?, NOW(), ?)
            `, [
                idGrupo,
                idPrueba,
                idAspirante,
                datosPersonales.nombre,
                datosPersonales.apellidoPaterno, 
                datosPersonales.apellidoMaterno,
                datosPersonales.puestoSolicitado,
                datosPersonales.idGenero
            ]);
        }
    
        return result;
    }

    static getAreaOtis(){
        return db.execute(
            `SELECT * FROM areasotis`
        );
    }

    static getPreguntasOtis(){
        return db.execute(
            `SELECT * FROM preguntasotis`
        );
    }

    static saveRespuestas = (idAspirante, idGrupo, idPrueba, respuestas) => {
        const promesas = [];

        for(let i=0; i < respuestas.length; i++){
            promesas.push(
                db.execute(
                    `INSERT INTO respuestaotisaspirante 
                    (idRespuestaOtis, idAspirante, idGrupo, idPreguntaOtis, idOpcionOtis, idPrueba, tiempoRespuesta)
                    VALUES (?, ?, ?, ?, ?)`,
                    [idPrueba, idAspirante, idGrupo, respuestas.idPregunta, respuestas.idOpcionOtis, respuestas.tiempoRespuesta] 
                ).catch((error) => {
                    console.error(`Error al insertar la respuesta ${i}:`, error);
                    throw error;
                })
            );
        }
        return Promise.all(promesas);
    };               

    static getPreguntas16PF(){}

    static getPreguntasHartman(){}

    static getPreguntaKostick(numeroPreguntaKostick){
        return db.execute(`
                            SELECT *
                            FROM preguntaskostick
                            WHERE numeroPreguntaKostick = ?
            `, [numeroPreguntaKostick]);
    }

    static getOpcionesByPregunta(idPregunta){
        return db.execute(`
                            SELECT *
                            FROM opcioneskostick
                            WHERE idPreguntaKostick = ?
                `, [idPregunta]); 
    }

    static getPregunta16PF(numeroPregunta16PF){
        return db.execute(`
                            SELECT *
                            FROM preguntas16pf
                            WHERE numeroPregunta16PF = ?
                `, [numeroPregunta16PF]);
    }

    static getOpcionesByPregunta16PF(idPregunta){
        return db.execute(`
                            SELECT *
                            FROM opciones16pf
                            WHERE idPregunta16PF = ?
                `, [idPregunta]); 
    }

    static getPreguntasKostick(){}

    static getPreguntasTerman(){}


    static addRespuestaOtis(){}

    static addRespuesta16PF(){}

    static addRespuestaHartman(){}

    static addRespuestaKostick(){}

    static addRespuestaTerman(){}

    static fetchColores(){
        return db.execute('SELECT * FROM colores ORDER BY numeroColor');
    }

    static saveSeleccion(idAspirante, idGrupo, idPrueba, fase, seleccion){
        const promesas = [];
        
        for (let i = 0; i < seleccion.length; i++) {
            promesas.push(
                db.execute(
                    `INSERT INTO seleccionescolores 
                    (idSeleccionColores, idPrueba, idAspirante, idGrupo, idColor, posicion, fase) 
                    VALUES (UUID(), ?, ?, ?, ?, ?, ?)`,
                    [idPrueba, idAspirante, idGrupo, seleccion[i].idColor, i, fase]
                ).catch((error) => {
                    console.error(`Error al insertar la selección ${i}:`, error);
                    throw error;
                })
            );
        }
        return Promise.all(promesas);
    }

    static getGrupoPrueba(idAspirante, idPrueba){
        return db.execute(`
            SELECT idGrupo 
            FROM aspirantesgrupospruebas 
            WHERE idAspirante = ? AND idPrueba = ?
        `, [idAspirante, idPrueba]);       
    }

    static getEstatusPrueba(idAspirante, idGrupo, idPrueba){
        return db.execute(
            `SELECT idEstatus 
            FROM aspirantesgrupospruebas
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );       
    }

    // Actualizar estado de prueba
    static updateEstatusPrueba(idAspirante, idGrupo, idPrueba, idEstatus = 1) {
        return db.execute(
            `UPDATE aspirantesgrupospruebas
            SET idEstatus = ? 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idEstatus, idAspirante, idGrupo, idPrueba]
        );
    }

    static verificarExistencia(idAspirante, idGrupo, idPrueba) {
        return db.execute(
            `SELECT * FROM aspirantesgrupospruebas 
            WHERE idAspirante = ? AND idGrupo = ? AND idPrueba = ?`,
            [idAspirante, idGrupo, idPrueba]
        );
    }

    static getRespuestasOtis(idAspirante, idGrupo){
        return db.execute(`
                SELECT u.nombreUsuario, u.apellidoPaterno, u.apellidoMaterno, 
                ao.idAreaOtis, ao.nombreAreaOtis,
                SUM(CASE WHEN o.esCorrecta = 1 THEN 1 ELSE 0 END) 
                AS respuestasCorrectas,
                SUM(CASE WHEN o.escorrecta = 0 THEN 1 ELSE 0 END) 
                AS respuestasIncorrectas,
                SUM(CASE WHEN o.esCorrecta IS NULL THEN 1 ELSE 0 END) 
                AS sinRespuesta,

                ROUND((SUM(CASE WHEN o.esCorrecta = 1 THEN 1 ELSE 0 END) 
                * 100.0) 
                /  
                NULLIF(SUM(CASE WHEN o.esCorrecta IS NOT NULL THEN 1 ELSE 0 
                END), 0), 2) AS porcentajeCorrectas  

                FROM aspirantes a  

                JOIN usuarios u ON a.idUsuario = u.idUsuario

                JOIN gruposaspirantes ga ON a.idAspirante = ga.idAspirante 
                AND ga.idGrupo = ?

                LEFT JOIN respuestaotisaspirante ra ON 
                a.idAspirante = ra.idAspirante

                LEFT JOIN opcionesotis o ON ra.idOpcionOtis = o.idOpcionOtis

                LEFT JOIN preguntasotis p ON 
                ra.idPreguntaOtis = p.idPreguntaOtis

                LEFT JOIN areasotis ao ON p.idAreaOtis = ao.idAreaOtis

                WHERE a.idAspirante = ?

                GROUP BY u.nombreUsuario, u.apellidoPaterno, u.apellidoMaterno,
                ao.idAreaOtis, ao.nombreAreaOtis
            `, [idGrupo, idAspirante]);
    }

    static getPuntajeBrutoOtis(idAspirante, idGrupo){
        return db.execute(`
                SELECT COUNT(*) as puntajeBruto
                FROM respuestaotisaspirante, opcionesotis
                WHERE idAspirante = ?
                AND idGrupo = ?
                AND opcionesotis.idOpcionOtis = 
                respuestaotisaspirante.idOpcionOtis
                AND opcionesotis.esCorrecta = 1
                GROUP BY idAspirante
            `, [idAspirante, idGrupo]);
    }

    static getRespuestasColores(idAspirante, idGrupo) {
        return db.execute(`
            SELECT fase, idColor, posicion
            FROM seleccionescolores
            WHERE idAspirante = ? AND idGrupo = ?
            ORDER BY fase, posicion
        `, [idAspirante, idGrupo]);
    }

    
    static getSeleccionesColores(idGrupo, idAspirante) {
        return db.execute(`
            SELECT 
                SC.idSeleccionColores, 
                SC.idColor, 
                SC.posicion, 
                SC.fase,
                C.nombreColor, 
                C.numeroColor, 
                C.hexColor  
            FROM seleccionescolores SC
            JOIN colores C ON SC.idColor = C.idColor
            WHERE SC.idAspirante = ?
            AND SC.idGrupo = ?
            AND SC.idPrueba = 6
            ORDER BY SC.fase, SC.posicion
            `, [idAspirante, idGrupo]);
    }   

    // Nombre aspirante analisis colores
    static getInformacionAspirante(idAspirante) {
        return db.execute(`
            SELECT u.nombreUsuario, u.apellidoPaterno, u.apellidoMaterno
            FROM usuarios u
            JOIN aspirantes a ON u.idUsuario = a.idUsuario
            WHERE a.idAspirante = ?
        `, [idAspirante]);
    }

    static updateEstatusPruebaK16(idAspirante, idGrupo, idPrueba, estatus){
        return db.execute(`
                            UPDATE aspirantesgrupospruebas
                            SET idEstatus = (SELECT idEstatus
                                                FROM estatusprueba
                                                WHERE nombreEstatus = ?)
                            WHERE idAspirante = ?
                            AND idGrupo = ?
                            AND idPrueba = ?
            `, [estatus, idAspirante, idGrupo, idPrueba]);
    }

}