INSERT INTO aspirantesGruposPruebas (idGrupo, idPrueba, idAspirante, idEstatus, fechaAsignacion, fechaLimite)
VALUES
    -- Grupo G1_ISC - Prueba OTIS 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
        1,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
        1,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
        3,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
        1,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
        3,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
        4,
        '2025-01-10',
        '2025-01-20'
    ),

    -- Grupo G1_ISC - Prueba COLORES DE LUSCHER 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
        1,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
        3,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
        3,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
        1,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
        3,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
        4,
        '2025-01-15',
        '2025-01-25'
    ),

    -- Grupo G2_II - Prueba OTIS 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
        1,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
        3,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
        4,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
        1,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
        3,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
        2,
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
        4,
        '2025-01-10',
        '2025-01-20'
    ),

    -- Grupo G2_II - Prueba COLORES DE LUSCHER 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
        1,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
        3,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
        4,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
        1,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
        3,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
        2,
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
        4,
        '2025-01-15',
        '2025-01-25'
    );