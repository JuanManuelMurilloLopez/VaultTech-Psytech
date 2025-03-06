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
INSERT INTO Roles_Privilegios (Id_rol, Id_privilegio) VALUES
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Autenticación')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Autenticación')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Autenticación')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar TyC')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar TyC')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar TyC')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Registrar instituciones')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar información de instituciones')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Editar instituciones')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Desactivar instituciones')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Registrar grupos')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar información de grupos')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Editar grupos')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Desactivar grupos')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Añadir aspirantes')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar información de aspirantes')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Editar aspirantes')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Desactivar aspirantes')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar respuestas')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar análisis')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar documentación')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Psicologo'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar información de pruebas')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar pruebas')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Realizar pruebas')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Subir archivo')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Aspirante'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Contestar formato de entrevista')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar psicólogos')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Consultar coordinadores')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Registrar psicólogo')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Registrar coordinador')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Editar psicólogo')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Editar coordinador')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Desactivar psicólogo')
),
(
    (SELECT Id_rol FROM Roles WHERE Nombre_rol = 'Coordinador'),
    (SELECT Id_privilegio FROM Privilegios WHERE Nombre_privilegio = 'Desactivar coordinador')
);