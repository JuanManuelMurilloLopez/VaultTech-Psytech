/*
 * ¿Todos los IDs los ponemos como UUID?
 * ¿Tenemos que añadir una tabla con las Ladas para los teléfonos?
*/

CREATE DATABASE psytech;

USE psytech;

CREATE TABLE privilegios(
	-- uuid()
    idPrivilegio VARCHAR(36) PRIMARY KEY  not NULL, -- El UUID se guarda en un VARCHAR(36)
    nombrePrivilegio VARCHAR(50)
);

CREATE TABLE roles(
	-- uuid()
    idRol VARCHAR(36) PRIMARY KEY not NULL,
    nombreRol VARCHAR(50)
);

CREATE TABLE rolesPrivilegios(
	idRol VARCHAR(36) not NULL,
    idPrivilegio VARCHAR(36) not NULL,
    PRIMARY KEY (idRol, idPrivilegio), -- Llave primaria compuesta
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
    FOREIGN KEY (idPrivilegio) REFERENCES privilegios(idPrivilegio)
);

CREATE TABLE usuarios(
	idUsuario VARCHAR(36) PRIMARY KEY not NULL,
    usuario VARCHAR(50),
    contrasenia VARCHAR(60), -- Revisar cuánto espacio ocupa la cadena después del cifrado
    estatusUsuario BOOLEAN,
    nombreUsuario VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    correo VARCHAR(50),
    lada VARCHAR(4),
    numeroTelefono VARCHAR(10), -- Ej. "4421569563"
    idRol VARCHAR(36),
    FOREIGN KEY (idRol) REFERENCES roles(idRol)
);

CREATE TABLE paises(
    idPais VARCHAR(36) PRIMARY KEY not NULL,
    nombrePais VARCHAR(50)
);
CREATE TABLE estados(
    idEstado VARCHAR(36) PRIMARY KEY not NULL,
    nombreEstado VARCHAR(50)
);

CREATE TABLE aspirantes(
    idAspirante VARCHAR(36) PRIMARY KEY not NULL,
    idUsuario VARCHAR(36), -- Herencia de Usuario
    institucionProcedencia VARCHAR(50),
    idPais VARCHAR(36),
    idEstado VARCHAR(36),
    cv VARCHAR(255),
    kardex VARCHAR(255),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idPais) REFERENCES paises(idPais),
    FOREIGN KEY (idEstado) REFERENCES estados(idEstado)
);

CREATE TABLE preguntasFormatoEntrevista(
    idPreguntaFormatoEntrevista VARCHAR(36) PRIMARY KEY not NULL,
    nombrePreguntaFormatoEntrevista VARCHAR(255)
);

CREATE TABLE aspirantesPreguntasFormatoEntrevista(
    idAspirante VARCHAR(36) not NULL,
    idPreguntaFormatoEntrevista VARCHAR(36) not NULL,
    PRIMARY KEY (idAspirante, idPreguntaFormatoEntrevista),
    respuestaAspirante VARCHAR(36),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idPreguntaFormatoEntrevista) REFERENCES preguntasFormatoEntrevista(idPreguntaFormatoEntrevista)
);

CREATE TABLE generos(
    idGenero VARCHAR(36) PRIMARY KEY not NULL,
    nombreGenero VARCHAR(50)
);

CREATE TABLE estadoCivil(
    idEstadoCivil VARCHAR(36) PRIMARY KEY not NULL,
    nombreEstadoCivil VARCHAR(50)
);

CREATE TABLE familiares(
    idFamiliar VARCHAR(36) PRIMARY KEY not NULL,
    idAspirante VARCHAR(36),
    nombreFamiliar VARCHAR(255),
    estadoDeVida BOOLEAN,
    idGenero VARCHAR(36),
    idEstadoCivil VARCHAR(36),
    edadFamiliar INT,
    hijoDe VARCHAR(36), -- Se mantiene la referencia a otro familiar

    FOREIGN KEY (idGenero) REFERENCES generos(idGenero),
    FOREIGN KEY (idEstadoCivil) REFERENCES estadoCivil(idEstadoCivil),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (hijoDe) REFERENCES familiares(idFamiliar) -- Relación recursiva
);

CREATE TABLE tipoInstitucion(
    idTipoInstitucion VARCHAR(36) PRIMARY KEY not NULL,
    nombreTipoInstitucion VARCHAR(50)
);

CREATE TABLE institucion(
    idInstitucion VARCHAR(36) PRIMARY KEY not NULL,
    nombreInstitucion VARCHAR(100),
    estatusInstitucion BOOLEAN,
    idTipoInstitucion VARCHAR(36),
    FOREIGN KEY (idTipoInstitucion) REFERENCES tipoInstitucion(idTipoInstitucion)
);

CREATE TABLE nivelAcademico(
    idNivelAcademico VARCHAR(36) PRIMARY KEY not NULL,
    nombreNivelAcademico VARCHAR(50)
);

CREATE TABLE grupos(
    idGrupo VARCHAR(36) PRIMARY KEY not NULL,
    nombreGrupo VARCHAR(100),
    estatusGrupo BOOLEAN,
    cicloEscolar VARCHAR(50),
    anioGeneracion INT,
    carrera VARCHAR(100),
    idInstitucion VARCHAR(36),
    idNivelAcademico VARCHAR(36),
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

CREATE TABLE datosPersonales(
    idDatosPersonales VARCHAR(36) PRIMARY KEY not NULL,
    nombreUsuario VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    edadDatosPersonales INT,
    idGenero VARCHAR(36),
    idNivelAcademico VARCHAR(36),
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
    idColor VARCHAR(36) PRIMARY KEY not NULL,
    nombreColor VARCHAR(50),
    numeroColor INT,
    significado VARCHAR(50),
    hexColor VARCHAR(7)
);

CREATE TABLE seleccionesColores(
    idSeleccionColores VARCHAR(36) PRIMARY KEY not NULL,
    idPrueba VARCHAR(36),
    idAspirante VARCHAR(36),
    idColor VARCHAR(36),
    posicion INT CHECK (posicion <= 7 AND posicion >= 0),
    fase INT CHECK (fase = 1 OR fase = 2),
    FOREIGN KEY (idPrueba) REFERENCES pruebas(idPrueba),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    FOREIGN KEY (idColor) REFERENCES colores(idColor)
);