const db = require('../util/database');

// Define la clase Hartman, encargada de manejar operaciones relacionadas con la prueba Hartman
class Hartman {
  // Método estático para obtener las preguntas de la fase 1 según el número de fase especificado
  static fetchFase1(fasePregunta) {
    return db.execute(
      'SELECT idPreguntaHartman, numeroPregunta, preguntaHartman FROM preguntashartman WHERE fasePregunta = ?',
      [fasePregunta]
    );
  }

  // Constructor que recibe un arreglo de respuestas para ser guardadas
  constructor(respuestasFase1) {
    this.respuestas = respuestasFase1;
  }

  // Método para guardar todas las respuestas utilizando un procedimiento almacenado
 
  save() {
 
// Itera sobre las respuestas y prepara una promesa por cada llamada al procedimiento
    const promesas = this.respuestas.map(respuesta => {
      return db.execute(
        'CALL proInsertarRespuestasPruebaX(?, ?, ?, ?, ?, ?)',
        respuesta
      );
    });

    // Ejecuta todas las promesas y retorna una única promesa que representa la operación global
    return Promise.all(promesas)
      .catch(err => {
        console.error('Error al guardar respuestas:', err);
        throw err;
      });
  }

    static async getRespuestasUsuario(idAspirante, idGrupo) {
      try {
          const query = `
            SELECT idPreguntaHartman, respuestaAbierta, tiempoRespuesta
            FROM respuestashartman
            WHERE idAspirante = ? AND idGrupo = ?
            GROUP BY idPreguntaHartman, respuestaAbierta, tiempoRespuesta
            ORDER BY idPreguntaHartman ASC
          `;
          const [rows] = await db.execute(query, [idAspirante, idGrupo]);
          return rows;
     } catch (error) {
          console.error('Error al obtener respuestas del usuario:', error);
          throw error;
      }
    }

    static async getGrupoPrueba(idAspirante, idPrueba){
      const [rows] = await db.execute(`
          SELECT idGrupo 
          FROM aspirantesgrupospruebas 
          WHERE idAspirante = ? AND idPrueba = ?
      `, [idAspirante, idPrueba]);
  
      return rows;
  }  
}

// Exporta la clase para que pueda ser utilizada en otros módulos
module.exports = Hartman;