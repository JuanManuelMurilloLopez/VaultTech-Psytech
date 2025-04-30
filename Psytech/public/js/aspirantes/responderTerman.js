// -----------------------------
// VARIABLES GLOBALES DE CONTROL
// -----------------------------
let serieActual = 1;
const totalSeries = 10;
// Barra de progreso
const preguntasTotales = 173;
let preguntasRespondidas = 0;
// Duración de la serie en segundos (recibido del backend)
let tiempoSerie;        
// Control del cronómetro global
let tiempoRestante;     
// Intervalo del setInterval
let intervalo;          
// Arrays y contadores para las preguntas de la serie
let preguntasActuales = [];
let indicePregunta = 0;
// Almacena respuestas: [{ idPregunta, opcion, tiempo }, ...]
let tiemposRespuestas = []; 
// Marca el inicio de cada pregunta
let tiempoInicio;

let serieFinalizada = false;
let finalizandoSerie = false; 

// ----------------------------
// PREVENCIÓN DE RECARGA Y RETROCESO
// ----------------------------
// Handler referenciable para beforeunload
const handlerBeforeUnload = function (e) {
    e.preventDefault();
    e.returnValue = '';
};
function activarBloqueoDeSalida() {
    window.addEventListener('beforeunload', handlerBeforeUnload);
}
function desactivarBloqueoDeSalida() {
    window.removeEventListener('beforeunload', handlerBeforeUnload);
}
// Handler referenciable para popstate
const handlerPopstate = function (event) {
    history.pushState(null, null, location.href);
};
function prevenirBotonAtras() {
    history.pushState(null, null, location.href);
    window.addEventListener('popstate', handlerPopstate);
}
function permitirBotonAtras() {
    window.removeEventListener('popstate', handlerPopstate);
}
// ----------------------------
// INICIO DEL CRONÓMETRO GLOBAL
// ----------------------------
function iniciarCronometro(callbackFin) {
    clearInterval(intervalo);
    const cronometroElem = document.getElementById('cronometro');
    // Asigna la duración recibida de la serie
    tiempoRestante = tiempoSerie; 
    cronometroElem.innerText = `Tiempo restante: ${tiempoRestante}s`;
    cronometroElem.style.display = 'block'; 
    intervalo = setInterval(() => {
        tiempoRestante--;
        cronometroElem.innerText = `Tiempo restante: ${tiempoRestante}s`;
        if (tiempoRestante <= 0) {
            clearInterval(intervalo);
            // Llama a la función que finaliza la serie si se agotó el tiempo
            callbackFin(); 
        }
    }, 1000);
}
// ----------------------------
// BARRA DE PROGRESO
// ----------------------------
function actualizarProgresoGlobal() {
    const barra = document.getElementById('barra-progreso');
    const texto = document.getElementById('progreso-texto');
    const porcentaje = Math.round((preguntasRespondidas / preguntasTotales) * 100);
    barra.style.width = `${porcentaje}%`;
    texto.innerText = `${porcentaje}% completado`;
}
function aumentarProgreso() {
    preguntasRespondidas++;
    actualizarProgresoGlobal();
}
// ---------------------
// TRAER DATOS DE LA SERIE
// ---------------------
function traerSerie(idSerie) {
    console.log("Llamando traerSerie con id:", idSerie);
    fetch(`/aspirante/prueba-terman/serie/${idSerie}`, {
        method: 'GET',
        credentials: 'include',
    })
    .then(res => res.json())
    .then(info => {
        serieActual = info.id; 
        // Muestra las instrucciones + botón "Comenzar"
        mostrarSerie(info); 
    })
    .catch(error => {
        console.error("Error al traer la serie:", error);
    });
}
// ----------------------------
// OBTENER RESPUESTAS RESTANTES
// (para las preguntas que faltan cuando se acaba el tiempo)
// ----------------------------
function completarRespuestasFaltantes() {
    // Marcar las preguntas no respondidas con opcion=0
    // Esto es útil si se acaba el tiempo o el usuario no contestó.
    const preguntasFaltantes = preguntasActuales.slice(indicePregunta);
    const tiempoRespuesta = Math.floor((Date.now() - tiempoInicio) / 1000);
    // Barra de progreso
    preguntasRespondidas += preguntasFaltantes.length;
    actualizarProgresoGlobal();

    preguntasFaltantes.forEach(p => {
        return fetch(`/aspirante/prueba-terman/pregunta/${p.idPreguntaTerman}`, {
            method: 'POST',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                respuesta: 0,
                tiempo: tiempoRespuesta
            })
        });
    });
}

// ------------------------------------
// MOSTRAR INSTRUCCIONES DE LA SERIE
// ------------------------------------
function mostrarSerie(info) {
    console.log("Entrando a mostrarSerie con info:", info);
    tiempoSerie = info.duracion;
    mostrarInstruccionesSerie(
        info,
        `Tiempo para esta serie: ${info.duracion} segundos`,
        "Comenzar serie",
        () => iniciarPreguntas(info.preguntas)
    );
}

function mostrarInstruccionesSerie(info, tiempoVisible, textoBoton, callbackInicio) {
    const instruccionesElem = document.getElementById('instrucciones-serie');
    const cronometroElem = document.getElementById('cronometro');
    cronometroElem.innerText = '';
    cronometroElem.style.display = 'none';

    const extraInstruccion = (info.id === 4)
        ? '<p><strong>SELECCIONA 2 OPCIONES POR CADA PREGUNTA</strong></p>'
        : '';

    instruccionesElem.innerHTML = `
        <h3>Serie ${info.id}: ${info.nombreSeccion}</h3>
        <p>${info.instruccion}</p>
        <p><strong>TIP</strong>: Si no deseas responder la pregunta, solo da click en <strong>"No contestar"</strong>.<p>
        ${extraInstruccion}
        <div id="tiempo-boton">
            <p><strong>${tiempoVisible}</strong></p>
            <button id="comenzar-serie" class="comenzar btn-color--secondary">${textoBoton}</button>
        </div>
    `;

    document.getElementById('preguntas-serie').innerHTML = '';

    document.getElementById('comenzar-serie').addEventListener('click', () => {
        document.getElementById('tiempo-boton').remove();
        callbackInicio();
    });
}

// -------------------------------
// mostrarPreguntaDinamica
// -------------------------------
function mostrarPreguntaDinamica() {
    const pregunta = preguntasActuales[indicePregunta];

    const callback = () => {
        if (indicePregunta < preguntasActuales.length) {
            mostrarPreguntaDinamica();
        } else {
            finalizarSerie();
        }
    };

    if (serieActual === 4) {
        mostrarPregunta("checkbox", pregunta, callback);
    } else if (serieActual === 5) {
        mostrarPregunta("text", pregunta, callback);
    } else if (serieActual === 10) {
        mostrarPregunta("doubleText", pregunta, callback);
    } else {
        mostrarPregunta("radio", pregunta, callback);
    }
}

function finalizarSerie() {
    if (serieFinalizada || finalizandoSerie) return;
    finalizandoSerie = true;

    clearInterval(intervalo);

    completarRespuestasFaltantes()
        .then(() => {
            serieFinalizada = true;   // solo la primera en completarse marcará esto
            avanzarOSalir();
        })
        .catch(err => {
            console.error("Error al completar respuestas faltantes:", err);
            alert("Hubo un error al completar respuestas.");
        })
        .finally(() => {
            finalizandoSerie = false; // suelta la bandera aunque haya error
        });
}

function avanzarOSalir() {
    serieActual++;
    if (serieActual <= totalSeries) {
        traerSerie(serieActual);
    } else {
        desactivarBloqueoDeSalida();
        permitirBotonAtras();
        setTimeout(() => {
            alert("¡Has terminado la prueba!");
            window.location.href = "/aspirante/mis-pruebas";
        }, 100);
    }
};


// -------------------------------
// INICIAR LAS PREGUNTAS DE LA SERIE
// -------------------------------
function iniciarPreguntas(preguntas, desde=0) {
    preguntasActuales = preguntas;
    indicePregunta = desde;
    tiemposRespuestas = [];

    // RESETEO
    serieFinalizada = false;
    finalizandoSerie = false;

    iniciarCronometro(finalizarSerie);

    mostrarPreguntaDinamica();
}

// -----------------------------------
// MOSTRAR PREGUNTAS SERIE GENÉRICA 
// -----------------------------------
function mostrarPregunta(tipo, pregunta, desdeCallback) {
    const contenedor = document.getElementById('preguntas-serie');
    tiempoInicio = Date.now();

    let contenido = `<p>${pregunta.numeroPregunta}. ${pregunta.preguntaTerman}</p>`;
    let eventoRegistro;
    if (tipo === "radio") {
        contenido += pregunta.opciones.map(op => `
            <label>
                <input type="radio" name="respuesta_${pregunta.idPreguntaTerman}" value="${op.opcionTerman}">
                ${op.descripcionTerman}
            </label>
        `).join('<br>');
    }

    if (tipo === "checkbox") {
        contenido += pregunta.opciones.map(op => `
            <label>
                <input type="checkbox" name="respuesta_${pregunta.idPreguntaTerman}" value="${op.opcionTerman}">
                ${op.descripcionTerman}
            </label>
        `).join('<br>');
    }

    if (tipo === "text") {
        contenido += `<input type="text" id="respuestaTexto" placeholder="Escribe tu respuesta..." pattern="[0-9.\\/]*" inputmode="decimal" autocomplete="off">`;
    }

    if (tipo === "doubleText") {
        contenido += `
            <div id="serie10-input">
                <input type="text" id="respuestaTextoA" placeholder="[ número 1 ]" pattern="[0-9.\\/]*" inputmode="decimal" autocomplete="off">
                <span class="separador"> - </span>
                <input type="text" id="respuestaTextoB" placeholder="[ número 2 ]" pattern="[0-9.\\/]*" inputmode="decimal" autocomplete="off">
            </div>
        `;
    }

    contenido += `
        <p id="error-seleccion" style="color:red;"></p>
        <div class="botones-preguntas">
            <button id="no-contestar" class="no-contestar">No contestar</button>
            <button id="siguiente-pregunta" 
            class="btn siguiente" disabled>Siguiente</button>
        </div>
    `;

    contenedor.innerHTML = contenido;
    // Función de restricción para inputs
    function permitirSoloNumerosYPuntosDiagonal(event) {
        const regex = /^[0-9./\\]*$/;
        if (!regex.test(event.target.value)) {
            event.target.value = event.target.value.replace(/[^0-9./\\]/g, '');
        }
    }
    // Ahora SÍ puedes buscar los inputs y agregar validación
    if (tipo === "text") {
        const input = document.getElementById('respuestaTexto');
        input.addEventListener('input', permitirSoloNumerosYPuntosDiagonal);
    }
    if (tipo === "doubleText") {
        const inputA = document.getElementById('respuestaTextoA');
        const inputB = document.getElementById('respuestaTextoB');
        inputA.addEventListener('input', permitirSoloNumerosYPuntosDiagonal);
        inputB.addEventListener('input', permitirSoloNumerosYPuntosDiagonal);
    }

    const btnNoContestar = document.getElementById('no-contestar');
    const btnSiguiente = document.getElementById('siguiente-pregunta');
    const error = document.getElementById('error-seleccion');

    function procesar(opcion) {
        const tiempoRespuesta = Math.floor((Date.now() - tiempoInicio) / 1000);

        console.log("Procesando respuesta:", {
            idPregunta: pregunta?.idPreguntaTerman,
            opcion,
            tiempo: tiempoRespuesta
        });
    
        fetch(`/aspirante/prueba-terman/pregunta/${pregunta.idPreguntaTerman}`, {
            method: 'POST',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                respuesta: opcion,
                tiempo: tiempoRespuesta
            })
        })
        .then(res => res.json())
        .then(data => {
            console.log("Respuesta del backend:", data);
            if (data.estado === "OK") {
                tiemposRespuestas.push({
                    idPregunta: pregunta.idPreguntaTerman,
                    opcion,
                    tiempo: tiempoRespuesta
                });
    
                aumentarProgreso();
                indicePregunta++;
                desdeCallback();
            } else {
                console.error("Error al guardar respuesta:", data);
            }
        })
        .catch(err => {
            console.error("Error de red al guardar respuesta:", err);
        });
    }
    function procesarMultiple(opciones) {
        const tiempoRespuesta = Math.floor((Date.now() - tiempoInicio) / 1000);
    
        const promesas = opciones.map(opcion => 
            fetch(`/aspirante/prueba-terman/pregunta/${pregunta.idPreguntaTerman}`, {
                method: 'POST',
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    respuesta: opcion,
                    tiempo: tiempoRespuesta,
                })
            })
        );
    
        Promise.all(promesas)
        .then(() => {
            tiemposRespuestas.push({
                idPregunta: pregunta.idPreguntaTerman,
                opcion: opciones.join(', '),
                tiempo: tiempoRespuesta
            });
    
            aumentarProgreso();
            indicePregunta++;
            desdeCallback();
        })
        .catch(err => {
            console.error("Error de red al guardar respuestas múltiples:", err);
        });
    }
    // Agrega lógica específica por tipo
    if (tipo === "radio") {
        const radios = document.querySelectorAll(`input[name="respuesta_${pregunta.idPreguntaTerman}"]`);
        radios.forEach(radio => {
            radio.addEventListener('change', () => {
                btnSiguiente.disabled = false;
                error.textContent = '';
            });
        });

        btnSiguiente.addEventListener('click', () => {
            const seleccionado = document.querySelector(`input[name="respuesta_${pregunta.idPreguntaTerman}"]:checked`);
            if (!seleccionado) {
                error.textContent = 'Selecciona una opción o usa "No contestar".';
                return;
            }
            procesar(seleccionado.value);
        });

    } else if (tipo === "checkbox") {
        const maxSelections = 2;
        const checkboxes = document.querySelectorAll(`input[name="respuesta_${pregunta.idPreguntaTerman}"]`);

        checkboxes.forEach(cb => {
            cb.addEventListener('change', () => {
                const seleccionados = document.querySelectorAll(`input[name="respuesta_${pregunta.idPreguntaTerman}"]:checked`);
                if (seleccionados.length > maxSelections) {
                    cb.checked = false;
                    error.textContent = `Máximo ${maxSelections} opciones.`;
                } else {
                    btnSiguiente.disabled = !(seleccionados.length === maxSelections);
                    error.textContent = '';
                }
            });
        });

        btnSiguiente.addEventListener('click', () => {
            const seleccionados = document.querySelectorAll(`input[name="respuesta_${pregunta.idPreguntaTerman}"]:checked`);
            if (seleccionados.length !== maxSelections) {
                error.textContent = `Selecciona exactamente ${maxSelections} opciones.`;
                return;
            }
        
            const opciones = Array.from(seleccionados).map(cb => cb.value);
            procesarMultiple(opciones);
        });
        

    } else if (tipo === "text") {
        const input = document.getElementById('respuestaTexto');
        input.addEventListener('input', () => {
            btnSiguiente.disabled = input.value.trim().length === 0;
            error.textContent = '';
        });

        btnSiguiente.addEventListener('click', () => {
            const val = input.value.trim();
            if (!val) {
                error.textContent = 'Ingresa una respuesta o selecciona "No contestar".';
                return;
            }
            procesar(val);
        });

    } else if (tipo === "doubleText") {
        const a = document.getElementById('respuestaTextoA');
        const b = document.getElementById('respuestaTextoB');

        [a, b].forEach(el => el.addEventListener('input', () => {
            btnSiguiente.disabled = !(a.value.trim() && b.value.trim());
            error.textContent = '';
        }));

        btnSiguiente.addEventListener('click', () => {
            if (!a.value.trim() || !b.value.trim()) {
                error.textContent = 'Debes llenar ambos campos.';
                return;
            }
            procesar(`${a.value.trim()} - ${b.value.trim()}`);
        });
    }

    // Omitir
    btnNoContestar.addEventListener('click', () => {
        const valorOmitido = (tipo === "doubleText") ? '0 - 0' : 0;
        procesar(valorOmitido);
    });
}

// ----------------------------------
// EVENTOS INICIALES AL CARGAR LA VISTA
// ----------------------------------
document.getElementById('iniciar-prueba').addEventListener('click', () => {
    document.getElementById('advertencia-inicial').style.display = 'none';
    document.getElementById('contenedor-serie').style.display = 'block';
    
    activarBloqueoDeSalida();     
    prevenirBotonAtras();       
    
    traerSerie(serieActual);
});
document.getElementById('volver-prueba').addEventListener('click', () => {
    window.history.back();
});
document.getElementById('siguiente-serie') &&
document.getElementById('siguiente-serie').addEventListener('click', () => {
    const respuestas = []; 
    enviarRespuestas(respuestas)
        .then(() => {
            serieActual++;
            if (serieActual <= totalSeries) {
                traerSerie(serieActual);
            } else {
                desactivarBloqueoDeSalida();
                permitirBotonAtras();
                setTimeout(() => {
                    alert("¡Has terminado la prueba!");
                    window.location.href = "/aspirante/misPruebas";
                }, 100);
            } 
        })
        .catch(error => {
            console.error("Error al enviar respuestas:", error);
            alert("Hubo un error al guardar tus respuestas.");
        });
});