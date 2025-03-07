-- Juan López
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'juanlópez39@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'juanlópez39@example.com')
);

-- María Pérez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'maríapérez76@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'maríapérez76@example.com')
);

-- Carlos Rodríguez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com')
);
-- Laura Gómez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'lauragómez50@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'lauragómez50@example.com')
);

-- Pedro Fernández
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'pedrofernández59@example.com')
);


-- Ana Martínez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'anamartínez97@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'anamartínez97@example.com')
);

-- Luis Ramírez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'luisramírez75@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'luisramírez75@example.com')
);

-- Sofía Ramírez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com')
);

-- Miguel Ramírez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'miguelramírez66@example.com')
);

-- Elena García
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'elenagarcía10@example.com')
);

-- Javier Fernández
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'javierfernández98@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'javierfernández98@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'javierfernández98@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'javierfernández98@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'javierfernández98@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'javierfernández98@example.com')
);

-- Lucía Ramírez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com')
);

-- Fernando Torres
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'fernandotorres81@example.com')
);

-- Paula López
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'paulalópez49@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'paulalópez49@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'paulalópez49@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'paulalópez49@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'paulalópez49@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'paulalópez49@example.com')
);

-- Ricardo García
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com')
);

-- Gabriela Gómez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com')
);

-- Manuel Ramírez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'manuelramírez62@example.com')
);

-- Valeria Gómez
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'valeriagómez68@example.com')
);

-- Raúl García
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com')
);

-- Isabel Fernández
INSERT INTO Aspirantes_PreguntasFormatoEntrevista VALUES
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Nombre'),
    (SELECT Nombre_usuario FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Correo'),
    (SELECT Correo FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')
),
(
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')),
    (SELECT Id_preguntaFormatoEntrevista FROM PreguntasFormatoEntrevista WHERE Nombre_preguntaFormatoEntrevista = 'Celular'),
    (SELECT Numero_telefono FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')
);
