-- Inserción de 20 grupos con claves representativas
INSERT INTO Grupos (Id_grupo, Nombre_grupo, Estatus_grupo, Ciclo_escolar, Anio_generacion, Carrera, Id_institucion, Id_nivelAcademico) VALUES
(uuid(), 'G1_ISC', TRUE, '2025-2026', 2025, 'Ingeniería en Sistemas Computacionales', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Nacional Autónoma de México'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G2_II', TRUE, '2025-2026', 2025, 'Ingeniería Industrial', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Tecnológico de Monterrey'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G3_DERE', TRUE, '2025-2026', 2025, 'Derecho', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Autónoma Metropolitana'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G4_ARQ', TRUE, '2025-2026', 2025, 'Arquitectura', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad de Guadalajara'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G5_MED', TRUE, '2025-2026', 2025, 'Medicina', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Anáhuac'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G6_CON', TRUE, '2025-2026', 2025, 'Contaduría', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Instituto Politécnico Nacional'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G7_PSI', TRUE, '2025-2026', 2025, 'Psicología', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Iberoamericana'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G8_IE', TRUE, '2025-2026', 2025, 'Ingeniería Electrónica', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Autónoma de Nuevo León'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G9_NI', TRUE, '2025-2026', 2025, 'Negocios Internacionales', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Escuela Bancaria y Comercial'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G10_CC', TRUE, '2025-2026', 2025, 'Ciencias de la Computación', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad de Monterrey'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Licenciatura')),

(uuid(), 'G11_IM', TRUE, '2025-2026', 2025, 'Ingeniería Mecánica', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Nacional Autónoma de México'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría')),

(uuid(), 'G12_ECO', TRUE, '2025-2026', 2025, 'Economía', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Tecnológico de Monterrey'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría')),

(uuid(), 'G13_BIO', TRUE, '2025-2026', 2025, 'Biología', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Autónoma Metropolitana'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría')),

(uuid(), 'G14_IC', TRUE, '2025-2026', 2025, 'Ingeniería Civil', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad de Guadalajara'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Maestría')),

(uuid(), 'G15_FIL', TRUE, '2025-2026', 2025, 'Filosofía', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Anáhuac'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado')),

(uuid(), 'G16_ANT', TRUE, '2025-2026', 2025, 'Antropología', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Instituto Politécnico Nacional'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado')),

(uuid(), 'G17_QUI', TRUE, '2025-2026', 2025, 'Química', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Iberoamericana'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado')),

(uuid(), 'G18_MAT', TRUE, '2025-2026', 2025, 'Matemáticas', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Universidad Autónoma de Nuevo León'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado')),

(uuid(), 'G19_HIS', TRUE, '2025-2026', 2025, 'Historia', (SELECT Id_institucion FROM Institucion WHERE Nombre_institucion = 'Escuela Bancaria y Comercial'), (SELECT Id_nivelAcademico FROM NivelAcademico WHERE Nombre_nivelAcademico = 'Doctorado'));
