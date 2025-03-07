CREATE TABLE SeleccionesColores(
    Id_seleccionColores VARCHAR(36) PRIMARY KEY not NULL,
    Id_prueba VARCHAR(36),
    Id_aspirante VARCHAR(36),
    Id_color VARCHAR(36),
    Posicion INT CHECK (Posicion <= 7 AND Posicion >= 0),
    Face INT CHECK (Face = 1 OR Face = 2),
    FOREIGN KEY (Id_prueba) REFERENCES Pruebas(Id_prueba),
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante),
    FOREIGN KEY (Id_color) REFERENCES Colores(Id_color)
);

INSERT INTO SeleccionesColores VALUES
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 1),
    1,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 2),
    4,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 3),
    7,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 4),
    5,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 5),
    8,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 6),
    3,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 7),
    2,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 8),
    6,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 1),
    1,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 2),
    4,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 3),
    7,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 4),
    5,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 5),
    8,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 6),
    3,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 7),
    2,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 8),
    6,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 1),
    1,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 2),
    4,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 3),
    7,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 4),
    5,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 5),
    8,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 6),
    3,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 7),
    2,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 8),
    6,
    1
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 1),
    1,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 2),
    4,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 3),
    7,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 4),
    5,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 5),
    8,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 6),
    3,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 7),
    2,
    2
),
(
    uuid(), 
    (SELECT Id_prueba FROM Prueba WHERE Nombre = 'COLORES DE LUSCHER'), 
    (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com')),
    (SELECT Id_color FROM Colores WHERE Numero_color = 8),
    6,
    2
);