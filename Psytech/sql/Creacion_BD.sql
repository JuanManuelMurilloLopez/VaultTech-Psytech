/*
 * ¿Todos los IDs los ponemos como UUID?
 * ¿Tenemos que añadir una tabla con las Ladas para los teléfonos?
*/

CREATE DATABASE psytech;

USE psytech;

-- Tablas con UUID
CREATE TABLE privilegios(
    idPrivilegio VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombrePrivilegio VARCHAR(50)
);


CREATE TABLE roles(
    idRol VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombreRol VARCHAR(50)
);

CREATE TABLE rolesPrivilegios(
    idRol VARCHAR(36) NOT NULL, -- UUID
    idPrivilegio VARCHAR(36) NOT NULL, -- UUID
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
    idRol VARCHAR(36), -- UUID
    FOREIGN KEY (idRol) REFERENCES roles(idRol)
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
    idPreguntaFormatoEntrevista VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombrePreguntaFormatoEntrevista VARCHAR(255)
);

CREATE TABLE aspirantesPreguntasFormatoEntrevista(
    idAspirante VARCHAR(36) NOT NULL, -- UUID
    idPreguntaFormatoEntrevista VARCHAR(36) NOT NULL, -- UUID
    PRIMARY KEY (idAspirante, idPreguntaFormatoEntrevista),
    respuestaAspirante VARCHAR(36),
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
    idPrueba VARCHAR(36) PRIMARY KEY not NULL,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

-- Tablas con UUID
CREATE TABLE datosPersonales(
    idDatosPersonales VARCHAR(36) PRIMARY KEY NOT NULL, -- UUID
    nombreUsuario VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    edadDatosPersonales INT,
    idGenero INT,
    idNivelAcademico INT,
    puestoSolicitado VARCHAR(50),
    idPrueba VARCHAR(36),
    idAspirante VARCHAR(36),
    FOREIGN KEY (idGenero) REFERENCES generos(idGenero),
    FOREIGN KEY (idNivelAcademico) REFERENCES nivelAcademico(idNivelAcademico),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante)
);

CREATE TABLE gruposPruebas(
    idGrupo VARCHAR(36),
    idPrueba VARCHAR(36),
    fechaAsignacion DATE,
    fechaLimite DATE,
    PRIMARY KEY (idGrupo, idPrueba),
    FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE pruebaOtis(
    idPruebaOtis VARCHAR(36) PRIMARY KEY not NULL,
    idPrueba VARCHAR(36),
    tiempo INT, -- Minutos
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba)
);

CREATE TABLE preguntasOtis (
    idPreguntaOtis VARCHAR(36) PRIMARY KEY not NULL, 
    idPruebaOtis VARCHAR(36),
    numeroPregunta INT,
    pregunta VARCHAR(255),
    FOREIGN KEY (idPruebaOtis) REFERENCES pruebaOtis(idPruebaOtis)
);

CREATE TABLE opcionesPreguntasOtis (
    idOpcionPreguntaOtis VARCHAR(36) PRIMARY KEY,
    idPreguntaOtis VARCHAR(36),
    numeroOpcion INT,
    descripcionOpcion TEXT,
    esCorrecta BOOLEAN,
    FOREIGN KEY (idPreguntaOtis) REFERENCES preguntasOtis(idPreguntaOtis)
);

CREATE TABLE respuestaOtisAspirante (
    idRespuestaOtis VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    idPruebaOtis VARCHAR(36),
    idPreguntaOtis VARCHAR(36),
    idOpcionPreguntaOtis VARCHAR(36),  -- Solo si es opción múltiple
    respuestaAbierta VARCHAR(5),  -- Solo si es pregunta abierta
    tiempoRespuesta INT,  -- En segundos
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idPruebaOtis) REFERENCES pruebaOtis(idPruebaOtis),
    FOREIGN KEY (idPreguntaOtis) REFERENCES preguntasOtis(id_PreguntaOtis),
    FOREIGN KEY (idOpcionPreguntaOtis) REFERENCES opcionesPreguntasOtis(idOpcionPreguntaOtis)
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
    idPrueba VARCHAR(36), -- UUID
    idAspirante VARCHAR(36), -- UUID
    idColor INT, -- INT AUTO_INCREMENT
    posicion INT CHECK (posicion <= 7 AND posicion >= 0),
    fase INT CHECK (fase = 1 OR fase = 2),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idColor) REFERENCES colores(idColor)
);
