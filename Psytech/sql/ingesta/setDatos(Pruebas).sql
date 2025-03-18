INSERT INTO pruebas (idPrueba, nombre, descripcion, instrucciones, tiempo)
VALUES
    (UUID(), 'OTIS', 'Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.','instruccionesOtis.txt',30),
    (UUID(), 'TERMAN', 'Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.','instruccionesTerman.txt',NULL),
    (UUID(), 'HARMAN', 'Evaluación psicológica utilizada en diversos contextos de diagnóstico.','instruccionesHarman.txt',NULL),
    (UUID(), 'KOSTICK', 'Prueba proyectiva que analiza rasgos de personalidad y comportamiento.','instruccionesKostick.txt',NULL),
    (UUID(), 'COLORES DE LUSCHER', 'Evaluación basada en la selección de colores para analizar el estado emocional.','instruccionesColores.txt',NULL),
    (UUID(), 'PRUEBA DE 16PF', 'Inventario de personalidad que mide 16 factores primarios de la personalidad.','instrucciones16PF.txt',NULL);