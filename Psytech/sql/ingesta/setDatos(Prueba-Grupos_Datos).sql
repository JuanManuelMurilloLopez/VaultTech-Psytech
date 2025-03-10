INSERT INTO Pruebas (Id_prueba, Nombre, Descripcion)
VALUES
    (UUID(), 'OTIS', 'Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.'),
    (UUID(), 'TERMAN', 'Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.'),
    (UUID(), 'HARMAN', 'Evaluación psicológica utilizada en diversos contextos de diagnóstico.'),
    (UUID(), 'KOSTIK', 'Prueba proyectiva que analiza rasgos de personalidad y comportamiento.'),
    (UUID(), 'COLORES DE LUSCHER', 'Evaluación basada en la selección de colores para analizar el estado emocional.'),
    (UUID(), 'PRUEBA DE 16PF', 'Inventario de personalidad que mide 16 factores primarios de la personalidad.');

INSERT INTO DatosPersonales (Id_datosPersonales, Nombre_usuario, Apellido_paterno, Apellido_materno, Edad_datosPersonales, Id_genero, Id_nivelAcademico, Puesto_solicitado, Id_prueba, Id_aspirante)
VALUES
    (UUID(), 'Juan', 'López', 'García', 28, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría'), 
        'Analista de Datos', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com'))
    ),
    (UUID(), 'María', 'Pérez', 'Martínez', 26, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura'), 
        'Desarrollador Web', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com'))
    ),
    (UUID(), 'Carlos', 'Rodríguez', 'Fernández', 30, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado'), 
        'Investigador en IA', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com'))
    ),
    (UUID(), 'Laura', 'Gómez', 'Hernández', 27, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría'), 
        'Psicóloga Organizacional', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com'))
    ),
    (UUID(), 'Pedro', 'Fernández', 'Ramírez', 29, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura'), 
        'Ingeniero de Software', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com'))
    ),
    (UUID(), 'Ana', 'Martínez', 'López', 25, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura'), 
        'Diseñador UX/UI', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com'))
    ),
    (UUID(), 'Luis', 'Ramírez', 'González', 31, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado'), 
        'Científico de Datos', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com'))
    ),
    (UUID(), 'Sofía', 'Ramírez', 'Torres', 28, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría'), 
        'Consultor de RRHH', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com'))
    ),
    (UUID(), 'Miguel', 'Ramírez', 'Salinas', 26, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Masculino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura'), 
        'Administrador de Redes', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com'))
    ),
    (UUID(), 'Elena', 'García', 'Méndez', 27, 
        (SELECT Id_genero FROM Generos WHERE Nombre_genero = 'Femenino'), 
        (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría'), 
        'Analista de Mercado', 
        (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), 
        (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com'))
    );

INSERT INTO Grupos_Pruebas (Id_grupo, Id_prueba, fecha_asignacion, fecha_limite) VALUES
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G3_DERE'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G4_ARQ'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G5_MED'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G6_CON'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G7_PSI'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G8_IE'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G9_NI'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G10_CC'), (SELECT Id_prueba FROM Pruebas WHERE Nombre = 'OTIS'), '2025-03-07', '2025-03-14');