-- Inserción en la tabla Grupos_Aspirantes para los grupos 'G1_ISC' y 'G2_II' con todos los aspirantes
INSERT INTO Grupos_Aspirantes (Id_grupo, Id_aspirante) VALUES
-- Grupo G1_ISC
((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'juanlópez39@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'maríapérez76@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'carlosrodríguez58@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lauragómez50@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'pedrofernández59@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'anamartínez97@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'luisramírez75@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'sofíaramírez88@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'miguelramírez66@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G1_ISC'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'elenagarcía10@example.com'))),

-- Grupo G2_II
((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'javierfernández98@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'lucíaramírez83@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'fernandotorres81@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'paulalópez49@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'ricardogarcía68@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'gabrielagómez9@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'manuelramírez62@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'valeriagómez68@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'raúlgarcía25@example.com'))),

((SELECT Id_grupo FROM Grupos WHERE Nombre_grupo = 'G2_II'), 
 (SELECT Id_aspirante FROM Aspirantes WHERE Id_usuario = (SELECT Id_usuario FROM Usuarios WHERE Correo = 'isabelfernández54@example.com')));
