USE psytech;
-- Datos para la tabla Privilegios
INSERT INTO Privilegios (Id_privilegio, Nombre_privilegio) VALUES
(uuid(), 'Autenticación'), -- Todos
(uuid(), 'Consultar TyC'),
(uuid(), 'Registrar instituciones'), -- Psicólogos
(uuid(), 'Consultar información de instituciones'),
(uuid(), 'Editar instituciones'),
(uuid(), 'Desactivar instituciones'),
(uuid(), 'Registrar grupos'),
(uuid(), 'Consultar información de grupos'),
(uuid(), 'Editar grupos'),
(uuid(), 'Desactivar grupos'),
(uuid(), 'Añadir aspirantes'),
(uuid(), 'Consultar información de aspirantes'),
(uuid(), 'Editar aspirantes'),
(uuid(), 'Desactivar aspirantes'),
(uuid(), 'Consultar respuestas'),
(uuid(), 'Consultar análisis'),
(uuid(), 'Consultar documentación'),
(uuid(), 'Consultar información de pruebas'), 
(uuid(), 'Consultar pruebas'), -- Aspirantes
(uuid(), 'Realizar pruebas'),
(uuid(), 'Subir archivos'),
(uuid(), 'Contestar formato de entrevista'), 
(uuid(), 'Consultar psicólogos'), -- Coordinadores
(uuid(), 'Consultar coordinadores'),
(uuid(), 'Registrar psicólogo'),
(uuid(), 'Registrar coordinador'),
(uuid(), 'Editar psicólogo'),
(uuid(), 'Editar coordinador'),
(uuid(), 'Desactivar psicólogo'),
(uuid(), 'Desactivar coordinador');


-- Datos para la tabla Roles
INSERT INTO Roles (Id_rol, Nombre_rol) VALUES
(uuid(), 'Psicologo'),
(uuid(), 'Coordinador'),
(uuid(), 'Aspirante');

-- Datos para la tabla Roles_Privilegios
INSERT INTO Roles_Privilegios (Id_rol, Id_privilegio)
SELECT r.Id_rol, p.Id_privilegio
FROM Roles r
JOIN Privilegios p ON (
    (r.Nombre_rol = 'Psicologo' AND p.Nombre_privilegio IN (
        'Autenticación', 'Consultar TyC', 'Registrar instituciones', 
        'Consultar información de instituciones', 'Editar instituciones', 
        'Desactivar instituciones', 'Registrar grupos', 'Consultar información de grupos', 
        'Editar grupos', 'Desactivar grupos', 'Añadir aspirantes', 
        'Consultar información de aspirantes', 'Editar aspirantes', 
        'Desactivar aspirantes', 'Consultar respuestas', 'Consultar análisis', 
        'Consultar documentación', 'Consultar información de pruebas'
    ))
    OR
    (r.Nombre_rol = 'Coordinador' AND p.Nombre_privilegio IN (
        'Autenticación', 'Consultar TyC', 'Consultar psicólogos', 
        'Consultar coordinadores', 'Registrar psicólogo', 'Registrar coordinador', 
        'Editar psicólogo', 'Editar coordinador', 'Desactivar psicólogo', 
        'Desactivar coordinador'
    ))
    OR
    (r.Nombre_rol = 'Aspirante' AND p.Nombre_privilegio IN (
        'Autenticación', 'Consultar TyC', 'Consultar pruebas', 
        'Realizar pruebas', 'Subir archivos', 'Contestar formato de entrevista'
    ))
);