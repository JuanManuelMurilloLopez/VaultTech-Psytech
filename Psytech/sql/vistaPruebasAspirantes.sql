USE psytech;

CREATE VIEW vistaPruebasAspirantes AS
SELECT P.idPrueba, P.nombre, P.descripcion, GP.fechaLimite, PO.tiempo, GA.idAspirante
FROM pruebas P
LEFT JOIN pruebaOtis PO ON P.idPrueba = PO.idPrueba 
JOIN gruposPruebas GP ON P.idPrueba = GP.idPrueba
JOIN gruposAspirantes GA ON GP.idGrupo = GA.idGrupo
JOIN aspirantes A ON GA.idAspirante = A.idAspirante