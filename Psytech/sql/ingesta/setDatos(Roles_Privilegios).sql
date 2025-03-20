USE psytech;
-- Datos para la tabla Privilegios
INSERT INTO privilegios (idPrivilegio, nombrePrivilegio) VALUES
('Autenticación'), -- Todos
('Consultar TyC'),
('Registrar instituciones'), -- Psicólogos
('Consultar información de instituciones'),
('Editar instituciones'),
('Desactivar instituciones'),
('Registrar grupos'),
('Consultar información de grupos'),
('Editar grupos'),
('Desactivar grupos'),
('Añadir aspirantes'),
('Consultar información de aspirantes'),
('Editar aspirantes'),
('Desactivar aspirantes'),
('Consultar respuestas'),
('Consultar análisis'),
('Consultar documentación'),
('Consultar información de pruebas'), 
('Consultar pruebas'), -- Aspirantes
('Realizar pruebas'),
('Subir archivos'),
('Contestar formato de entrevista'), 
('Consultar psicólogos'), -- Coordinadores
('Consultar coordinadores'),
('Registrar psicólogo'),
('Registrar coordinador'),
('Editar psicólogo'),
('Editar coordinador'),
('Desactivar psicólogo'),
('Desactivar coordinador');


-- Datos para la tabla Roles
INSERT INTO roles (idRol, nombreRol) VALUES
('Psicologo'),
('Coordinador'),
('Aspirante');

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