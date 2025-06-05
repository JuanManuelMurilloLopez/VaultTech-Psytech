exports.generarCorreoEntrevistaGrupal = (fecha, hora, enlace) => (
    `<body>
    <div>
        <p>
            Le enviamos un cordial saludo y por este medio le informamos que su <strong>entrevista grupal</strong> ha sido programada como parte del proceso de evaluación psicológica del posgrado al que aplicó.
            <br>
            A continuación encontrará la información correspondiente para conectarse:
            <br>
Fecha: ${fecha} <br>
Hora: ${hora} <br>
Enlace de videollamada: ${enlace} <br>
<br>
Le solicitamos conectarse con puntualidad, desde un espacio tranquilo, con buena conexión a internet, y con su cámara encendida durante toda la entrevista.
<br>
En caso de que presente algún inconveniente con el enlace o tenga complicaciones para conectarse, por favor envíe un mensaje a través del botón de soporte dentro del sistema, y nos pondremos en contacto para ayudarle.
        </p>
    </div>
    <footer>
        <strong>
            ATENTAMENTE. <br>
            Equipo de Psicólogas PSICODX <br>
        </strong>
    </footer>
</body>`
);

exports.generarCorreoEntrevistaGrupalModificada = (fecha, hora, enlace) => (
    `<body>
    <div>
        <p>
            Le enviamos un cordial saludo y por este medio le informamos que su <strong>entrevista grupal</strong> ha sido modificada.
            <br>
            A continuación encontrará la información correspondiente para conectarse:
            <br>
Fecha: ${fecha} <br>
Hora: ${hora} <br>
Enlace de videollamada: ${enlace} <br>
<br>
Le solicitamos conectarse con puntualidad, desde un espacio tranquilo, con buena conexión a internet, y con su cámara encendida durante toda la entrevista.
<br>
En caso de que presente algún inconveniente con el enlace o tenga complicaciones para conectarse, por favor envíe un mensaje a través del botón de soporte dentro del sistema, y nos pondremos en contacto para ayudarle.
        </p>
    </div>
    <footer>
        <strong>
            ATENTAMENTE. <br>
            Equipo de Psicólogas PSICODX <br>
        </strong>
    </footer>
</body>`
);

exports.generarCorreoEntrevistaGrupalCancelada = (fecha, hora, enlace) => (
    `<body>
    <div>
        <p>
            Le enviamos un cordial saludo y por este medio le informamos que su <strong>entrevista grupal ha sido cancelada.</strong>
            <br>
            Si tiene alguna duda, por favor envíe un mensaje a través del botón de soporte dentro del sistema, y nos pondremos en contacto para ayudarle.
        </p>
    </div>
    <footer>
        <strong>
            ATENTAMENTE. <br>
            Equipo de Psicólogas PSICODX <br>
        </strong>
    </footer>
</body>`
);