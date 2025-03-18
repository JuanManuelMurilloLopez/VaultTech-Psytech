INSERT INTO gruposPruebas (idGrupo, idPrueba, fechaAsignacion, fechaLimite) VALUES
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G1_ISC'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G2_II'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G3_DERE'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G4_ARQ'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G5_MED'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G6_CON'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G7_PSI'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G8_IE'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G9_NI'), (SELECT idPrueba FROM pruebas WHERE nombre = 'COLORES DE LUSCHER'), '2025-03-07', '2025-03-14'),
    ((SELECT idGrupo FROM grupos WHERE nombreGrupo = 'G10_CC'), (SELECT idPrueba FROM pruebas WHERE nombre = 'OTIS'), '2025-03-07', '2025-03-14');
