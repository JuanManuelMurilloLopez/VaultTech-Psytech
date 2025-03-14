USE psytech;

CREATE VIEW vistaPruebasAspirantes AS
SELECT P.Id_prueba, P.Nombre, P.Descripcion, GP.fecha_limite, PO.Tiempo, GA.Id_aspirante
FROM Pruebas P
LEFT JOIN Pruebaotis PO ON P.Id_prueba = PO.Id_prueba 
JOIN Grupos_Pruebas GP ON P.Id_prueba = GP.Id_prueba
JOIN Grupos_Aspirantes GA ON GP.Id_grupo = GA.Id_grupo
JOIN Aspirantes A ON GA.Id_aspirante = A.Id_aspirante