const preguntasCj = document.querySelector(".preguntasCaja");
const contadorTiempo = preguntasCj.querySelector(".Temporizador .tiempoNumeroSec");
const respEnviadas = document.querySelector(".enviadasCaja");
const enviarRespuestas = document.querySelector("#enviarRespuestas"); 

let pregAcum = 0;
let pregNum = 1;
let contTiempo;
let valorTemporizador = 1800; //Segundos de 30 min
let tiempoInicioPregunta = null;

// Llamar a la funciónes
cargarPreguntas();
empezarTemporizador(valorTemporizador);

// Función del temporizador
function empezarTemporizador(tiempo) {
    contTiempo = setInterval(timer, 1000);
    function timer() {
        let minutos = Math.floor(tiempo / 60);
        let segundos = tiempo % 60;

        minutos = minutos < 10 ? "0" + minutos : minutos;
        segundos = segundos < 10 ? "0" + segundos : segundos;

        contadorTiempo.textContent = `${minutos}:${segundos}`;

        tiempo--;

        if (tiempo < 0) {
            clearInterval(contTiempo);
            contadorTiempo.textContent = "00:00";
        }
    }
    if (tiempo < 0) {
        clearInterval(contTiempo);
        contadorTiempo.textContent = "00:00";
    
        // Enviar las respuestas automáticamente
        sendRespuestas().then(() => {
            // Redirigir después de enviar
            window.location.href = "/prueba-completada";
        });
    }
    
}

// Tener un tope para no llegar a preguntas de más
document.body.addEventListener("click", (event) => {
    if (event.target.classList.contains("sigbtn")) {
        const opciones = document.querySelectorAll(".option input:checked");

        if (opciones.length === 0) {
            alert("Selecciona una opción antes de continuar.");
            return;
        }

        const inputSeleccionado = opciones[0];
        const idOpcion = inputSeleccionado.value;
        const idPregunta = inputSeleccionado.closest(".option").getAttribute("data-idPregunta");

        const tiempoActual = Date.now();
        const tiempoRespuesta = Math.floor((tiempoActual - tiempoInicioPregunta) / 1000); // segundos

        // Buscar si ya existe y actualizar o agregar
        let respuesta = respuestasSeleccionadas.find(r => r.idPreguntaOtis === idPregunta);
        if (respuesta) {
            respuesta.idOpcion = idOpcion;
            respuesta.tiempoRespuesta = tiempoRespuesta;
        } else {
            respuestasSeleccionadas.push({
                idPreguntaOtis: idPregunta,
                idOpcion: idOpcion,
                tiempoRespuesta: tiempoRespuesta
            });
        }

        if (pregAcum < preguntas.length - 1) {
            pregAcum++;
            pregNum++;
            ensenarPregunta(pregAcum);
            pregContador(pregNum);
            verificarMostrarBoton();  // Verificar si mostrar el botón de enviar
        } else {
            console.log("Preguntas completadas");
        }
    }
});

// Función para verificar si mostrar el botón de enviar respuestas
function verificarMostrarBoton() {
    if (pregNum === 5) {  
        enviarRespuestas.classList.remove("d-none");
    }
}

let preguntas = []; // Arreglo para poder tener las preguntas

// Función para cargar las preguntas desde la base de datos
async function cargarPreguntas() {
    try {
        const response = await fetch('/aspirante/prueba-otis', { method: 'POST' });
        const data = await response.json();
        preguntas = data.preguntas;

        if (preguntas.length > 0) {
            ensenarPregunta(0);
            pregContador(1);
        } else {
            console.log("No se encontraron preguntas.");
        }
    } catch (error) {
        console.error("Error al cargar las preguntas:", error);
    }
}

// Función para enseñar cada pregunta junto con su número
function ensenarPregunta(index) {
    const pregTexto = document.querySelector(".pregtext");
    const optLista = document.querySelector(".optionList");

    const pregunta = preguntas[index];

    tiempoInicioPregunta = Date.now();

    // Mostrar la pregunta
    let pregTag = `<span>${pregunta.num}. ${pregunta.pregunta}</span>`;
    pregTexto.innerHTML = pregTag;

    // Mostrar las opciones
    let optTag = "";
    if (pregunta.opciones && pregunta.opciones.length > 0) {
        pregunta.opciones.forEach(opcion => {
            optTag += `<div class="option" data-idPregunta="${pregunta.idPreguntaOtis}">
                <input type="radio" name="pregunta${index}" value="${opcion.idOpcionOtis}">
                <span>${opcion.descripcionOpcion}</span>
            </div>`;
        });
    } else {
        console.log("No se encontraron opciones para esta pregunta.");
    }
    optLista.innerHTML = optTag;

    // Asignar el evento onclick a cada opción
    const opcionSelec = optLista.querySelectorAll(".option");
    for (let i = 0; i < opcionSelec.length; i++) {
        opcionSelec[i].setAttribute("onclick", "opcionSeleccionada(this)");
    }

     // Ocultar el botón de siguiente si es la última pregunta
     const botonSiguiente = document.querySelector(".sigbtn");
     if (index === 5 - 1) {
         botonSiguiente.classList.add("d-none");
     } else {
         botonSiguiente.classList.remove("d-none");
     }
}

// Función cuando se selecciona una opción
function opcionSeleccionada(element) {
    const opciones = document.querySelectorAll(".option");
    opciones.forEach(op => op.classList.remove("selected"));

    element.classList.add("selected");

    const input = element.querySelector('input');
    if (input) {
        input.checked = true;
    }
}

// Tener un contador de en qué pregunta vas (progreso)
function pregContador(index) {
    const progresoAcum = preguntasCj.querySelector(".pregProgreso");
    if (!progresoAcum) {
        console.error("No se encontró el elemento con clase .pregProgreso");
        return;
    }
    let progresoTexto = '<span style="display: inline;">' + index + ' de ' + preguntas.length + ' Preguntas</span>';
    progresoAcum.innerHTML = progresoTexto;
}

let respuestasSeleccionadas = [];

// Ocultar el botón de enviar respuestas inicialmente
enviarRespuestas.classList.add("d-none");

const idAspirante = sessionStorage.getItem('idAspirante');
const idGrupo = sessionStorage.getItem('idGrupo');

function guardarUltimaRespuesta() {
    const opciones = document.querySelectorAll(".option input:checked");

    if (opciones.length === 0) {
        alert("Selecciona una opción antes de enviar.");
        return;
    }

    const inputSeleccionado = opciones[0];
    const idOpcion = inputSeleccionado.value;
    const idPregunta = inputSeleccionado.closest(".option").getAttribute("data-idPregunta");

    const tiempoActual = Date.now();
    const tiempoRespuesta = Math.floor((tiempoActual - tiempoInicioPregunta) / 1000);

    let respuesta = respuestasSeleccionadas.find(r => r.idPreguntaOtis === idPregunta);
    if (respuesta) {
        respuesta.idOpcion = idOpcion;
        respuesta.tiempoRespuesta = tiempoRespuesta;
    } else {
        respuestasSeleccionadas.push({
            idPreguntaOtis: idPregunta,
            idOpcion: idOpcion,
            tiempoRespuesta: tiempoRespuesta
        });
    }
}


// Función para enviar las respuestas seleccionadas
async function sendRespuestas() {
    if (respuestasSeleccionadas.length === 0) {
        console.log("No se seleccionaron respuestas.");
        return;
    }

    const datosRespuestas = respuestasSeleccionadas.map(respuesta => ({
        idAspirante: idAspirante,
        idGrupo: idGrupo,
        idPrueba: 5,
        idPreguntaOtis: respuesta.idPreguntaOtis,
        idOpcionOtis: respuesta.idOpcion,
        tiempoRespuesta: respuesta.tiempoRespuesta
    }));    

    // Enviar las respuestas a la base de datos
    fetch('/aspirante/guardar-selecciones-otis', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(datosRespuestas)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success && data.redirectUrl) {
            window.location.href = data.redirectUrl;
        } else {
            alert('Hubo un problema al enviar las respuestas.');
        }
    })
    .catch(error => {
        console.error('Error al enviar las respuestas:', error);
        alert('Error al enviar las respuestas.');
    });    
}

enviarRespuestas.addEventListener("click", function() {
    const confirmarEnvio = confirm("¿Estás seguro de que deseas enviar tus respuestas? Una vez enviadas, no podrás cambiarlas.");

    if (confirmarEnvio) {
        guardarUltimaRespuesta();
        sendRespuestas();
    }
});

