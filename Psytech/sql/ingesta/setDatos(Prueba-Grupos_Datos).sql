INSERT INTO pruebas (idPrueba, nombre, descripcion)
VALUES
    (UUID(), 'OTIS', 'Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.'),
    (UUID(), 'TERMAN', 'Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.'),
    (UUID(), 'HARMAN', 'Evaluación psicológica utilizada en diversos contextos de diagnóstico.'),
    (UUID(), 'KOSTIK', 'Prueba proyectiva que analiza rasgos de personalidad y comportamiento.'),
    (UUID(), 'COLORES DE LUSCHER', 'Evaluación basada en la selección de colores para analizar el estado emocional.'),
    (UUID(), 'PRUEBA DE 16PF', 'Inventario de personalidad que mide 16 factores primarios de la personalidad.');

INSERT INTO datosPersonales (idDatosPersonales, nombreUsuario, apellidoPaterno, apellidoMaterno, edadDatosPersonales, idGenero, idNivelAcademico, puestoSolicitado, idPrueba, idAspirante)
VALUES
    (UUID(), 'Juan', 'López', 'García', 28, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Maestría'), 
        'Analista de Datos', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com'))
    ),
    (UUID(), 'María', 'Pérez', 'Martínez', 26, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Licenciatura'), 
        'Desarrollador Web', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com'))
    ),
    (UUID(), 'Carlos', 'Rodríguez', 'Fernández', 30, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Doctorado'), 
        'Investigador en IA', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com'))
    ),
    (UUID(), 'Laura', 'Gómez', 'Hernández', 27, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Maestría'), 
        'Psicóloga Organizacional', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com'))
    ),
    (UUID(), 'Pedro', 'Fernández', 'Ramírez', 29, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Licenciatura'), 
        'Ingeniero de Software', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com'))
    ),
    (UUID(), 'Ana', 'Martínez', 'López', 25, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Licenciatura'), 
        'Diseñador UX/UI', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com'))
    ),
    (UUID(), 'Luis', 'Ramírez', 'González', 31, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Doctorado'), 
        'Científico de Datos', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com'))
    ),
    (UUID(), 'Sofía', 'Ramírez', 'Torres', 28, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Maestría'), 
        'Consultor de RRHH', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com'))
    ),
    (UUID(), 'Miguel', 'Ramírez', 'Salinas', 26, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Masculino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Licenciatura'), 
        'Administrador de Redes', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com'))
    ),
    (UUID(), 'Elena', 'García', 'Méndez', 27, 
        (SELECT idGenero FROM generos WHERE nombreGenero = 'Femenino'), 
        (SELECT idNivelAcademico FROM nivelAcademico WHERE nombreNivelAcademico = 'Maestría'), 
        'Analista de Mercado', 
        (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), 
        (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com'))
    );

INSERT INTO gruposPruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G3_DERE'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G4_ARQ'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G5_MED'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G6_CON'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G7_PSI'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G8_IE'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G9_NI'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G10_CC'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14');
