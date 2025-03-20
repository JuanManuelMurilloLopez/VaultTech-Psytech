-- Opciones para la pregunta 1: ¿Cuál de estas cinco palabras indica mejor lo que es una manzana?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 5), 1, 'Roja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 5), 2, 'Redonda', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 5), 3, 'Sabrosa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 5), 4, 'Fruta', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 1 AND idPrueba = 5), 5, 'Comida', FALSE);

-- Opciones para la pregunta 2: ¿Cuál de estas cinco palabras indica mejor lo que es un círculo?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 5), 1, 'Curva', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 5), 2, 'Redondo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 5), 3, 'Figura', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 5), 4, 'Punto', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 2 AND idPrueba = 5), 5, 'Línea', FALSE);

-- Opciones para la pregunta 3: Si reordenamos las letras "ROFMA", ¿qué palabra se forma?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 5), 1, 'FRAMO', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 5), 2, 'FORMA', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 5), 3, 'MAFRO', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 5), 4, 'FORMO', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 3 AND idPrueba = 5), 5, 'MARFO', FALSE);

-- Opciones para la pregunta 4: Si reordenamos las letras "GATO", ¿qué palabra se forma?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 5), 1, 'GOTA', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 5), 2, 'TOGA', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 5), 3, 'ATGO', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 5), 4, 'OGAT', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 4 AND idPrueba = 5), 5, 'TOAG', FALSE);

-- Opciones para la pregunta 5: ¿Cuál de estas cinco cosas no pertenece al mismo grupo?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 5), 1, 'Patata', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 5), 2, 'Zanahoria', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 5), 3, 'Manzana', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 5), 4, 'Cebolla', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 5 AND idPrueba = 5), 5, 'Remolacha', FALSE);

-- Opciones para la pregunta 6: ¿Qué número sigue en esta serie: 4, 8, 12, 16, 20, ...?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 5), 1, '22', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 5), 2, '24', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 5), 3, '25', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 5), 4, '26', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 6 AND idPrueba = 5), 5, '28', FALSE);

-- Opciones para la pregunta 7: Si el día después de mañana es domingo, ¿qué día fue ayer?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 5), 1, 'Miércoles', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 5), 2, 'Jueves', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 5), 3, 'Viernes', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 5), 4, 'Sábado', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 7 AND idPrueba = 5), 5, 'Martes', FALSE);

-- Opciones para la pregunta 8: Un comerciante compró algunos artículos por 27 pesos y los vendió por 30 pesos. ¿Cuánto ganó?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 5), 1, '2 pesos', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 5), 2, '3 pesos', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 5), 3, '4 pesos', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 5), 4, '27 pesos', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 8 AND idPrueba = 5), 5, '30 pesos', FALSE);

-- Opciones para la pregunta 9: Si 3 hombres pueden hacer un trabajo en 7 días, ¿cuántos hombres se necesitan para hacerlo en 1 día?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 5), 1, '3 hombres', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 5), 2, '7 hombres', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 5), 3, '10 hombres', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 5), 4, '21 hombres', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 9 AND idPrueba = 5), 5, '24 hombres', FALSE);

-- Opciones para la pregunta 10: Si dos pasteles cuestan 30 centavos, ¿cuántos pasteles se pueden comprar con 90 centavos?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 5), 1, '3 pasteles', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 5), 2, '4 pasteles', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 5), 3, '6 pasteles', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 5), 4, '9 pasteles', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 10 AND idPrueba = 5), 5, '15 pasteles', FALSE);

-- Opciones para la pregunta 11: ¿Cuál de estos cinco números no pertenece al mismo grupo? 2, 4, 8, 12, 16
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 11 AND idPrueba = 5), 1, '2', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 11 AND idPrueba = 5), 2, '4', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 11 AND idPrueba = 5), 3, '8', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 11 AND idPrueba = 5), 4, '12', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 11 AND idPrueba = 5), 5, '16', FALSE);

-- Opciones para la pregunta 12: Si un tren viaja a 60 kilómetros por hora, ¿cuánto tiempo tardará en recorrer 300 kilómetros?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 12 AND idPrueba = 5), 1, '3 horas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 12 AND idPrueba = 5), 2, '4 horas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 12 AND idPrueba = 5), 3, '5 horas', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 12 AND idPrueba = 5), 4, '6 horas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 12 AND idPrueba = 5), 5, '18000 horas', FALSE);

-- Opciones para la pregunta 13: Si una persona tiene 14 años y su hermano tiene el doble de edad, ¿cuántos años tendrá el hermano cuando la persona tenga 40 años?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 13 AND idPrueba = 5), 1, '66 años', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 13 AND idPrueba = 5), 2, '80 años', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 13 AND idPrueba = 5), 3, '54 años', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 13 AND idPrueba = 5), 4, '60 años', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 13 AND idPrueba = 5), 5, '52 años', FALSE);

-- Opciones para la pregunta 14: En una carrera, si adelantas al segundo, ¿en qué posición terminarás?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 14 AND idPrueba = 5), 1, 'Primero', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 14 AND idPrueba = 5), 2, 'Segundo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 14 AND idPrueba = 5), 3, 'Tercero', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 14 AND idPrueba = 5), 4, 'Depende de cuántos corredores hay', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 14 AND idPrueba = 5), 5, 'No se puede determinar', FALSE);

-- Opciones para la pregunta 15: Si 7 hombres construyen 6 casas en 3 días, ¿cuántas casas construirán 21 hombres en 7 días?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 15 AND idPrueba = 5), 1, '21 casas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 15 AND idPrueba = 5), 2, '28 casas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 15 AND idPrueba = 5), 3, '36 casas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 15 AND idPrueba = 5), 4, '42 casas', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 15 AND idPrueba = 5), 5, '126 casas', FALSE);

-- Opciones para la pregunta 16: Si uno dice "Un hombre puede hacer un trabajo en 4 días" y otro dice "Cuatro hombres pueden hacer el trabajo en 1 día", ¿quién tiene razón?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 16 AND idPrueba = 5), 1, 'El primero', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 16 AND idPrueba = 5), 2, 'El segundo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 16 AND idPrueba = 5), 3, 'Ambos', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 16 AND idPrueba = 5), 4, 'Ninguno', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 16 AND idPrueba = 5), 5, 'No se puede determinar', FALSE);

-- Opciones para la pregunta 17: Si un objeto cae 16 pies en el primer segundo, 48 pies en los dos primeros segundos, y 80 pies en los tres primeros segundos, ¿cuántos pies caerá en el cuarto segundo?
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 17 AND idPrueba = 5), 1, '32 pies', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 17 AND idPrueba = 5), 2, '48 pies', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 17 AND idPrueba = 5), 3, '64 pies', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 17 AND idPrueba = 5), 4, '112 pies', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 17 AND idPrueba = 5), 5, '16 pies', FALSE);

-- Opciones para la pregunta 18: Completa la analogía: Pájaro es a aire como pez es a...
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 18 AND idPrueba = 5), 1, 'Nadar', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 18 AND idPrueba = 5), 2, 'Agua', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 18 AND idPrueba = 5), 3, 'Escamas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 18 AND idPrueba = 5), 4, 'Mar', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 18 AND idPrueba = 5), 5, 'Branquias', FALSE);

-- Continuando con la pregunta 19 (completando)
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 19 AND idPrueba = 5), 1, '1 naranja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 19 AND idPrueba = 5), 2, '1.5 naranjas', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 19 AND idPrueba = 5), 3, '2 naranjas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 19 AND idPrueba = 5), 4, '3 naranjas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 19 AND idPrueba = 5), 5, '4 naranjas', FALSE);

-- Opciones para la pregunta 20: Si X es mayor que Y, y Y es mayor que Z, entonces X es __ que Z.
INSERT INTO opcionesOtis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 20 AND idPrueba = 5), 1, 'mayor', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 20 AND idPrueba = 5), 2, 'menor', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 20 AND idPrueba = 5), 3, 'igual', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 20 AND idPrueba = 5), 4, 'no se puede determinar', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasOtis WHERE numeroPregunta = 20 AND idPrueba = 5), 5, 'diferente', FALSE);