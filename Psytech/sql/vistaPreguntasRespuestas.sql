USE psytech;

CREATE VIEW vistaPreguntasRespustasAspirante AS

SELECT PO.numeroPregunta,PO.preguntaOtis, OO.opcionOtis, OO.descripcionOpcion, OO.esCorrecta, ROA.tiempoRespuesta, ROA.respuestaAbierta, ROA.idAspirante, ROA.idPrueba, ROA.idGrupo
FROM respuestaOtisAspirante ROA
JOIN preguntasOtis PO ON ROA.idPreguntaOtis = PO.idPreguntaOtis
JOIN opcionesOtis OO ON ROA.idOpcionOtis = OO.idOpcionOtis

SELECT numeroPregunta, preguntaOtis, opcionOtis, descripcionOpcion, esCorrecta, tiempoRespuesta, respuestaAbierta FROM vistaPreguntasRespustasAspirante
WHERE idAspirante = (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE Correo = 'juanlópez39@example.com'))
AND idPrueba = 5
AND idGrupo = (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC')
