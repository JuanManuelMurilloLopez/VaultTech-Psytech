INSERT INTO pruebaOtis (idPruebaOtis, idPrueba, tiempo) 
VALUES 
(UUID(), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 30);