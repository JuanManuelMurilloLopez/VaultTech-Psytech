-- Inserción de los familiares sin el campo hijoDe
INSERT INTO familiares (idFamiliar, idAspirante, nombreFamiliar, estadoDeVida, idGenero, idEstadoCivil, edadFamiliar, hijoDe) VALUES
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 'Ana López', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 52, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')), 'Carlos López', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Soltero'), 28, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 'José Pérez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Viudo'), 60, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')), 'Lucía Pérez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 32, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 'Pedro Rodríguez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Divorciado'), 45, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')), 'Raquel Rodríguez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Soltero'), 24, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 'Manuel Gómez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 48, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')), 'Esther Gómez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Viudo'), 55, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 'Jorge Fernández', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 51, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')), 'Patricia Fernández', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Soltero'), 26, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 'Luis Martínez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Viudo'), 63, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')), 'Marta Martínez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 34, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 'Ricardo Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Soltero'), 39, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')), 'Ana Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 28, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 'Javier Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Divorciado'), 49, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')), 'Beatriz Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Viudo'), 56, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 'Felipe Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 55, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')), 'María Ramírez', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Soltero'), 29, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 'Carlos García', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Viudo'), 65, NULL),
(uuid(), (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')), 'Isabel García', TRUE, (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), (SELECT idEstadoCivil FROM estadoCivil WHERE nombreEstadoCivil = 'Casado'), 40, NULL);

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
