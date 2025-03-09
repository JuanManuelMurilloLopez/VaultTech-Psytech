-- Datos para la tabla Privilegios
INSERT INTO Privilegios (Id_privilegio, Nombre_privilegio) VALUES
('201', 'Gestionar Usuarios'),
('202', 'Gestionar Aspirantes'),
('203', 'Ver Reportes');

-- Datos para la tabla Roles
INSERT INTO Roles (Id_rol, Nombre_rol) VALUES
('101', 'Administrador'),
('102', 'Coordinador'),
('103', 'Aspirante');

-- Datos para la tabla Roles_Privilegios
INSERT INTO Roles_Privilegios (Id_rol, Id_privilegio) VALUES
('101', '201'),
('101', '202'),
('102', '202'),
('102', '203');

-- Datos para la tabla Usuarios
INSERT INTO Usuarios (Id_usuario, Usuario, Contrasenia, Estatus_usuario, Nombre_usuario, Apellido_paterno, Apellido_materno, Correo, Numero_telefono, Id_rol)
VALUES
('1e3a5b62-7cde-4a5b-91a9-b89e8f5b19b7', 'jdoe', 'hashed_password_1', TRUE, 'John', 'Doe', 'Smith', 'jdoe@example.com', '(+052) 4421234567', '101'),
('2f4b6c73-8edf-5b6c-82b0-c90f9e6c20c8', 'mgarcia', 'hashed_password_2', TRUE, 'Maria', 'García', 'López', 'mgarcia@example.com', '(+052) 4427654321', '102'),
('3g5d7e84-9fgh-6d7e-93c1-d01a0f7d31d9', 'lperez', 'hashed_password_3', FALSE, 'Luis', 'Pérez', 'Ramírez', 'lperez@example.com', '(+052) 4428765432', '103');

-- Datos para la tabla Paises
INSERT INTO Paises (Id_pais, Nombre_pais) VALUES
('MX', 'México'),
('US', 'Estados Unidos'),
('CA', 'Canadá');

-- Datos para la tabla Estados
INSERT INTO Estados (Id_estado, Nombre_estado) VALUES
('QRO', 'Querétaro'),
('CDMX', 'Ciudad de México'),
('NL', 'Nuevo León');

-- Datos para la tabla Aspirantes
INSERT INTO Aspirantes (Id_aspirante, Id_usuario, Institucion_procedencia, Id_pais, Id_estado, Cv, Kardex)
VALUES
('a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '1e3a5b62-7cde-4a5b-91a9-b89e8f5b19b7', 'Universidad Nacional', 'MX', 'QRO', 'cv_jdoe.pdf', 'kardex_jdoe.pdf'),
('b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', '2f4b6c73-8edf-5b6c-82b0-c90f9e6c20c8', 'Instituto Tecnológico', 'MX', 'CDMX', 'cv_mgarcia.pdf', 'kardex_mgarcia.pdf'),
('c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', '3g5d7e84-9fgh-6d7e-93c1-d01a0f7d31d9', 'Universidad Autónoma', 'MX', 'NL', 'cv_lperez.pdf', 'kardex_lperez.pdf');

-- Datos para la tabla PreguntasFormatoEntrevista
INSERT INTO PreguntasFormatoEntrevista (Id_preguntaFormatoEntrevista, Nombre_preguntaFormatoEntrevista) VALUES
('301', '¿Por qué deseas ingresar al programa?'),
('302', '¿Cuáles son tus expectativas académicas?');

-- Datos para la tabla Aspirantes_PreguntasFormatoEntrevista
INSERT INTO Aspirantes_PreguntasFormatoEntrevista (Id_aspirante, Id_preguntaFormatoEntrevista, Respuesta_aspirante) VALUES
('a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '301', 'Para mejorar mis oportunidades profesionales'),
('b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', '302', 'Quiero adquirir más conocimientos en mi área');

-- Datos para la tabla Generos
INSERT INTO Generos (Id_genero, Nombre_genero) VALUES
('401', 'Masculino'),
('402', 'Femenino'),
('403', 'Otro');

-- Datos para la tabla EstadoCivil
INSERT INTO EstadoCivil (Id_estadoCivil, Nombre_estadoCivil) VALUES
('501', 'Soltero'),
('502', 'Casado');

-- Insertando datos en la tabla Familiares
INSERT INTO Familiares (Id_familiar, Id_aspirante, Nombre_familiar, Estado_de_vida, Id_genero, Id_estadoCivil, Edad_familiar, Hijo_de)
VALUES
-- Familiares del aspirante 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6'
('f1a', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', 'Carlos Pérez', TRUE, '401', '501', 58, NULL), -- Padre
('f1b', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', 'María López', TRUE, '401', '501', 55, NULL), -- Madre
('f1c', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', 'Luis Pérez', TRUE, '401', '501', 30, 'f1a'), -- Hermano
('f1d', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', 'Ana Pérez', TRUE, '401', '501', 27, 'f1a'), -- Hermana

-- Familiares del aspirante 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7'
('f2a', 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', 'Fernando Gómez', TRUE, '401', '501', 60, NULL), -- Padre
('f2b', 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', 'Lucía Herrera', TRUE, '401', '501', 57, NULL), -- Madre
('f2c', 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', 'Sofía Gómez', TRUE, '401', '501', 25, 'f2a'), -- Hermana
('f2d', 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', 'Eduardo Gómez', TRUE, '401', '501', 22, 'f2a'), -- Hermano

-- Familiares del aspirante 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8'
('f3a', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Jorge Ramírez', FALSE, '401', '501', 85, NULL), -- Abuelo fallecido
('f3b', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Carmen Ramírez', TRUE, '401', '501', 82, NULL), -- Abuela
('f3c', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Raúl Ramírez', TRUE, '401', '501', 55, 'f3a'), -- Padre
('f3d', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Marta Díaz', TRUE, '401', '501', 50, NULL), -- Madre
('f3e', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Gabriela Ramírez', TRUE, '401', '501', 28, 'f3c'), -- Hermana

-- Hijos de aspirantes
('f4a', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', 'Mateo Pérez', TRUE, '401', '501', 5, 'f1c'), -- Hijo del hermano del aspirante
('f4b', 'b2c3d4e5-f6g7-8h9i-0j1k-2l3m4n5o6p7', 'Valeria Gómez', TRUE, '401', '501', 3, 'f2c'), -- Hija de la hermana del aspirante
('f4c', 'c3d4e5f6-g7h8-9i0j-1k2l-3m4n5o6p7q8', 'Andrés Ramírez', TRUE, '401', '501', 2, 'f3e'); -- Hijo de la hermana del aspirante

-- Datos para la tabla TipoInstitucion
INSERT INTO TipoInstitucion (Id_tipoInstitucion, Nombre_tipoInstitucion) VALUES
('701', 'Educativa');

-- Datos para la tabla Institucion
INSERT INTO Institucion (Id_institucion, Nombre_institucion, Estatus_institucion, Id_tipoInstitucion) VALUES
('801', 'Universidad Nacional', TRUE, '701');

-- Datos para la tabla NivelAcademico
INSERT INTO NivelAcademico (Id_nivelAcademico, Nombre_nivelAcademico) VALUES
('901', 'Licenciatura');

-- Datos para la tabla Grupos
INSERT INTO Grupos (Id_grupo, Nombre_grupo, Estatus_grupo, Ciclo_escolar, Anio_generacion, Carrera, Id_institucion, Id_nivelAcademico) VALUES
('1001', 'Grupo A', TRUE, '2024-2025', 2025, 'Ingeniería en Computación', '801', '901');

-- Datos para la tabla Grupos_Aspirantes
INSERT INTO Grupos_Aspirantes (Id_grupo, Id_aspirante, Fecha_asignacion, Fecha_limite) VALUES
('1001', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '2025-01-10', '2025-06-30');

-- Datos para la tabla DatosPersonales
INSERT INTO DatosPersonales (Id_datosPersonales, Nombre_usuario, Apellido_paterno, Apellido_materno, Edad_datosPersonales, Id_genero, Id_nivelAcademico, Puesto_solicitado)
VALUES 
('1a2b3c4d-0001', 'Carlos', 'Gómez', 'López', 25, '401', '901', 'Ingeniero de Software'),
('1a2b3c4d-0002', 'Ana', 'Martínez', 'Sánchez', 28, '401', '901', 'Analista de Datos'),
('1a2b3c4d-0003', 'Luis', 'Hernández', 'Ruiz', 30, '401', '901', 'Desarrollador Backend');

INSERT INTO Prueba (Id_prueba, Nombre, Descripción, Id_datosPersonales)
VALUES 
('2a3b4c5d-0001', 'Prueba Otis', 'Evaluación de razonamiento lógico y verbal.', '1a2b3c4d-0001');

-- Insertar datos en la tabla PruebaOtis
INSERT INTO PruebaOtis (Id_prueba, Tiempo) VALUES
('2a3b4c5d-0001', 30);

-- Insertar datos en la tabla Pregunta
INSERT INTO Pregunta (Id_pregunta, Id_prueba, Numero_pregunta, Pregunta) VALUES
('q1', '2a3b4c5d-0001', 1, '¿Cuál es el resultado de 5 + 7?'),
('q2', '2a3b4c5d-0001', 2, 'Si un tren viaja a 80 km/h, ¿cuánto recorrerá en 3 horas?');

-- Insertar datos en la tabla Opciones
INSERT INTO Opciones (Id_opcion, Id_pregunta, Numero_opcion, Descripcion_opcion, Es_correcta) VALUES
('o1', 'q1', 1, '10', 'FALSE'),
('o2', 'q1', 2, '12', 'TRUE'),
('o3', 'q1', 3, '15', 'FALSE'),
('o4', 'q2', 1, '160 km', 'FALSE'),
('o5', 'q2', 2, '240 km', 'TRUE');

-- Insertar datos en la tabla RespuestaAspirante
INSERT INTO RespuestaAspirante (Id_respuesta, Id_aspirante, Id_prueba, Id_pregunta, Id_opcion, Respuesta_abierta, Tiempo_respuesta) VALUES
('r1', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '2a3b4c5d-0001', 'q1', 'o2', NULL, 30),
('r2', 'a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '2a3b4c5d-0001', 'q2', 'o5', NULL, 45);