-- Inserción de instituciones
INSERT INTO institucion (idInstitucion, nombreInstitucion, estatusInstitucion, idTipoInstitucion) VALUES
(uuid(), 'Universidad Nacional Autónoma de México', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Pública')),
(uuid(), 'Tecnológico de Monterrey', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad Autónoma Metropolitana', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad de Guadalajara', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad Anáhuac', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Privada')),
(uuid(), 'Instituto Politécnico Nacional', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Pública')),
(uuid(), 'Universidad Iberoamericana', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad Autónoma de Nuevo León', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Pública')),
(uuid(), 'Escuela Bancaria y Comercial', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Privada')),
(uuid(), 'Universidad de Monterrey', TRUE, (SELECT idTipoInstitucion FROM tipoInstitucion WHERE nombreTipoInstitucion = 'Educativa Privada'));
