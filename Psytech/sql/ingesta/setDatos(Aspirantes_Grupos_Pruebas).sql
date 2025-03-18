-- Ingesta de datos para la tabla aspirantesGruposPruebas
INSERT INTO aspirantesGruposPruebas (idGrupo, idPrueba, idAspirante, idEstatus)
VALUES
    -- Grupo G1_ISC - Prueba OTIS
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Completada')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Completada')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'En progreso')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    -- Grupo G1_ISC - Prueba COLORES DE LUSCHER
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Completada')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'En progreso')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Vencida')
    ),

    -- Grupo G2_II - Prueba OTIS
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Completada')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'En progreso')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Vencida')
    ),

    -- Grupo G2_II - Prueba COLORES DE LUSCHER
    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Completada')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'En progreso')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Pendiente')
    ),

    (
        (SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'),
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'),
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')),
        (SELECT idEstatus FROM estatusPrueba WHERE nombreEstatus = 'Vencida')
    );