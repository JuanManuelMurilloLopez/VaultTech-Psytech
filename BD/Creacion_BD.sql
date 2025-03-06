/*
 * ¿Todos los IDs los ponemos como UUID?
 * ¿Tenemos que añadir una tabla con las Ladas para los teléfonos?
*/

CREATE TABLE Privilegios(
	-- uuid()
    Id_privilegio VARCHAR(36) PRIMARY KEY  not NULL, -- El UUID se guarda en un VARCHAR(36)
    Nombre_privilegio VARCHAR(50)
);

CREATE TABLE Roles(
	-- uuid()
    Id_rol VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_rol VARCHAR(50)
);

CREATE TABLE Roles_Privilegios(
	Id_rol VARCHAR(36) not NULL,
    Id_privilegio VARCHAR(36) not NULL,
    PRIMARY KEY (Id_rol, Id_privilegio), -- Llave primaria compuesta
    FOREIGN KEY (Id_rol) REFERENCES Roles(Id_rol),
    FOREIGN KEY (Id_privilegio) REFERENCES Privilegios(Id_privilegio)
);

CREATE TABLE Usuarios(
	Id_usuario VARCHAR(36) PRIMARY KEY not NULL,
    Usuario VARCHAR(50),
    Contrasenia VARCHAR(60), -- Revisar cuánto espacio ocupa la cadena después del cifrado
    Estatus_usuario BOOLEAN,
    Nombre_usuario VARCHAR(50),
    Apellido_paterno VARCHAR(50),
    Apellido_materno VARCHAR(50),
    Correo VARCHAR(50),
    Numero_telefono VARCHAR(17), -- Ej. "(+052) 4421569563"
    Id_rol VARCHAR(36),
    FOREIGN KEY (Id_rol) REFERENCES Roles(Id_rol)
);

CREATE TABLE Paises(
    Id_pais VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_pais VARCHAR(50)
);
CREATE TABLE Estados(
    Id_estado VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_estado VARCHAR(50)
);

CREATE TABLE Aspirantes(
    Id_aspirante VARCHAR(36) PRIMARY KEY not NULL,
    Id_usuario VARCHAR(36), -- Herencia de Usuario
    Institucion_procedencia VARCHAR(50),
    Id_pais VARCHAR(36),
    Id_estado VARCHAR(36),
    Cv VARCHAR(100),
    Kardex VARCHAR(100),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario),
    FOREIGN KEY (Id_pais) REFERENCES Paises(Id_pais),
    FOREIGN KEY (Id_estado) REFERENCES Estados(Id_estado)
);

CREATE TABLE PreguntasFormatoEntrevista(
    Id_preguntaFormatoEntrevista VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_preguntaFormatoEntrevista VARCHAR(255)
);

CREATE TABLE Aspirantes_PreguntasFormatoEntrevista(
    Id_aspirante VARCHAR(36) not NULL,
    Id_preguntaFormatoEntrevista VARCHAR(36) not NULL,
    PRIMARY KEY (Id_aspirante, Id_preguntaFormatoEntrevista),
    Respuesta_aspirante VARCHAR(36),
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante),
    FOREIGN KEY (Id_preguntaFormatoEntrevista) REFERENCES PreguntasFormatoEntrevista(Id_preguntaFormatoEntrevista)
);

CREATE TABLE Generos(
    Id_genero VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_genero VARCHAR(50)
);

CREATE TABLE EstadoCivil(
    Id_estadoCivil VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_estadoCivil VARCHAR(50)
);

CREATE TABLE Familiares(
    Id_familiar VARCHAR(36) PRIMARY KEY not NULL,
    Id_aspirante VARCHAR(36),
    Nombre_familiar VARCHAR(255),
    Estado_de_vida BOOLEAN,
    Id_genero VARCHAR(36),
    Id_estadoCivil VARCHAR(36),
    Edad_familiar INT,
    Hijo_de VARCHAR(36), -- Se mantiene la referencia a otro familiar

    FOREIGN KEY (Id_genero) REFERENCES Generos(Id_genero),
    FOREIGN KEY (Id_estadoCivil) REFERENCES EstadoCivil(Id_estadoCivil),
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante),
    FOREIGN KEY (Hijo_de) REFERENCES Familiares(Id_familiar) -- Relación recursiva
);

CREATE TABLE TipoInstitucion(
    Id_tipoInstitucion VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_tipoInstitucion VARCHAR(50)
);

CREATE TABLE Institucion(
    Id_institucion VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_institucion VARCHAR(100),
    Estatus_institucion BOOLEAN,
    Id_tipoInstitucion VARCHAR(36),
    FOREIGN KEY (Id_tipoInstitucion) REFERENCES TipoInstitucion(Id_tipoInstitucion)
);

CREATE TABLE NivelAcademico(
    Id_nivelAcademico VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_nivelAcademico VARCHAR(50)
);

CREATE TABLE Grupos(
    Id_grupo VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_grupo VARCHAR(100),
    Estatus_grupo BOOLEAN,
    Ciclo_escolar VARCHAR(50),
    Anio_generacion INT,
    Carrera VARCHAR(100),
    Id_institucion VARCHAR(36),
    Id_nivelAcademico VARCHAR(36),
    FOREIGN KEY (Id_institucion) REFERENCES Institucion(Id_institucion),
    FOREIGN KEY (Id_nivelAcademico) REFERENCES NivelAcademico(Id_nivelAcademico)
);

CREATE TABLE Grupos_Aspirantes(
    Id_grupo VARCHAR(36) PRIMARY KEY not NULL,
    Id_aspirante VARCHAR(36),
    FOREIGN KEY (Id_grupo) REFERENCES Grupos(Id_grupo),
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante)
);

CREATE TABLE DatosPersonales(
    Id_datosPersonales VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_usuario VARCHAR(50),
    Apellido_paterno VARCHAR(50),
    Apellido_materno VARCHAR(50),
    Edad_datosPersonales INT,
    Id_genero VARCHAR(36),
    Id_nivelAcademico VARCHAR(36),
    Puesto_solicitado VARCHAR(50),
    FOREIGN KEY (Id_genero) REFERENCES Generos(Id_genero),
    FOREIGN KEY (Id_nivelAcademico) REFERENCES NivelAcademico(Id_nivelAcademico)
);

CREATE TABLE Pruebas(
    Id_prueba VARCHAR(36) PRIMARY KEY not NULL,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(255),
    Id_datosPersonales VARCHAR(36),
    FOREIGN KEY (Id_datosPersonales) REFERENCES DatosPersonales(Id_datosPersonales)
);

CREATE TABLE Grupos_Prueba(
    Id_grupo VARCHAR(36),
    Id_prueba VARCHAR(36),
    fecha_asignacion DATE,
    fecha_limite DATE,
    PRIMARY KEY (Id_grupo, Id_prueba),
    FOREIGN KEY Id_grupo REFERENCES Grupos(Id_grupo),
    FOREIGN KEY Id_prueba REFERENCES Pruebas(Id_prueba)
);

CREATE TABLE PruebaOtis(
    Id_pruebaOtis VARCHAR(36) PRIMARY KEY not NULL,
    Id_prueba VARCHAR(36),
    Tiempo INT, -- Minutos
    FOREIGN KEY (Id_prueba) REFERENCES Prueba(Id_prueba)
);

CREATE TABLE PreguntasOtis (
    Id_preguntaOtis VARCHAR(36) PRIMARY KEY not NULL, 
    Id_pruebaOtis VARCHAR(36),
    Numero_pregunta INT,
    Pregunta VARCHAR(255),
    FOREIGN KEY (Id_pruebaOtis) REFERENCES Prueba(Id_pruebaOtis)
);

CREATE TABLE OpcionesPreguntasOtis (
    Id_opcion VARCHAR(36) PRIMARY KEY,
    Id_preguntaOtis VARCHAR(36),
    Numero_opcion INT,
    Descripcion_opcion TEXT,
    Es_correcta VARCHAR(255),
    FOREIGN KEY (Id_preguntaOtis) REFERENCES Pregunta(Id_preguntaOtis)
);

CREATE TABLE RespuestaOtis_Aspirante (
    Id_respuestaOtis VARCHAR(36) PRIMARY KEY not NULL,
    Id_aspirante VARCHAR(36),
    Id_pruebaOtis VARCHAR(36),
    Id_preguntaOtis VARCHAR(36),
    Id_opcion VARCHAR(36),  -- Solo si es opción múltiple
    Respuesta_abierta VARCHAR(5),  -- Solo si es pregunta abierta
    Tiempo_respuesta INT,  -- En segundos
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante),
    FOREIGN KEY (Id_pruebaOtis) REFERENCES Prueba(Id_pruebaOtis),
    FOREIGN KEY (Id_preguntaOtis) REFERENCES Pregunta(Id_preguntaOtis),
    FOREIGN KEY (Id_opcion) REFERENCES Opciones(Id_opcion)
);