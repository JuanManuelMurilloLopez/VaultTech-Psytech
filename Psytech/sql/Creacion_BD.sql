
CREATE DATABASE psytech;

USE psytech;


CREATE TABLE privilegios(
    idPrivilegio INT AUTO_INCREMENT PRIMARY KEY, -- INT AutoIncremental
    nombrePrivilegio VARCHAR(50)
);


CREATE TABLE roles(
    idRol INT AUTO_INCREMENT PRIMARY KEY, -- INT AutoIncremental
    nombreRol VARCHAR(50)
);

CREATE TABLE rolesPrivilegios(
    idRol INT, -- INT AutoIncremental
    idPrivilegio INT, -- INT AutoIncremental
    PRIMARY KEY (idRol, idPrivilegio),
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
    FOREIGN KEY (idPrivilegio) REFERENCES privilegios(idPrivilegio)
);

CREATE TABLE usuarios(
    idUsuario VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    usuario VARCHAR(50),
    contrasenia VARCHAR(60),
    estatusUsuario BOOLEAN,
    nombreUsuario VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    correo VARCHAR(50),
    lada VARCHAR(4),
    numeroTelefono VARCHAR(10),
    idRol INT, -- UUID
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
    INDEX usuario (usuario)
);

-- Tablas con INT AUTO_INCREMENT
CREATE TABLE paises(
    idPais INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombrePais VARCHAR(50)
);

CREATE TABLE estados(
    idEstado INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreEstado VARCHAR(50)
);

-- Tablas con UUID
CREATE TABLE aspirantes(
    idAspirante VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    idUsuario VARCHAR(36), -- UUID
    institucionProcedencia VARCHAR(50),
    idPais INT, -- INT AUTO_INCREMENT
    idEstado INT, -- INT AUTO_INCREMENT
    cv VARCHAR(255),
    kardex VARCHAR(255),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idPais) REFERENCES paises(idPais),
    FOREIGN KEY (idEstado) REFERENCES estados(idEstado)
);

CREATE TABLE preguntasFormatoEntrevista(
    idPreguntaFormatoEntrevista INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombrePreguntaFormatoEntrevista VARCHAR(255)
);

CREATE TABLE aspirantesPreguntasFormatoEntrevista(
    idAspirante VARCHAR(36) NOT NULL, -- UUID
    idPreguntaFormatoEntrevista INT, -- INT AUTO_INCREMENT
    PRIMARY KEY (idAspirante, idPreguntaFormatoEntrevista),
    respuestaAspirante VARCHAR(255),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idPreguntaFormatoEntrevista) REFERENCES preguntasFormatoEntrevista(idPreguntaFormatoEntrevista)
);

-- Tablas con INT AUTO_INCREMENT
CREATE TABLE generos(
    idGenero INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreGenero VARCHAR(50)
);

CREATE TABLE estadoCivil(
    idEstadoCivil INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreEstadoCivil VARCHAR(50)
);

-- Tablas con UUID
CREATE TABLE familiares(
    idFamiliar VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    idAspirante VARCHAR(36), -- UUID
    nombreFamiliar VARCHAR(255),
    estadoDeVida BOOLEAN,
    idGenero INT, -- INT AUTO_INCREMENT
    idEstadoCivil INT, -- INT AUTO_INCREMENT
    edadFamiliar INT,
    hijoDe VARCHAR(36), -- UUID
    FOREIGN KEY (idGenero) REFERENCES generos(idGenero),
    FOREIGN KEY (idEstadoCivil) REFERENCES estadoCivil(idEstadoCivil),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (hijoDe) REFERENCES familiares(idFamiliar)
);

CREATE TABLE tipoInstitucion(
    idTipoInstitucion INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreTipoInstitucion VARCHAR(50)
);


-- Tablas con UUID
CREATE TABLE institucion(
    idInstitucion VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombreInstitucion VARCHAR(100),
    estatusInstitucion BOOLEAN,
    idTipoInstitucion INT, -- INT AUTO_INCREMENT
    FOREIGN KEY (idTipoInstitucion) REFERENCES tipoInstitucion(idTipoInstitucion)
);

CREATE TABLE nivelAcademico(
    idNivelAcademico INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreNivelAcademico VARCHAR(50)
);

-- Tablas con UUID
CREATE TABLE grupos(
    idGrupo VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombreGrupo VARCHAR(100),
    estatusGrupo BOOLEAN,
    cicloEscolar VARCHAR(50),
    anioGeneracion INT,
    carrera VARCHAR(100),
    idInstitucion VARCHAR(36), -- UUID
    idNivelAcademico INT, -- INT AUTO_INCREMENT
    FOREIGN KEY (idInstitucion) REFERENCES institucion(idInstitucion),
    FOREIGN KEY (idNivelAcademico) REFERENCES nivelAcademico(idNivelAcademico)
);

CREATE TABLE gruposAspirantes(
    idGrupo VARCHAR(36),
    idAspirante VARCHAR(36),
    PRIMARY KEY (idGrupo, idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante)
);

CREATE TABLE pruebas(
    idPrueba INT AUTO_INCREMENT PRIMARY KEY not NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    instrucciones VARCHAR(255),
    tiempo INT
);

-- Tablas con UUID
CREATE TABLE datosPersonales(
    idDatosPersonales VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    puestoSolicitado VARCHAR(50),
    fecha DATE,
    idPrueba INT,
    idAspirante VARCHAR(36),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante)
);


CREATE TABLE estatusPrueba(
    idEstatus INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreEstatus VARCHAR(20)
);

CREATE TABLE aspirantesGruposPruebas(
    idGrupo VARCHAR(36),
    idPrueba INT,
    idAspirante VARCHAR(36),
    idEstatus INT,
    fechaAsignacion DATE,
    fechaLimite DATE,
    PRIMARY KEY (idGrupo, idPrueba, idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idEstatus) REFERENCES estatusPrueba(idEstatus)
);

CREATE TABLE preguntasOtis (
    idPreguntaOtis VARCHAR(36) PRIMARY KEY not NULL, 
    idPrueba INT,
    numeroPregunta INT,
    preguntaOtis VARCHAR(255),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE opcionesOtis (
    idOpcionOtis VARCHAR(36) PRIMARY KEY,
    idPreguntaOtis VARCHAR(36),
    opcionOtis INT, -- Cambiar a opcionOtis
    descripcionOpcion TEXT, -- descripcionOpcion
    esCorrecta BOOLEAN,
    FOREIGN KEY (idPreguntaOtis) REFERENCES preguntasOtis(idPreguntaOtis)
);

CREATE TABLE respuestaOtisAspirante (
    idRespuestaOtis VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idGrupo VARCHAR(36),
    idPreguntaOtis VARCHAR(36),
    idOpcionOtis VARCHAR(36),  -- Solo si es opción múltiple
    idPrueba INT,
    respuestaAbierta VARCHAR(5),  -- Solo si es pregunta abierta
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idPreguntaOtis) REFERENCES preguntasOtis(idPreguntaOtis),
    FOREIGN KEY (idOpcionOtis) REFERENCES opcionesOtis(idOpcionOtis),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo)
);

CREATE TABLE colores(
    idColor INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    nombreColor VARCHAR(50),
    numeroColor INT,
    significado VARCHAR(50),
    hexColor VARCHAR(7)
);

CREATE TABLE seleccionesColores(
    idSeleccionColores VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    idPrueba INT, -- UUID
    idAspirante VARCHAR(36), -- UUID
    idGrupo VARCHAR(36),
    idColor INT, -- INT AUTO_INCREMENT
    posicion INT CHECK (posicion <= 7 AND posicion >= 0),
    fase INT CHECK (fase = 1 OR fase = 2),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idColor) REFERENCES colores(idColor),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo)
);

CREATE TABLE preguntasKostick(
    idPreguntaKostick VARCHAR(36) PRIMARY KEY not NULL, 
    idPrueba INT,
    numeroPregunta INT,
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE opcionesKostick(
    idOpcionKostick VARCHAR(36) PRIMARY KEY,
    idPreguntaKostick VARCHAR(36),
    opcionKostick VARCHAR(1),
    descripcionOpcion TEXT,
    FOREIGN KEY (idPreguntaKostick) REFERENCES preguntasKostick(idPreguntaKostick)
);

CREATE TABLE respuestasKostickAspirante (
    idRespuestaKostick VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idGrupo VARCHAR(36),
    idPreguntaKostick VARCHAR(36),
    idOpcionKostick VARCHAR(36),  -- Solo si es opción múltiple
    idPrueba INT,
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPreguntaKostick) REFERENCES preguntasKostick(idPreguntaKostick),
    FOREIGN KEY (idOpcionKostick) REFERENCES opcionesKostick(idOpcionKostick),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE preguntas16PF(
    idPregunta16PF VARCHAR(36) PRIMARY KEY not NULL, 
    idPrueba INT,
    numeroPregunta INT,
    pregunta16PF VARCHAR(255),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE opciones16PF(
    idOpcion16PF VARCHAR(36) PRIMARY KEY,
    idPregunta16PF VARCHAR(36),
    opcion16PF VARCHAR(1),
    descripcionOpcion TEXT,
    FOREIGN KEY (idPregunta16PF) REFERENCES preguntas16PF(idPregunta16PF)
);

CREATE TABLE respuestas16PFAspirante (
    idRespuesta16PF VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idGrupo VARCHAR(36),
    idPregunta16PF VARCHAR(36),
    idOpcion16PF VARCHAR(36),  -- Solo si es opción múltiple
    idPrueba INT,
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPregunta16PF) REFERENCES preguntas16PF(idPregunta16PF),
    FOREIGN KEY (idOpcion16PF) REFERENCES opciones16PF(idOpcion16PF),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE preguntasHartman(
    idPreguntaHartman VARCHAR(36) PRIMARY KEY not NULL, 
    idPrueba INT,
    fasePregunta ENUM('1','2'),
    numeroPregunta INT,
    preguntaHartman VARCHAR(255),
    valorHartman INT,
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE respuestasHartmanAspirante (
    idRespuestaHartman VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idGrupo VARCHAR(36),
    idPreguntaHartman VARCHAR(36),
    idPrueba INT,
    respuestaAbierta INT,  -- Solo si es pregunta abierta
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPreguntaHartman) REFERENCES preguntasHartman(idPreguntaHartman),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE seriesTerman(
    idSerieTerman INT AUTO_INCREMENT PRIMARY KEY, -- INT AUTO_INCREMENT
    idPrueba INT,
    duracion INT,
    nombreSeccion VARCHAR(50),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE preguntasTerman(
    idPreguntaTerman VARCHAR(36) PRIMARY KEY not NULL, 
    idSerieTerman INT,
    numeroPregunta INT,
    preguntaTerman VARCHAR(255),
    FOREIGN KEY (idSerieTerman) REFERENCES seriesTerman(idSerieTerman)
);

CREATE TABLE opcionesTerman(
    idOpcionTerman VARCHAR(36) PRIMARY KEY,
    idPreguntaTerman VARCHAR(36),
    opcionTerman INT,
    descripcionOpcion TEXT,
    esCorrecta BOOLEAN,
    FOREIGN KEY (idPreguntaTerman) REFERENCES preguntasTerman(idPreguntaTerman)
);

CREATE TABLE respuestasTermanAspirante (
    idRespuestaTerman VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idGrupo VARCHAR(36),
    idPreguntaTerman VARCHAR(36),
    idPrueba INT,
    respuestaAbierta VARCHAR(20),  -- Solo si es pregunta abierta
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPreguntaTerman) REFERENCES preguntasTerman(idPreguntaTerman),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

