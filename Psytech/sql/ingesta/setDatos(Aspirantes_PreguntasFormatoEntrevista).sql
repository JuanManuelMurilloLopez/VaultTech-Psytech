-- Juan López
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'juanlópez39@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'juanlópez39@example.com')
);

-- María Pérez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'maríapérez76@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'maríapérez76@example.com')
);

-- Carlos Rodríguez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')
);

-- Laura Gómez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'lauragómez50@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'lauragómez50@example.com')
);

-- Pedro Fernández
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'pedrofernández59@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'pedrofernández59@example.com')
);

-- Ana Martínez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'anamartínez97@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'anamartínez97@example.com')
);

-- Luis Ramírez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'luisramírez75@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'luisramírez75@example.com')
);

-- Sofía Ramírez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'sofíaramírez88@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'sofíaramírez88@example.com')
);

-- Miguel Ramírez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'miguelramírez66@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'miguelramírez66@example.com')
);

-- Elena García
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'elenagarcía10@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'elenagarcía10@example.com')
);

-- Javier Fernández
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'javierfernández98@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'javierfernández98@example.com')
);

-- Lucía Ramírez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'lucíaramírez83@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'lucíaramírez83@example.com')
);

-- Fernando Torres
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'fernandotorres81@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'fernandotorres81@example.com')
);

-- Paula López
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'paulalópez49@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'paulalópez49@example.com')
);

-- Ricardo García
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'ricardogarcía68@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'ricardogarcía68@example.com')
);

-- Gabriela Gómez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'gabrielagómez9@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'gabrielagómez9@example.com')
);

-- Manuel Ramírez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'manuelramírez62@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'manuelramírez62@example.com')
);

-- Valeria Gómez
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'valeriagómez68@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'valeriagómez68@example.com')
);

-- Raúl García
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'raúlgarcía25@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'raúlgarcía25@example.com')
);

-- Isabel Fernández
INSERT INTO aspirantesPreguntasFormatoEntrevista VALUES
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Nombre'),
    (SELECT nombreUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Correo'),
    (SELECT correo FROM usuarios WHERE correo = 'isabelfernández54@example.com')
),
(
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
    (SELECT idPreguntaFormatoEntrevista FROM preguntasFormatoEntrevista WHERE nombrePreguntaFormatoEntrevista = 'Celular'),
    (SELECT numeroTelefono FROM usuarios WHERE correo = 'isabelfernández54@example.com')
);
