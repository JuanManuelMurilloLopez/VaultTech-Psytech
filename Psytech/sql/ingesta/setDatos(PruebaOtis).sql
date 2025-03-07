INSERT INTO PruebaOtis (Id_pruebaOtis, Id_prueba, Tiempo) 
VALUES 
(UUID(), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 30);