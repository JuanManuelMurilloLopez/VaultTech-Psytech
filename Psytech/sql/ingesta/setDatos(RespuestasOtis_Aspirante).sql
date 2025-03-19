-- Inserciones para la tabla respuestaOtisAspirante con idGrupo y usando ID de prueba directo
INSERT INTO respuestaOtisAspirante  (idRespuestaOtis, idAspirante, idPreguntaOtis, idOpcionOtis, idPrueba, respuestaAbierta, tiempoRespuesta, idGrupo)
VALUES
-- Respuestas de Juan López
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 25,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de María Pérez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 18,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Carlos Rodríguez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 1) AND opcionOtis = 3),
    1, NULL, 32,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Laura Gómez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 15,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Pedro Fernández
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 28,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Ana Martínez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 1) AND opcionOtis = 5),
    1, NULL, 45,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Luis Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 30,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Sofía Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 22,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Miguel Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 1) AND opcionOtis = 2),
    1, NULL, 40,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')),

-- Respuestas de Elena García
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 1),
    (SELECT idOpcionOtis FROM opcionesOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 1) AND esCorrecta = TRUE),
    1, NULL, 19,
    (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'));