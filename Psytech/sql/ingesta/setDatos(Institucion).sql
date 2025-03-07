-- Inserción de instituciones
INSERT INTO Institucion (Id_institucion, Nombre_institucion, Estatus_institucion, Id_tipoInstitucion) VALUES
(uuid(), 'Universidad Nacional Autónoma de México', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Pública')),
(uuid(), 'Tecnológico de Monterrey', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad Autónoma Metropolitana', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad de Guadalajara', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad Anáhuac', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Privada')),
(uuid(), 'Instituto Politécnico Nacional', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad Iberoamericana', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad Autónoma de Nuevo León', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Pública')),
(uuid(), 'Escuela Bancaria y Comercial', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad de Monterrey', TRUE, (SELECT Id_tipoInstitucion FROM TipoInstitucion WHERE Nombre_tipoInstitucion = 'Educativa Privada'));
