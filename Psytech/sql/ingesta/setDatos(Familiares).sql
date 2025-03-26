-- Inserción de los familiares sin el campo hijoDe
INSERT INTO familiares (idFamiliar, idAspirante, rolFamiliar, nombreFamiliar, edadFamiliar, idGenero, idEstadoCivil, hijoDe, estadoDeVida) VALUES

-- Juan López 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 'Madre', 'Ana López', 52, 1, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 'Hermano', 'Carlos López', 28, 2, 1, NULL, TRUE), 
-- María Pérez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 'Padre', 'José Pérez', 60, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 'Hermana', 'Lucía Pérez', 32, 1, 2, NULL, TRUE),
-- Carlos Rodríguez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 'Padre', 'Pedro Rodríguez', 45, 2, 3, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 'Hermana', 'Raquel Rodríguez', 24, 1, 1, NULL, TRUE),
-- Laura Gómez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 'Padre', 'Manuel Gómez', 48, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 'Madre', 'Esther Gómez', 55, 1, 2, NULL, TRUE),
-- Pedro Fernández 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 'Padre', 'Jorge Fernández', 51, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 'Hermana', 'Patricia Fernández', 26, 1, 1, NULL, TRUE),
-- Ana Martínez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 'Padre', 'Luis Martínez', 63, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 'Hermana', 'Marta Martínez', 34, 1, 2, NULL, TRUE),
-- Luis Ramírez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 'Padre', 'Ricardo Ramírez', 39, 2, 1, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 'Hermana', 'Ana Ramírez', 28, 1, 2, NULL, TRUE),
-- Sofía Ramírez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 'Padre', 'Javier Ramírez', 49, 2, 3, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 'Madre', 'Beatriz Ramírez', 56, 1, 2, NULL, TRUE),
-- Miguel Ramírez 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 'Padre', 'Felipe Ramírez', 55, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 'Hermana', 'María Ramírez', 29, 1, 1, NULL, TRUE),
-- Elena García 
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 'Padre', 'Carlos García', 65, 2, 2, NULL, TRUE),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 'Hermana', 'Isabel García', 40, 1, 2, NULL, TRUE);

-- Actualización de los registros con la referencia hijoDe
UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Ana López') 
WHERE nombreFamiliar = 'Carlos López';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'José Pérez') 
WHERE nombreFamiliar = 'Lucía Pérez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Pedro Rodríguez') 
WHERE nombreFamiliar = 'Raquel Rodríguez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Manuel Gómez') 
WHERE nombreFamiliar = 'Esther Gómez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Jorge Fernández') 
WHERE nombreFamiliar = 'Patricia Fernández';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Luis Martínez') 
WHERE nombreFamiliar = 'Marta Martínez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Ricardo Ramírez') 
WHERE nombreFamiliar = 'Ana Ramírez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Javier Ramírez') 
WHERE nombreFamiliar = 'Beatriz Ramírez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Felipe Ramírez') 
WHERE nombreFamiliar = 'María Ramírez';

UPDATE familiares 
SET hijoDe = (SELECT idFamiliar FROM familiares WHERE nombreFamiliar = 'Carlos García') 
WHERE nombreFamiliar = 'Isabel García';