-- Ingesta de datos para la tabla aspirantesGruposPruebas
INSERT INTO aspirantesGruposPruebas (idGrupo, idPrueba, idAspirante, idEstatus, idDatosPersonales, fechaAsignacion, fechaLimite)
VALUES
    -- Grupo G1_ISC - Prueba OTIS 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Juan' AND apellidoPaterno = 'López' AND apellidoMaterno = 'García'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Carlos' AND apellidoPaterno = 'Rodríguez' AND apellidoMaterno = 'Fernández'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Pedro' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Ramírez'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Luis' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'González'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Miguel' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Salinas'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'María' AND apellidoPaterno = 'Pérez' AND apellidoMaterno = 'Martínez'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Laura' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Hernández'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Ana' AND apellidoPaterno = 'Martínez' AND apellidoMaterno = 'López'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Sofía' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Torres'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Elena' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Méndez'),
        '2025-01-10',
        '2025-01-20'
    ),

    -- Grupo G1_ISC - Prueba COLORES DE LUSCHER 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Juan' AND apellidoPaterno = 'López' AND apellidoMaterno = 'García'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Carlos' AND apellidoPaterno = 'Rodríguez' AND apellidoMaterno = 'Fernández'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Pedro' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Ramírez'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Luis' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'González'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Miguel' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Salinas'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'María' AND apellidoPaterno = 'Pérez' AND apellidoMaterno = 'Martínez'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Laura' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Hernández'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Ana' AND apellidoPaterno = 'Martínez' AND apellidoMaterno = 'López'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Sofía' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Torres'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Elena' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Méndez'),
        '2025-01-15',
        '2025-01-25'
    ),

    -- Grupo G2_II - Prueba OTIS 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Javier' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Torres'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Fernando' AND apellidoPaterno = 'Torres' AND apellidoMaterno = 'Vázquez'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Ricardo' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Morales'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Manuel' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Suárez'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Raúl' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Díaz'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Lucía' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Castro'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Paula' AND apellidoPaterno = 'López' AND apellidoMaterno = 'Moreno'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Gabriela' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Soto'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Valeria' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Bravo'),
        '2025-01-10',
        '2025-01-20'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        5,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Isabel' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Reyes'),
        '2025-01-10',
        '2025-01-20'
    ),

    -- Grupo G2_II - Prueba COLORES DE LUSCHER 
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Javier' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Torres'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Fernando' AND apellidoPaterno = 'Torres' AND apellidoMaterno = 'Vázquez'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Ricardo' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Morales'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Manuel' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Suárez'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Raúl' AND apellidoPaterno = 'García' AND apellidoMaterno = 'Díaz'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
        1,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Lucía' AND apellidoPaterno = 'Ramírez' AND apellidoMaterno = 'Castro'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
        3,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Paula' AND apellidoPaterno = 'López' AND apellidoMaterno = 'Moreno'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Gabriela' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Soto'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
        2,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Valeria' AND apellidoPaterno = 'Gómez' AND apellidoMaterno = 'Bravo'),
        '2025-01-15',
        '2025-01-25'
    ),
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        6,
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
        4,
        (SELECT idDatosPersonales FROM datosPersonales WHERE nombre = 'Isabel' AND apellidoPaterno = 'Fernández' AND apellidoMaterno = 'Reyes'),
        '2025-01-15',
        '2025-01-25'
    );
