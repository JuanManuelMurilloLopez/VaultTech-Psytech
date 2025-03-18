-- Inserciones para la tabla respuestaOtisAspirante
INSERT INTO respuestaOtisAspirante (idRespuestaOtis, idAspirante, idPreguntaOtis, idOpcionPreguntaOtis, idPrueba, respuestaAbierta, tiempoRespuesta)
VALUES
-- Respuestas de Juan López
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,25),

-- Respuestas de María Pérez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,18),

-- Respuestas de Carlos Rodríguez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND numeroOpcion = 3),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,32),

-- Respuestas de Laura Gómez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,15),

-- Respuestas de Pedro Fernández
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,28),

-- Respuestas de Ana Martínez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND numeroOpcion = 5),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,45),

-- Respuestas de Luis Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,30),

-- Respuestas de Sofía Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,22),

-- Respuestas de Miguel Ramírez
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND numeroOpcion = 2),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,40),

-- Respuestas de Elena García
(UUID(), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 
    (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')),
    (SELECT idOpcionPreguntaOtis FROM opcionesPreguntasOtis WHERE idPreguntaOtis = (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS')) AND esCorrecta = TRUE),
    (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),NULL,19);