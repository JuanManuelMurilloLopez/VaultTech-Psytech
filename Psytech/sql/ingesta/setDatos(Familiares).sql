-- Inserción de los familiares sin el campo Hijo_de
INSERT INTO Familiares (Id_familiar, Id_aspirante, Nombre_familiar, Estado_de_vida, Id_genero, Id_estadoCivil, Edad_familiar, Hijo_de) VALUES
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')), 'Ana López', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 52, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')), 'Carlos López', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Soltero'), 28, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')), 'José Pérez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Viudo'), 60, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')), 'Lucía Pérez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 32, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')), 'Pedro Rodríguez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Divorciado'), 45, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')), 'Raquel Rodríguez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Soltero'), 24, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')), 'Manuel Gómez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 48, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')), 'Esther Gómez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Viudo'), 55, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')), 'Jorge Fernández', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 51, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')), 'Patricia Fernández', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Soltero'), 26, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')), 'Luis Martínez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Viudo'), 63, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')), 'Marta Martínez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 34, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')), 'Ricardo Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Soltero'), 39, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')), 'Ana Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 28, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')), 'Javier Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Divorciado'), 49, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')), 'Beatriz Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Viudo'), 56, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')), 'Felipe Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 55, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')), 'María Ramírez', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Soltero'), 29, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')), 'Carlos García', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Viudo'), 65, NULL),
(uuid(), (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')), 'Isabel García', TRUE, (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), (SELECT Id_estadoCivil FROM EstadoCivil WHERE Nombre_estadoCivil = 'Casado'), 40, NULL);

-- Actualización de los registros con la referencia Hijo_de
UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Ana López') 
WHERE Nombre_familiar = 'Carlos López';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'José Pérez') 
WHERE Nombre_familiar = 'Lucía Pérez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Pedro Rodríguez') 
WHERE Nombre_familiar = 'Raquel Rodríguez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Manuel Gómez') 
WHERE Nombre_familiar = 'Esther Gómez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Jorge Fernández') 
WHERE Nombre_familiar = 'Patricia Fernández';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Luis Martínez') 
WHERE Nombre_familiar = 'Marta Martínez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Ricardo Ramírez') 
WHERE Nombre_familiar = 'Ana Ramírez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Javier Ramírez') 
WHERE Nombre_familiar = 'Beatriz Ramírez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Felipe Ramírez') 
WHERE Nombre_familiar = 'María Ramírez';

UPDATE Familiares 
SET Hijo_de = (SELECT Id_familiar FROM Familiares WHERE Nombre_familiar = 'Carlos García') 
WHERE Nombre_familiar = 'Isabel García';
