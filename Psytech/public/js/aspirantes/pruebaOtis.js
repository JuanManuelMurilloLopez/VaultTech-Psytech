const preguntasCj = document.querySelector(".preguntasCaja");
const contadorTiempo = preguntasCj.querySelector(".Temporizador .tiempoNumeroSec");
const respEnviadas = document.querySelector(".enviadasCaja");

//Llamar a la función para cargar las preguntas
cargarPreguntas();

let pregAcum = 0;
let pregNum = 1;
let contTiempo;
let valorTemporizador = 1800; //Segundos de 30 min

//Función del temporizador
function empezarTemporizador(tiempo){
    contTiempo = setInterval(timer, 1000);
    function timer(){
        let minutos = Math.floor(tiempo / 60);
        let segundos = tiempo % 60;

        minutos = minutos < 10 ? "0" + minutos : minutos;
        segundos = segundos < 10 ? "0" + segundos : segundos;

        contadorTiempo.textContent = `${minutos}:${segundos}`;

        tiempo --;

        if (tiempo < 0){
            clearInterval(contTiempo);
            contadorTiempo.textContent = "00:00";
        }
    }
}

//Tener un tope para no llegar a preguntas en negativo o de más
document.body.addEventListener("click", (event) => {
    if (event.target.classList.contains("sigbtn")){
        if(pregAcum < preguntas.length -1){
            pregAcum++;
            pregNum++;
            ensenarPregunta(pregAcum);
            pregContador(pregNum);
        } else {
            console.log("Preguntas completadas");
        }
    }
});

let preguntas = []; //Arreglo para poder tener las preguntas

async function cargarPreguntas() {
    try {
        const response = await fetch('/aspirante/prueba-otis', { method: 'POST' });
        const data = await response.json();
        preguntas = data.preguntas;

        // Verificar que las preguntas tengan opciones
        if (preguntas.length > 0) {
            ensenarPregunta(0); // Mostrar la primera pregunta
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

    // Mostrar la pregunta
    let pregTag = `<span>${pregunta.num}. ${pregunta.pregunta}</span>`;
    pregTexto.innerHTML = pregTag;

    // Mostrar las opciones
    let optTag = "";
    if (pregunta.opciones && pregunta.opciones.length > 0) {
        pregunta.opciones.forEach(opcion => {
            optTag += `<div class="option">
                <input type="radio" name="pregunta${index}" value="${opcion.descripcionOpcion}">
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
        opcionSelec[i].setAttribute("onclick", "optionSelected(this)");
    }
}

// Función que se llama cuando se selecciona una opción
function optionSelected(idPregunta, idOpcion) {
    // Obtener el tiempo actual en segundos
    const tiempoRespuesta = Math.floor(Date.now() / 1000); // Puedes usar esto para almacenar el tiempo de respuesta en segundos

    // Buscar si la pregunta ya tiene una respuesta registrada
    let respuesta = respuestasSeleccionadas.find(r => r.idPregunta === idPregunta);

    // Si ya existe la respuesta, actualizarla. Si no, agregarla.
    if (respuesta) {
        respuesta.idOpcion = idOpcion;
        respuesta.tiempoRespuesta = tiempoRespuesta;
    } else {
        respuestasSeleccionadas.push({
            idPregunta: idPregunta,
            idOpcion: idOpcion,
            tiempoRespuesta: tiempoRespuesta
        });
    }
}



//Tener un contador de en que pregunta vas (progreso)
function pregContador(index){
    const progresoAcum = preguntasCj.querySelector(".pregProgreso");
    if (!progresoAcum) {
        console.error("No se encontró el elemento con clase .pregProgreso");
        return;
    }
    let progresoTexto = '<span style="display: inline;">' + index + ' de ' + preguntas.length + ' Preguntas</span>';
    progresoAcum.innerHTML = progresoTexto; 
}


let respuestasSeleccionadas = [];

document.querySelector("#enviarRespuestas").addEventListener("click", enviarRespuestas);

// Función para enviar las respuestas seleccionadas
function enviarRespuestas() {
    if (respuestasSeleccionadas.length === 0) {
        console.log("No se seleccionaron respuestas.");
        return;
    }

    // Aquí puedes preparar los datos para enviarlos al backend
    const datosRespuestas = respuestasSeleccionadas.map(respuesta => ({
        idAspirante: 'idAspirante',  // Asegúrate de tener esta información
        idGrupo: 'idGrupo',          // Lo mismo para el grupo
        idPrueba: 5,                 // ID de la prueba
        idPreguntaOtis: respuesta.idPregunta,
        idOpcionOtis: respuesta.idOpcion,
        tiempoRespuesta: respuesta.tiempoRespuesta
    }));

    // Enviar las respuestas al servidor (usando fetch o cualquier otro método)
    fetch('/aspirante/guardar-selecciones-otis', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(datosRespuestas)
    })
    .then(response => response.json())
    .then(data => {
        console.log('Respuestas enviadas con éxito:', data);
        // Aquí puedes redirigir o mostrar un mensaje de éxito
    })
    .catch(error => {
        console.error('Error al enviar las respuestas:', error);
    });
}

