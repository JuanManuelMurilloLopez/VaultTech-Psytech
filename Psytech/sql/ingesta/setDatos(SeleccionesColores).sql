INSERT INTO seleccionesColores VALUES
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 1),
    1,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 2),
    4,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 3),
    7,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 4),
    5,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 5),
    0,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 6),
    3,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 7),
    2,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 8),
    6,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 1),
    1,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 2),
    4,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 3),
    7,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 4),
    5,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 5),
    0,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 6),
    3,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 7),
    2,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 8),
    6,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 1),
    1,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 2),
    4,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 3),
    7,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 4),
    5,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 5),
    0,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 6),
    3,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 7),
    2,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 8),
    6,
    1
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 1),
    1,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 2),
    4,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 3),
    7,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 4),
    5,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 5),
    0,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 6),
    3,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 7),
    2,
    2
),
(
    uuid(), 
    (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
    (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
    (SELECT idColor FROM colores WHERE numeroColor = 8),
    6,
    2
);


