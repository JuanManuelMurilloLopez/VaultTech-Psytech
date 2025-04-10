-- Opciones para la pregunta 1: ¿Qué expresa mejor lo que es un martillo?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 1 AND idPrueba = 5), 1, 'Cosa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 1 AND idPrueba = 5), 2, 'Mueble', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 1 AND idPrueba = 5), 3, 'Arma', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 1 AND idPrueba = 5), 4, 'Herramienta', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 1 AND idPrueba = 5), 5, 'Máquina', FALSE);

-- Opciones para la pregunta 2: ¿Cuál de estas cinco palabras significa lo contrario de GANAR?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 2 AND idPrueba = 5), 1, 'Conseguir', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 2 AND idPrueba = 5), 2, 'Decaer', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 2 AND idPrueba = 5), 3, 'Perder', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 2 AND idPrueba = 5), 4, 'Acceder', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 2 AND idPrueba = 5), 5, 'Ensayar', FALSE);

-- Opciones para la pregunta 3: La hierba es para la vaca lo que el pan es para…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 3 AND idPrueba = 5), 1, 'La manteca', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 3 AND idPrueba = 5), 2, 'La harina', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 3 AND idPrueba = 5), 3, 'Y la leche', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 3 AND idPrueba = 5), 4, 'El hombre', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 3 AND idPrueba = 5), 5, 'La cosecha', FALSE);

-- Opciones para la pregunta 4: ¿Qué es para el automóvil lo que el carbón es para la locomotora?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 4 AND idPrueba = 5), 1, 'El humo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 4 AND idPrueba = 5), 2, 'La motocicleta', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 4 AND idPrueba = 5), 3, 'Las ruedas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 4 AND idPrueba = 5), 4, 'La gasolina', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 4 AND idPrueba = 5), 5, 'La bocina', FALSE);

-- Opciones para la pregunta 5: 'Los números que vienen aquí debajo forman una serie y uno de ellos no es correcto. ¿Qué número debería figurar en su lugar?                    5  10  15  20  25  30  35  39  45  50
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 5 AND idPrueba = 5), 1, '35', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 5 AND idPrueba = 5), 2, '40', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 5 AND idPrueba = 5), 3, '42', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 5 AND idPrueba = 5), 4, '45', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 5 AND idPrueba = 5), 5, '48', FALSE);


-- Opciones para la pregunta 6: La mano es para el brazo lo que el pie es para…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 6 AND idPrueba = 5), 1, 'La pierna', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 6 AND idPrueba = 5), 2, 'El pulgar', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 6 AND idPrueba = 5), 3, 'El dedo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 6 AND idPrueba = 5), 4, 'El puño', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 6 AND idPrueba = 5), 5, 'La rodilla', FALSE);


-- Opciones para la pregunta 7: De un muchacho que no hace más que hablar de sus cualidades y de su sabiduría, se dice que…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 7 AND idPrueba = 5), 1, 'Miente', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 7 AND idPrueba = 5), 2, 'Bromea', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 7 AND idPrueba = 5), 3, 'Engaña', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 7 AND idPrueba = 5), 4, 'Se divierte', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 7 AND idPrueba = 5), 5, 'Se alaba', TRUE);


-- Opciones para la pregunta 8: De una persona que tiene deseos de hacer una cosa pero teme al fracaso, se dice que es…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 8 AND idPrueba = 5), 1, 'Seria', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 8 AND idPrueba = 5), 2, 'Ansiosa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 8 AND idPrueba = 5), 3, 'Trabajadora', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 8 AND idPrueba = 5), 4, 'Enérgica', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 8 AND idPrueba = 5), 5, 'Tímida', TRUE);


-- Opciones para la pregunta 9: El sombrero es para la cabeza lo que el dedal es para…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 9 AND idPrueba = 5), 1, 'El dedo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 9 AND idPrueba = 5), 2, 'La aguja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 9 AND idPrueba = 5), 3, 'El hilo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 9 AND idPrueba = 5), 4, 'La mano', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 9 AND idPrueba = 5), 5, 'La costura', FALSE);


-- Opciones para la pregunta 10: El hijo de la hermana de mi padre es mi…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 10 AND idPrueba = 5), 1, 'Hermano', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 10 AND idPrueba = 5), 2, 'Sobrino', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 10 AND idPrueba = 5), 3, 'Primo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 10 AND idPrueba = 5), 4, 'Tío', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 10 AND idPrueba = 5), 5, 'Nieto', FALSE);


-- Opciones para la pregunta 11: ¿Cuál de estas cantidades es la mayor?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 11 AND idPrueba = 5), 1, '6.456', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 11 AND idPrueba = 5), 2, '8.968', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 11 AND idPrueba = 5), 3, '4.265', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 11 AND idPrueba = 5), 4, '5.064', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 11 AND idPrueba = 5), 5, '4.108', FALSE);


-- Opciones para la pregunta 12: Cuando sabemos que un acontecimiento va a pasar sin ninguna clase de dudas, decimos que es…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 12 AND idPrueba = 5), 1, 'Probable', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 12 AND idPrueba = 5), 2, 'Seguro', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 12 AND idPrueba = 5), 3, 'Dudoso', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 12 AND idPrueba = 5), 4, 'Posible', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 12 AND idPrueba = 5), 5, 'Diferido', FALSE);


-- Opciones para la pregunta 13: ¿Qué palabra indica el lado opuesto de ESTE?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 13 AND idPrueba = 5), 1, 'Norte', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 13 AND idPrueba = 5), 2, 'Polo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 13 AND idPrueba = 5), 3, 'Ecuador', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 13 AND idPrueba = 5), 4, 'Sur', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 13 AND idPrueba = 5), 5, 'Oeste', TRUE);


-- Opciones para la pregunta 14: ¿Qué palabra indica lo contrario a SOBERBIA?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 14 AND idPrueba = 5), 1, 'Tristeza', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 14 AND idPrueba = 5), 2, 'Humildad', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 14 AND idPrueba = 5), 3, 'Pobreza', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 14 AND idPrueba = 5), 4, 'Variedad', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 14 AND idPrueba = 5), 5, 'Altanería', FALSE);


-- Opciones para la pregunta 15: ¿Cuál de estas cinco cosas no debería agruparse a las demás?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 15 AND idPrueba = 5), 1, 'Pera', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 15 AND idPrueba = 5), 2, 'Plátano', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 15 AND idPrueba = 5), 3, 'Naranja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 15 AND idPrueba = 5), 4, 'Pelota', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 15 AND idPrueba = 5), 5, 'Higo', FALSE);


-- Opciones para la pregunta 16: ¿Qué definición de éstas expresa más exactamente lo que es un reloj?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 16 AND idPrueba = 5), 1, 'Una cosa redonda que hace tic-tac', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 16 AND idPrueba = 5), 2, 'Un aparato que se coloca en las torres', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 16 AND idPrueba = 5), 3, 'Un instrumento redondo con una cadena', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 16 AND idPrueba = 5), 4, 'Un instrumento que mide el tiempo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 16 AND idPrueba = 5), 5, 'Una cosa redonda que tiene aguja y un cristal', FALSE);


-- Opciones para la pregunta 17: Si una persona, al salir de su casa, anda siete pasos hacia la derecha y después retrocede cuatro a la izquierda, ¿A cuantos pasos está de su casa? 
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 17 AND idPrueba = 5), 1, '7', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 17 AND idPrueba = 5), 2, '4', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 17 AND idPrueba = 5), 3, '11', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 17 AND idPrueba = 5), 4, '3', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 17 AND idPrueba = 5), 5, '10', FALSE);


-- Opciones para la pregunta 18: Si comparamos el automóvil a una carreta, ¿A qué deberíamos comparar una motocicleta?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 18 AND idPrueba = 5), 1, 'A la carrera', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 18 AND idPrueba = 5), 2, 'Al caballo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 18 AND idPrueba = 5), 3, 'Al tranvía', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 18 AND idPrueba = 5), 4, 'Al tren', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 18 AND idPrueba = 5), 5, 'A la bicicleta', TRUE);


-- Opciones para la pregunta 19: ¿Cuál es la razón por la cuál las fachadas de los comercios están muy iluminadas?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 19 AND idPrueba = 5), 1, 'Con el fin de que los transeúntes sepan en dónde están', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 19 AND idPrueba = 5), 2, 'Para que se puedan ver bien los artículos expuestos y la gente sienta deseos de comprar', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 19 AND idPrueba = 5), 3, 'Porque los comercios pagan muy barata la corriente eléctrica', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 19 AND idPrueba = 5), 4, 'Para aumentar la iluminación de la calle', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 19 AND idPrueba = 5), 5, 'Porque el Ayuntamiento les obliga', FALSE);


-- Opciones para la pregunta 20: ¿Cuál de estas cinco cosas tiene más parecido con manzana, melocotón y pera?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 20 AND idPrueba = 5), 1, 'Semilla', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 20 AND idPrueba = 5), 2, 'Árbol', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 20 AND idPrueba = 5), 3, 'Ciruela', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 20 AND idPrueba = 5), 4, 'Jugo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 20 AND idPrueba = 5), 5, 'Mondadura', FALSE);

-- Opciones para la pregunta 21: En el abecedario, ¿Qué letra sigue de la K?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 21 AND idPrueba = 5), 1, 'La J', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 21 AND idPrueba = 5), 2, 'La G', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 21 AND idPrueba = 5), 3, 'La M', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 21 AND idPrueba = 5), 4, 'La L', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 21 AND idPrueba = 5), 5, 'La N', FALSE);


-- Opciones para la pregunta 22: El Rey es a la monarquía lo que el Presidente es a…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 22 AND idPrueba = 5), 1, 'La Presidencia del Consejo de Ministros', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 22 AND idPrueba = 5), 2, 'El Senado', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 22 AND idPrueba = 5), 3, 'La República', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 22 AND idPrueba = 5), 4, 'Un Monárquico', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 22 AND idPrueba = 5), 5, 'Un republicano', FALSE);


-- Opciones para la pregunta 23: La lana es para el carnero lo que las plumas son para…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 23 AND idPrueba = 5), 1, 'La almohada', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 23 AND idPrueba = 5), 2, 'El conejo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 23 AND idPrueba = 5), 3, 'El pájaro', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 23 AND idPrueba = 5), 4, 'La cabra', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 23 AND idPrueba = 5), 5, 'La cama', FALSE);

-- Opciones para la pregunta 24: ¿Cuál de estas definiciones expresa más exactamente lo que es un cordero?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 24 AND idPrueba = 5), 1, 'Un animal terrestre', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 24 AND idPrueba = 5), 2, 'Un ser que tiene cuatro patar y una cola', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 24 AND idPrueba = 5), 3, 'Un animal pequeño y avispado', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 24 AND idPrueba = 5), 4, 'Un carnero joven', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 24 AND idPrueba = 5), 5, 'Un animalito que come hierba', FALSE);


-- Opciones para la pregunta 25: Pesado es a plomo lo que sonoro es a…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 25 AND idPrueba = 5), 1, 'Suave', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 25 AND idPrueba = 5), 2, 'Pequeño', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 25 AND idPrueba = 5), 3, 'Macizo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 25 AND idPrueba = 5), 4, 'Gris', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 25 AND idPrueba = 5), 5, 'Ruido', TRUE);


-- Opciones para la pregunta 26: Mejor es a bueno lo que peor es a…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 26 AND idPrueba = 5), 1, 'Muy bueno', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 26 AND idPrueba = 5), 2, 'Mediano', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 26 AND idPrueba = 5), 3, 'Malo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 26 AND idPrueba = 5), 4, 'Nulo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 26 AND idPrueba = 5), 5, 'Superior', FALSE);


-- Opciones para la pregunta 27: ¿Cuál de estas cosas tiene más parecido con tenazas, alambre y clavo?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 27 AND idPrueba = 5), 1, 'Billete', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 27 AND idPrueba = 5), 2, 'Hueso', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 27 AND idPrueba = 5), 3, 'Cuerda', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 27 AND idPrueba = 5), 4, 'Lápiz', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 27 AND idPrueba = 5), 5, 'Llave', TRUE);


-- Opciones para la pregunta 28: Ante el dolor de los demás normalmente sentimos…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 28 AND idPrueba = 5), 1, 'Rabia', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 28 AND idPrueba = 5), 2, 'Piedad', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 28 AND idPrueba = 5), 3, 'Desprecio', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 28 AND idPrueba = 5), 4, 'Desdén', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 28 AND idPrueba = 5), 5, 'Añoranza', FALSE);


-- Opciones para la pregunta 29: Cuando alguien concibe una nueva máquina, se dice que ha hecho una…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 29 AND idPrueba = 5), 1, 'Exploración', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 29 AND idPrueba = 5), 2, 'Adaptación', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 29 AND idPrueba = 5), 3, 'Renovación', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 29 AND idPrueba = 5), 4, 'Novedad', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 29 AND idPrueba = 5), 5, 'Invención', TRUE);


-- Opciones para la pregunta 30: ¿Qué es para la abeja lo que las uñas son para el gato?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 30 AND idPrueba = 5), 1, 'Vuelo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 30 AND idPrueba = 5), 2, 'Miel', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 30 AND idPrueba = 5), 3, 'Alas', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 30 AND idPrueba = 5), 4, 'Cera', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 30 AND idPrueba = 5), 5, 'Aguijón', TRUE);


-- Opciones para la pregunta 31: Uno de los números de esta serie está equivocado. ¿Qué número debería figurar en su lugar?                    1  7  2  7  3  7  4  7  5  7  6  7  8  7
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 31 AND idPrueba = 5), 1, '7', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 31 AND idPrueba = 5), 2, '6', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 31 AND idPrueba = 5), 3, '5', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 31 AND idPrueba = 5), 4, '8', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 31 AND idPrueba = 5), 5, '9', FALSE);


-- Opciones para la pregunta 32: ¿Cuál es la principal razón por la que vemos cada día sustituir los carros por los automóviles?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 32 AND idPrueba = 5), 1, 'Los caballos son cada día más escasos', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 32 AND idPrueba = 5), 2, 'Los caballos se desbocan fácilmente', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 32 AND idPrueba = 5), 3, 'Los autos nos hacen ganar tiempo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 32 AND idPrueba = 5), 4, 'Los autos son más económicos que los carros', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 32 AND idPrueba = 5), 5, 'Las reparaciones de los autos son más baratas que las de los carros', FALSE);


-- Opciones para la pregunta 33: La corteza es para la naranja y la vaina es para el guisante lo que la cáscara es para…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 33 AND idPrueba = 5), 1, 'La manzana', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 33 AND idPrueba = 5), 2, 'El huevo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 33 AND idPrueba = 5), 3, 'El jugo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 33 AND idPrueba = 5), 4, 'El melocotón', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 33 AND idPrueba = 5), 5, 'La gallina', FALSE);


-- Opciones para la pregunta 34: ¿Qué es para el criminal lo que el hospital es para el enfermo?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 34 AND idPrueba = 5), 1, 'Juez', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 34 AND idPrueba = 5), 2, 'Hospicio', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 34 AND idPrueba = 5), 3, 'Doctor', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 34 AND idPrueba = 5), 4, 'Presidio', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 34 AND idPrueba = 5), 5, 'Sestencia', FALSE);


-- Opciones para la pregunta 35: Si estos números estuviesen ordenados, ¿Por qué letra empezaría el del centro?     Ocho  Diez   Seis   Nueve   Siete
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 35 AND idPrueba = 5), 1, 'La S', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 35 AND idPrueba = 5), 2, 'La N', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 35 AND idPrueba = 5), 3, 'La O', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 35 AND idPrueba = 5), 4, 'La D', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 35 AND idPrueba = 5), 5, 'La C', FALSE);


-- Opciones para la pregunta 36: A 30 centavos la hoja de papel, ¿Cuántas podrán comprarse por 3 pesos?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 36 AND idPrueba = 5), 1, '10', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 36 AND idPrueba = 5), 2, '5', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 36 AND idPrueba = 5), 3, '8', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 36 AND idPrueba = 5), 4, '3', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 36 AND idPrueba = 5), 5, '25', FALSE);


-- Opciones para la pregunta 37: De una cantidad que disminuye se dice que…
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 37 AND idPrueba = 5), 1, 'Se va', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 37 AND idPrueba = 5), 2, 'Decrece', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 37 AND idPrueba = 5), 3, 'Se agota', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 37 AND idPrueba = 5), 4, 'Muere', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 37 AND idPrueba = 5), 5, 'Desaparece', FALSE);


-- Opciones para la pregunta 38: Hay un refrán que dice <<No es oro todo lo que reluce>> y esto significa:
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 38 AND idPrueba = 5), 1, 'Hay oro que no brilla', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 38 AND idPrueba = 5), 2, 'No hay que dejarse ', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 38 AND idPrueba = 5), 3, 'El diamante es más brillante que el oro', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 38 AND idPrueba = 5), 4, 'No hay que llevar bisutería que imi', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 38 AND idPrueba = 5), 5, 'Hay gentes a quienes gusta ostentar su riqueza', FALSE);


-- Opciones para la pregunta 39: En una lengua extranjera KOLO quiere decir <<niño>> y DAAK KOLO <<niño bueno>>, ¿Por qué letra empieza la palabra que significa <<bueno>> en ese idioma?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 39 AND idPrueba = 5), 1, 'La D', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 39 AND idPrueba = 5), 2, 'La K', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 39 AND idPrueba = 5), 3, 'La M', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 39 AND idPrueba = 5), 4, 'La S', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 39 AND idPrueba = 5), 5, 'La C', FALSE);


-- Opciones para la pregunta 40: Este refrán, <<Más vale pájaro en mano que ciento volando>>, quiere decir:
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 40 AND idPrueba = 5), 1, 'Es preferible poseer una pequeña cosa que esperar una grande', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 40 AND idPrueba = 5), 2, 'El corazón fuerte no se deja rendir por la lisonja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 40 AND idPrueba = 5), 3, 'Ningún hombre suele apartarse de la verdad sin engañarse a sí mismo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 40 AND idPrueba = 5), 4, 'El que está en todas partes no está en ninguna', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 40 AND idPrueba = 5), 5, 'Cuando se tiene una cosa hay que procurar conservarla', FALSE);


-- Opciones para la pregunta 41: ¿Cuál de estas cinco cosas es más completa?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 41 AND idPrueba = 5), 1, 'Retoño', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 41 AND idPrueba = 5), 2, 'Hoja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 41 AND idPrueba = 5), 3, 'Árbol', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 41 AND idPrueba = 5), 4, 'Rama', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 41 AND idPrueba = 5), 5, 'Tronco', FALSE);


-- Opciones para la pregunta 42: Si estas palabras estuviesen convenientemente ordenadas para formar una frase, ¿Por qué letra empezaría la tercera palabra?      CON  DIME  ERES  QUIEN  DIRE  ANDAS  Y  TE  QUIEN
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 42 AND idPrueba = 5), 1, 'La D', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 42 AND idPrueba = 5), 2, 'La Q', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 42 AND idPrueba = 5), 3, 'La A', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 42 AND idPrueba = 5), 4, 'La C', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 42 AND idPrueba = 5), 5, 'La Y', FALSE);


-- Opciones para la pregunta 43: Si Jorge es mayor que Pedro, y Pedro es mayor que Juan, entonces Jorge es ______ que Juan.
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 43 AND idPrueba = 5), 1, 'Mayor', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 43 AND idPrueba = 5), 2, 'Más pequeño', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 43 AND idPrueba = 5), 3, 'Iguales', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 43 AND idPrueba = 5), 4, 'No se puede saber', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 43 AND idPrueba = 5), 5, 'Ninguna de las anteriores', FALSE);


-- Opciones para la pregunta 44: ¿Cuál de estas palabras es la primera que aparece en un diccionario?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 44 AND idPrueba = 5), 1, 'Raspador', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 44 AND idPrueba = 5), 2, 'Queso', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 44 AND idPrueba = 5), 3, 'Gruta', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 44 AND idPrueba = 5), 4, 'Noche', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 44 AND idPrueba = 5), 5, 'Pintura', FALSE);


-- Opciones para la pregunta 45: Si las palabras General, Teniente, Soldado, Coronel y Alférez estuviesen colocadas indicando el orden jerárquico que significan, ¿por qué letra empezaría la del centro?                            (Alférez: Oficial de categoría inferior al teniente)
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 45 AND idPrueba = 5), 1, 'La G', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 45 AND idPrueba = 5), 2, 'La T', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 45 AND idPrueba = 5), 3, 'La S', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 45 AND idPrueba = 5), 4, 'La C', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 45 AND idPrueba = 5), 5, 'La A', FALSE);


-- Opciones para la pregunta 46: Hay un refrán que dice: <<Un grano no hace granero, pero ayuda al compañero>>, y esto significa:
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 46 AND idPrueba = 5), 1, 'Resuélvete a hacer lo que debes y haz sin falta lo que hayas resuelto', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 46 AND idPrueba = 5), 2, 'Hay que ganarse la vida a fuerza de amor', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 46 AND idPrueba = 5), 3, 'No se deben menospreciar las cosas pequeñas', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 46 AND idPrueba = 5), 4, 'En casa pobre no es necesario granero', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 46 AND idPrueba = 5), 5, 'Las personas deben ayudarse unas a otras', FALSE);


-- Opciones para la pregunta 47: Si Juan es mayor que José, y José tiene la misma edad que Carlos entonces...
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 47 AND idPrueba = 5), 1, 'Carlos es mayor que Juan', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 47 AND idPrueba = 5), 2, 'Juan y Carlos tienen la misma edad', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 47 AND idPrueba = 5), 3, 'Carlos es más joven que Juan', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 47 AND idPrueba = 5), 4, 'Juan es menor que Carlos', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 47 AND idPrueba = 5), 5, 'José es el menor de los tres', FALSE);


-- Opciones para la pregunta 48: Ordenando la frase que viene aquí debajo, ¿por qué letra empezaría la última palabra?                  A FALTA TORTAS BUENAS PAN SON DE
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 48 AND idPrueba = 5), 1, 'La T', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 48 AND idPrueba = 5), 2, 'La P', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 48 AND idPrueba = 5), 3, 'La D', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 48 AND idPrueba = 5), 4, 'La B', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 48 AND idPrueba = 5), 5, 'La S', FALSE);


-- Opciones para la pregunta 49: Si en una caja grande hubiera dos más pequeñas y dentro de cada una de estas dos hubiera cinco, ¿cuántas habría en total?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 49 AND idPrueba = 5), 1, '10', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 49 AND idPrueba = 5), 2, '12', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 49 AND idPrueba = 5), 3, '13', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 49 AND idPrueba = 5), 4, '15', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 49 AND idPrueba = 5), 5, '8', FALSE);


-- Opciones para la pregunta 50: ¿Qué indica mejor lo que es una mentira?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 50 AND idPrueba = 5), 1, 'Un error', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 50 AND idPrueba = 5), 2, 'Una afirmación voluntariamente falsa', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 50 AND idPrueba = 5), 3, 'Una afirmación involuntariamente falsa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 50 AND idPrueba = 5), 4, 'Una exageración', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 50 AND idPrueba = 5), 5, 'Una respuesta inexacta', FALSE);


-- Opciones para la pregunta 51: En un idioma extranjero SOTO GRON quiere decir <<muy caliente>> y PASS GRON <<muy frío>>, ¿por qué letra empieza la palabra que significa <<muy>> en ese idioma?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 51 AND idPrueba = 5), 1, 'La M', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 51 AND idPrueba = 5), 2, 'La Y', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 51 AND idPrueba = 5), 3, 'La S', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 51 AND idPrueba = 5), 4, 'La G', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 51 AND idPrueba = 5), 5, 'La P', FALSE);


-- Opciones para la pregunta 52: La palabra que mejor expresa que una cosa o institución se mantiene a lo largo del tiempo es...
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 52 AND idPrueba = 5), 1, 'Permanente', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 52 AND idPrueba = 5), 2, 'Firme', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 52 AND idPrueba = 5), 3, 'Estacionaria', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 52 AND idPrueba = 5), 4, 'Sólida', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 52 AND idPrueba = 5), 5, 'Verdadera', FALSE);


-- Opciones para la pregunta 53: Si Pablo es mayor que Luis y si Pablo es más joven que Andrés, entonces...
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 53 AND idPrueba = 5), 1, 'Andrés es mayor que Luis', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 53 AND idPrueba = 5), 2, 'Pablo es el más joven', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 53 AND idPrueba = 5), 3, 'Andrés y Luis tienen la misma edad', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 53 AND idPrueba = 5), 4, 'El mayor de todos es Luis', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 53 AND idPrueba = 5), 5, 'Pablo es mayor que Andrés', FALSE);


-- Opciones para la pregunta 54: ¿Cuál de estas cosas tiene más parecido con serpiente, vaca y gorrión?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 54 AND idPrueba = 5), 1, 'Árbol', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 54 AND idPrueba = 5), 2, 'Muñeca', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 54 AND idPrueba = 5), 3, 'Carnero', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 54 AND idPrueba = 5), 4, 'Pluma', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 54 AND idPrueba = 5), 5, 'Pie', FALSE);

-- Opciones para la pregunta 55: Hay un refrán que dice: <<A hierro caliente, batir de repente>>, y esto significa:
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 55 AND idPrueba = 5), 1, 'El hierro batido en frío, es malo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 55 AND idPrueba = 5), 2, 'No se pueden hacer varias cosas a mismo tiempo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 55 AND idPrueba = 5), 3, 'Hay que saber aprovechar el momento oportuno', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 55 AND idPrueba = 5), 4, 'Los herreros han de trabajar siempre de prisa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 55 AND idPrueba = 5), 5, 'El trabajo del hierro es cansado', FALSE);


-- Opciones para la pregunta 56: Si las palabras que vienen aquí debajo estuviesen ordenadas, ¿Por qué letra empezaría la del centro?                  Semana  Año  Hora  Segundo  Día  Mes  Minuto
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 56 AND idPrueba = 5), 1, 'La S', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 56 AND idPrueba = 5), 2, 'La M', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 56 AND idPrueba = 5), 3, 'La H', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 56 AND idPrueba = 5), 4, 'La D', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 56 AND idPrueba = 5), 5, 'La A', FALSE);


-- Opciones para la pregunta 57: El capitán es para el barco lo que el alcalde es para...
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 57 AND idPrueba = 5), 1, 'El estado', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 57 AND idPrueba = 5), 2, 'La provincia', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 57 AND idPrueba = 5), 3, 'La ciudad', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 57 AND idPrueba = 5), 4, 'El patrón', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 57 AND idPrueba = 5), 5, 'El juez', FALSE);


-- Opciones para la pregunta 58: Uno de los números de la serie que viene aquí debajo está equivocado, ¿qué número debiera figurar en su lugar?                    2  3  4  3  2  3  4  2  2  4
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 58 AND idPrueba = 5), 1, '1', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 58 AND idPrueba = 5), 2, '2', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 58 AND idPrueba = 5), 3, '3', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 58 AND idPrueba = 5), 4, '6', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 58 AND idPrueba = 5), 5, '5', FALSE);


-- Opciones para la pregunta 59: Si un pleito se resuelve por mutuas concesiones se dice que ha habido...
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 59 AND idPrueba = 5), 1, 'Promesa', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 59 AND idPrueba = 5), 2, 'Debate', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 59 AND idPrueba = 5), 3, 'Amnistía', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 59 AND idPrueba = 5), 4, 'Proceso', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 59 AND idPrueba = 5), 5, 'Avenencia', TRUE);


-- Opciones para la pregunta 60: La oración que viene aquí debajo tiene las palabras desordenadas. ¿Qué letra debe marcarse atendiendo a la frase ordenada?                    FRASE LA LETRA SEÑALE PRIMERA ESTA DE	
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 60 AND idPrueba = 5), 1, 'La E', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 60 AND idPrueba = 5), 2, 'La F', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 60 AND idPrueba = 5), 3, 'La L', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 60 AND idPrueba = 5), 4, 'La S', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 60 AND idPrueba = 5), 5, 'La D', FALSE);


-- Opciones para la pregunta 61: En la serie de números, que aparece aquí debajo, cuente todos los 5 que están delante de un 7, ¿Cuántos son?
-- 7 5 3 5 7 2 3 7 5 6 7 7 2 5 7 3 4 7 7 5 2 0 7 5 7 8 3 7 2 5 1 7 9 6 5 7
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 61 AND idPrueba = 5), 1, '2', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 61 AND idPrueba = 5), 2, '3', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 61 AND idPrueba = 5), 3, '4', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 61 AND idPrueba = 5), 4, '5', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 61 AND idPrueba = 5), 5, '6', FALSE);


-- Opciones para la pregunta 62: ¿Qué indica mejor lo que es un termómetro?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 62 AND idPrueba = 5), 1, 'Un tubo de cristal graduado que contiene mercurio', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 62 AND idPrueba = 5), 2, 'Un instrumento para medir la fiebre', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 62 AND idPrueba = 5), 3, 'Un aparato muy sensible a calor', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 62 AND idPrueba = 5), 4, 'Un instrumento para medir la temperatura', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 62 AND idPrueba = 5), 5, 'Un objeto que utilizan los médicos', FALSE);


-- Opciones para la pregunta 63: ¿Cuál de estas palabras es la primera que aparece en un diccionario?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 63 AND idPrueba = 5), 1, 'Bravo', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 63 AND idPrueba = 5), 2, 'Busto', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 63 AND idPrueba = 5), 3, 'Brocha', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 63 AND idPrueba = 5), 4, 'Bujía', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 63 AND idPrueba = 5), 5, 'Bretón', FALSE);


-- Opciones para la pregunta 64: Uno de los números de la serie que aparece aquí debajo está equivocado. ¿Qué número debiera figurar en su lugar?                      1   2   4   8   12   32   64
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 64 AND idPrueba = 5), 1, '10', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 64 AND idPrueba = 5), 2, '14', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 64 AND idPrueba = 5), 3, '16', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 64 AND idPrueba = 5), 4, '24', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 64 AND idPrueba = 5), 5, '6', FALSE);


-- Opciones para la pregunta 65: ¿Cuál de estas palabras significa lo contrario de COMUN?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 65 AND idPrueba = 5), 1, 'Banal', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 65 AND idPrueba = 5), 2, 'Vivo', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 65 AND idPrueba = 5), 3, 'Difícil', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 65 AND idPrueba = 5), 4, 'Raro', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 65 AND idPrueba = 5), 5, 'Interesante', FALSE);


-- Opciones para la pregunta 66: ¿Cuál de estas cinco cosas tiene más parecido con Presidente, Almirante y General?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 66 AND idPrueba = 5), 1, 'Navío', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 66 AND idPrueba = 5), 2, 'Ejército', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 66 AND idPrueba = 5), 3, 'Rey', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 66 AND idPrueba = 5), 4, 'República', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 66 AND idPrueba = 5), 5, 'Soldado', FALSE);


-- Opciones para la pregunta 67: Si las palabras que aparecen aquí debajo estuvieran ordenadas, ¿por qué letra empezaría la del centro?                     Adolescente    Niño    Hombre   Viejo    Bebé
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 67 AND idPrueba = 5), 1, 'La A', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 67 AND idPrueba = 5), 2, 'La V', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 67 AND idPrueba = 5), 3, 'La H', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 67 AND idPrueba = 5), 4, 'La B', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 67 AND idPrueba = 5), 5, 'La N', FALSE);


-- Opciones para la pregunta 68: ¿Cuál de estas definiciones indica más exactamente lo que es un caballo?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 68 AND idPrueba = 5), 1, 'Un animal que tiene cola', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 68 AND idPrueba = 5), 2, 'Un ser viviente', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 68 AND idPrueba = 5), 3, 'Una cosa que trabaja', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 68 AND idPrueba = 5), 4, 'Un rumiante', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 68 AND idPrueba = 5), 5, 'Un animal que tira de los coches', FALSE);


-- Opciones para la pregunta 69: En un idioma extranjero, BECO PRAC quiere decir <<un poco de pan>>, KLUP PRAC <<un poco de leche>> y BECO OTOH KLUP PRAC <<un poco de pan y leche>>. ¿Por qué letra empieza la palabra que significa Y en dicho idioma?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 69 AND idPrueba = 5), 1, 'La K', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 69 AND idPrueba = 5), 2, 'La P', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 69 AND idPrueba = 5), 3, 'La B', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 69 AND idPrueba = 5), 4, 'La Q', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 69 AND idPrueba = 5), 5, 'La Y', FALSE);


-- Opciones para la pregunta 70: Si las palabras que aparecen aquí debajo estuviesen convenientemente ordenadas para formar una frase, ¿por qué letra empezaría la tercera palabra?                    MADRUGA QUIEN LE DIOS A AYUDA
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 70 AND idPrueba = 5), 1, 'La A', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 70 AND idPrueba = 5), 2, 'La M', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 70 AND idPrueba = 5), 3, 'La Q', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 70 AND idPrueba = 5), 4, 'La D', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 70 AND idPrueba = 5), 5, 'La L', FALSE);


-- Opciones para la pregunta 71: ¿Cuál de estas palabras es la última que aparece en un diccionario?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 71 AND idPrueba = 5), 1, 'Juez', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 71 AND idPrueba = 5), 2, 'Nervio', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 71 AND idPrueba = 5), 3, 'Hora', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 71 AND idPrueba = 5), 4, 'Norte', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 71 AND idPrueba = 5), 5, 'Labio', FALSE);


-- Opciones para la pregunta 72: Si se ordena la frase que aparece aquí debajo, ¿qué letra cumple lo que se dice en ella?                  EN LETRA LÍNEA A ESCRIBA LA LA
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 72 AND idPrueba = 5), 1, 'La A', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 72 AND idPrueba = 5), 2, 'La E', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 72 AND idPrueba = 5), 3, 'La L', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 72 AND idPrueba = 5), 4, 'La R', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 72 AND idPrueba = 5), 5, 'La B', FALSE);


-- Opciones para la pregunta 73: Uno de los números de la serie que aparece aquí debajo está equivocado, ¿qué número debería figurar en su lugar?                         1   2   5   6   9   10   13    14   16   18
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 73 AND idPrueba = 5), 1, '14', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 73 AND idPrueba = 5), 2, '17', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 73 AND idPrueba = 5), 3, '20', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 73 AND idPrueba = 5), 4, '15', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 73 AND idPrueba = 5), 5, '16', FALSE);


-- Opciones para la pregunta 74: Si un ciclista recorre 250 metros en 25 segundos, ¿cuántos metros recorrerá en un quinto de segundo?
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 74 AND idPrueba = 5), 1, '10', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 74 AND idPrueba = 5), 2, '5', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 74 AND idPrueba = 5), 3, '2', TRUE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 74 AND idPrueba = 5), 4, '4', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 74 AND idPrueba = 5), 5, '25', FALSE);


-- Opciones para la pregunta 75: Si la frase que aparece aquí debajo estuviera ordenada, ¿qué número cumple lo que en ella se dice?                                  Y SUMA CUATRO ESCRIBA TRES LA UNO DE
INSERT INTO opcionesotis (idOpcionOtis, idPreguntaOtis, opcionOtis, descripcionOpcion, esCorrecta)
VALUES
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 75 AND idPrueba = 5), 1, '3', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 75 AND idPrueba = 5), 2, '4', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 75 AND idPrueba = 5), 3, '1', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 75 AND idPrueba = 5), 4, '7', FALSE),
(UUID(), (SELECT idPreguntaOtis FROM preguntasotis WHERE numeroPregunta = 75 AND idPrueba = 5), 5, '8', TRUE);

