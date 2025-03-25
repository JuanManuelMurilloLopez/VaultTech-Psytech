const preguntasCj = document.querySelector(".preguntasCaja");
const contadorTiempo = preguntasCj.querySelector(".Temporizador .tiempoNumeroSec");
const respEnviadas = document.querySelector(".enviadasCaja");

//Llamar a la función para cargar las preguntas
cargarPreguntas();

let pregAcum = 0;
let pregNum = 1;
let contTiempo;
let valorTemporizador = 1800; //Segundos de 30 min

document.body.addEventListener("click", (event) => {
    if (event.target.classList.contains("btnDatosContinuar")) {
        const datosCj = document.querySelector(".datosCaja");
        const preguntasCj = document.querySelector(".preguntasCaja");

        if (datosCj) datosCj.classList.remove("activeInfo");
        if (preguntasCj) preguntasCj.classList.add("activeQuiz");
        ensenarPregunta(0);
        pregContador(1);
        empezarTemporizador(valorTemporizador);
    }
    
});

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
    if (event.target.classList.contains("antbtn")){
        if(pregAcum > 0){
            pregAcum--;
            pregNum--;
            ensenarPregunta(pregAcum);
            pregContador(pregNum);
        } else {
            console.log("Pregunta anicial");
        }
    }
});

let preguntas = []; //Arreglo para poder tener las preguntas

async function cargarPreguntas() {
    try {
        const response = await fetch('/aspirante/prueba-otis', { method: 'POST' });//Llamar al post
        const data = await response.json();
        preguntas = data.preguntas; // Almacenar las preguntas

        if (preguntas.length > 0) {
            ensenarPregunta(0); // Muestra cada pregunta con la funcion de ensenarPregunta
        } else {
            console.log("No se encontraron preguntas.");
        }
    } catch (error) {
        console.error("Error al cargar las preguntas:", error);
    }
}

//Función para enseñar cada pregunta junto con su número
function ensenarPregunta(index){
    const pregTexto = document.querySelector(".pregtext");
    const optLista = document.querySelector(".optionList");

    let pregTag = '<span>'+preguntas[index].num+ ". " +preguntas[index].pregunta+ '</span>';
    let optTag = "";

    for (let i = 0; i < preguntas[index].opciones.length; i++) {
        optTag += `<div class="option">
                <input type="radio" name="pregunta${index}" value="${preguntas[index].opciones[i]}">
                <span>${preguntas[index].opciones[i]}</span>
            </div>`;
    }

    pregTexto.innerHTML = pregTag;
    optLista.innerHTML = optTag;

    const opcionSelec = optLista.querySelectorAll(".option");

    for (let i= 0; i < opcionSelec.length; i++){
        opcionSelec[i].setAttribute("onclick", "optionSelected(this)");
    }
    
}

//Función para poder seleccionar respuesta
function optionSelected(respuesta){
    let aspiranteResp = respuesta.querySelector('input').value;
    let respCorrecta = preguntas[pregAcum].respuesta;
    if(aspiranteResp == respCorrecta){
        console.log("la respuesta es correcta");
    } else {
        console.log("la respuesta es incorrecta");
    }

}

//Tener un contador de en que pregunta vas (progreso)
function pregContador(index){
    const progresoAcum = preguntasCj.querySelector(".pregProgreso");
    let progresoTexto = '<span style="display: inline;">' + index + ' de ' + preguntas.length + ' Preguntas</span>';
    progresoAcum.innerHTML = progresoTexto; 
}
