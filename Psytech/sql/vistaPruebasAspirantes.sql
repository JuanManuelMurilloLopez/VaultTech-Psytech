USE psytech;

CREATE OR REPLACE VIEW vistaPruebasAspirantes AS
SELECT 
    P.nombre, 
    E.nombreEstatus, 
    P.descripcion, 
    AGP.fechaLimite, 
    P.tiempo, 
    A.idAspirante, 
    G.nombreGrupo  
FROM pruebas P
JOIN aspirantesGruposPruebas AGP ON P.idPrueba = AGP.idPrueba
JOIN estatusPrueba E ON AGP.idEstatus = E.idEstatus
JOIN aspirantes A ON AGP.idAspirante = A.idAspirante
JOIN grupos G ON AGP.idGrupo = G.idGrupo;
