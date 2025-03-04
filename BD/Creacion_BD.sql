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
    Nombre_roL VARCHAR(50)
);

CREATE TABLE Roles_Privilegios(
	Id_rol VARCHAR(36) PRIMARY KEY not NULL,
    Id_privilegios VARCHAR(36) PRIMARY KEY not NULL,
    FOREIGN KEY (Id_rol) REFERENCES Roles(Id_rol),
    FOREIGN KEY (Id_privilegio) REFERENCES Roles(Id_privilegio)
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

CREATE TABLE PreguntasFormatoEntrevista(
    Id_preguntaFormatoEntrevista VARCHAR(36) PRIMARY KEY not NULL,
    Nombre_preguntaFormatoEntrevista VARCHAR(255)
);

CREATE TABLE Aspirantes(
    Id_aspirante VARCHAR(36) PRIMARY KEY not NULL,
    Id_usuario VARCHAR(36), -- Herencia de Usuario
    Institucion_procedencia VARCHAR(50),
    Id_pais VARCHAR(36),
    Id_estado VARHAR(36),
    Cv VARCHAR(100),
    Kardex VARCHAR(100),
    FOREIGN KEY (Id_usuario) REFERENCES Usuarios(Id_usuario),
    FOREIGN KEY (Id_pais) REFERENCES Paises(Id_pais),
    FOREIGN KEY (Id_estado) REFERENCES Estados(Id_estado)
);

CREATE TABLE Aspirantes_PreguntasFormatoEntrevista(
    Id_aspirante VARCHAR(36) PRIMARY KEY,
    Id_preguntaFormatoEntrevista VARCHAR(36) PRIMARY KEY,
    Respuesta_aspirante VARCHAR(36),
    FOREIGN KEY Id_aspirante REFERENCES Aspirantes(Id_aspirante),
    FOREIGN KEY Id_preguntaFormatoEntrevista REFERENCES PreguntasFormatoEntrevista(Id_preguntaFormatoEntrevista)
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
    FOREIGN KEY (Id_genero) REFERENCES Generos(Id_genero)
    FOREIGN KEY (Id_estadoCivil) REFERENCES EstadoCivil(Id_estadoCivil)
    FOREIGN KEY (Id_aspirante) REFERENCES Aspirantes(Id_aspirante),
    Hijo_de VARCHAR(36), -- ¿Sí se pondría así para referenciar a otro registro de la misma tabla?
    FOREIGN KEY (Hijo_de) REFERENCES Familiares(Id_familiar)
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
    FOREIGN KEY Id_tipoInstitucion REFERENCES TipoInstitucion(Id_tipoInstitucion)
);

CREATE TABLE NivelAcademico(
    Id_nivelAcademico VARCHAR(36),
    Nombre_nivelAcademico VARCHAR(50)
);

CREATE TABLE Grupos(
    Id_grupo VARCHAR(36),
    Nombre_grupo VARCHAR(100),
    Estatus_grupo BOOLEAN,
    Ciclo_escolar VARCHAR(50),
    Anio_generacion INT,
    Carrera VARCHAR(100),
    Id_institucion VARCHAR(36),
    Id_nivelAcademico VARCHAR(36),
    FOREIGN KEY Id_institucion REFERENCES Institucion(Id_institucion),
    FOREIGN KEY Id_nivelAcademico REFERENCES NivelAcademico(Id_nivelAcademico)
);

CREATE TABLE Grupos_Aspirantes(
    Id_grupo VARCHAR(36) PRIMARY KEY not NULL, -- ¿También se debe de colocar el not NULL aunque ya esté definido en la PK?
    Id_aspirante VARCHAR(36),
    Fecha_asignacion DATE,
    Fecha_limite DATE,
    FOREIGN KEY Id_grupo REFERENCES Grupos(Id_grupo),
    FOREIGN KEY Id_aspirante REFERENCES Aspirantes(Id_aspirante)
);
