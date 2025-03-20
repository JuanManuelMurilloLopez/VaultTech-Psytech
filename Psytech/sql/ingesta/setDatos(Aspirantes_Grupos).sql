-- Inserción en la tabla gruposAspirantes para los grupos 'G1_ISC' y 'G2_II' con todos los aspirantes
INSERT INTO gruposAspirantes (idGrupo, idAspirante) VALUES
-- Grupo G1_ISC
((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'juanlópez39@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'maríapérez76@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'carlosrodríguez58@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lauragómez50@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'pedrofernández59@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'anamartínez97@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'luisramírez75@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'sofíaramírez88@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'miguelramírez66@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'elenagarcía10@example.com'))),

-- Grupo G2_II
((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'javierfernández98@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'lucíaramírez83@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'fernandotorres81@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'paulalópez49@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'ricardogarcía68@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'gabrielagómez9@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'manuelramírez62@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'valeriagómez68@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'raúlgarcía25@example.com'))),

((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), 
 (SELECT idAspirante FROM aspirantes WHERE idUsuario = (SELECT idUsuario FROM usuarios WHERE correo = 'isabelfernández54@example.com')));
