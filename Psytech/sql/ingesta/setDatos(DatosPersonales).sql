INSERT INTO datosPersonales (idDatosPersonales, nombre, apellidoPaterno, apellidoMaterno, puestoSolicitado, fecha, idPrueba, idAspirante)
VALUES
    (UUID(), 'Juan', 'López', 'García', 'Analista de Datos', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com'))
    ),
    (UUID(), 'María', 'Pérez', 'Martínez', 'Desarrollador Web', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com'))
    ),
    (UUID(), 'Carlos', 'Rodríguez', 'Fernández', 'Investigador en IA', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com'))
    ),
    (UUID(), 'Laura', 'Gómez', 'Hernández', 'Psicóloga Organizacional', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com'))
    ),
    (UUID(), 'Pedro', 'Fernández', 'Ramírez', 'Ingeniero de Software', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com'))
    ),
    (UUID(), 'Ana', 'Martínez', 'López', 'Diseñador UX/UI', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com'))
    ),
    (UUID(), 'Luis', 'Ramírez', 'González', 'Científico de Datos', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com'))
    ),
    (UUID(), 'Sofía', 'Ramírez', 'Torres', 'Consultor de RRHH', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com'))
    ),
    (UUID(), 'Miguel', 'Ramírez', 'Salinas', 'Administrador de Redes', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com'))
    ),
    (UUID(), 'Elena', 'García', 'Méndez', 'Analista de Mercado', CURDATE(), 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com'))
    );