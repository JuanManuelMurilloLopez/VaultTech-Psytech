exports.generarCorreoEntrevistaGrupal = (fecha, hora, enlace) => (
    `<body>
    <div>
        <p>
            Le enviamos un cordial saludo y por este medio le informamos que ha sido programada una <strong>reunión grupal virtual</strong> para la aplicación de una prueba psicológica, como parte del proceso de evaluación psicológica del posgrado al que ha aplicado.
            <br>
            A continuación encontrará la información correspondiente para conectarse:
            <br>
Fecha: ${fecha} <br>
Hora: ${hora} <br>
Enlace para ingresar a la sesión: <a href="${enlace}">${enlace}</a> <br>
<br>
Le solicitamos conectarse a la plataforma de zoom en el horario indicado para no perder la sesión ni afectar la logística, ya que durante esta sesión se aplicará la prueba de forma conjunta. Es importante que cuente con buena conexión a internet y mantener la cámara encendida durante toda la sesión. 
<br>
Una vez concluida la aplicación de las pruebas, se dará inicio a la etapa de entrevistas individuales. 
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
            Le enviamos un cordial saludo y por este medio le informamos que su <strong>aplicación grupal de prueba psicológica</strong> ha sido modificada.
            <br>
            A continuación encontrará la información correspondiente para conectarse:
            <br>
Fecha: ${fecha} <br>
Hora: ${hora} <br>
Enlace para ingresar a la sesión: <a href="${enlace}">${enlace}</a> <br>
<br>
Le solicitamos conectarse a la plataforma de zoom en el horario indicado para no perder la sesión ni afectar la logística, ya que durante esta sesión se aplicará la prueba de forma conjunta. Es importante que cuente con buena conexión a internet y mantener la cámara encendida durante toda la sesión. 
<br>
Una vez concluida la aplicación de las pruebas, se dará inicio a la etapa de entrevistas individuales. 
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
            Le enviamos un cordial saludo y por este medio le informamos que su <strong>aplicación grupal de prueba psicológica ha sido cancelada.</strong>
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

exports.generarCorreoEntrevista1on1 = (fecha, horaInicio, horaFin, enlace, psicologaNombre) => (
    `<body>
    <div>
        <p>
            Le enviamos un cordial saludo y por este medio le informamos que ha sido programada una <strong>entrevista individual virtual</strong> como parte del proceso de evaluación psicológica del posgrado al que ha aplicado.<br>
            <br>
            <strong>Psicóloga asignada:</strong> ${psicologaNombre}<br>
            Fecha: ${fecha} <br>
            Hora: ${horaInicio} - ${horaFin} <br>
            Enlace para ingresar a la sesión: <a href="${enlace}">${enlace}</a> <br>
            <br>
            Le solicitamos conectarse a la plataforma de videollamada en el horario indicado. Es importante que cuente con buena conexión a internet y mantener la cámara encendida durante toda la sesión.<br>
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

exports.generarCorreoEntrevista1on1Modificada = (fecha, horaInicio, horaFin, enlace, psicologaNombre) => (
    `<body>
    <div>
        <p>
            Le informamos que su <strong>entrevista individual virtual</strong> ha sido modificada.<br>
            <br>
            <strong>Psicóloga asignada:</strong> ${psicologaNombre}<br>
            Fecha: ${fecha} <br>
            Hora: ${horaInicio} - ${horaFin} <br>
            Enlace para ingresar a la sesión: <a href="${enlace}">${enlace}</a> <br>
            <br>
            Le solicitamos conectarse a la plataforma de videollamada en el horario indicado. Es importante que cuente con buena conexión a internet y mantener la cámara encendida durante toda la sesión.<br>
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

exports.generarCorreoEntrevista1on1Cancelada = (fecha, horaInicio, horaFin, enlace, psicologaNombre) => (
    `<body>
    <div>
        <p>
            Le informamos que su <strong>entrevista individual virtual</strong> ha sido cancelada.<br>
            <br>
            <strong>Psicóloga asignada:</strong> ${psicologaNombre}<br>
            Fecha: ${fecha} <br>
            Hora: ${horaInicio} - ${horaFin} <br>
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