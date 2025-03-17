USE psytech;
-- Datos para la tabla Privilegios
INSERT INTO privilegios (idPrivilegio, nombrePrivilegio) VALUES
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
INSERT INTO roles (idRol, nombreRol) VALUES
(uuid(), 'Psicologo'),
(uuid(), 'Coordinador'),
(uuid(), 'Aspirante');

-- Datos para la tabla Roles_Privilegios
INSERT INTO rolesPrivilegios (idRol, idPrivilegio)
SELECT r.idRol, p.idPrivilegio
FROM roles r
JOIN privilegios p ON (
    (r.nombreRol = 'Psicologo' AND p.nombrePrivilegio IN (
        'Autenticación', 'Consultar TyC', 'Registrar instituciones', 
        'Consultar información de instituciones', 'Editar instituciones', 
        'Desactivar instituciones', 'Registrar grupos', 'Consultar información de grupos', 
        'Editar grupos', 'Desactivar grupos', 'Añadir aspirantes', 
        'Consultar información de aspirantes', 'Editar aspirantes', 
        'Desactivar aspirantes', 'Consultar respuestas', 'Consultar análisis', 
        'Consultar documentación', 'Consultar información de pruebas'
    ))
    OR
    (r.nombreRol = 'Coordinador' AND p.nombrePrivilegio IN (
        'Autenticación', 'Consultar TyC', 'Consultar psicólogos', 
        'Consultar coordinadores', 'Registrar psicólogo', 'Registrar coordinador', 
        'Editar psicólogo', 'Editar coordinador', 'Desactivar psicólogo', 
        'Desactivar coordinador'
    ))
    OR
    (r.nombreRol = 'Aspirante' AND p.nombrePrivilegio IN (
        'Autenticación', 'Consultar TyC', 'Consultar pruebas', 
        'Realizar pruebas', 'Subir archivos', 'Contestar formato de entrevista'
    ))
);