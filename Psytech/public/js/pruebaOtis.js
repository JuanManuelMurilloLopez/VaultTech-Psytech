const preguntasCj = document.querySelector(".preguntasCaja");

document.body.addEventListener("click", (event) => {
    if (event.target.classList.contains("btnDatosContinuar")) {
        const datosCj = document.querySelector(".datosCaja");
        const preguntasCj = document.querySelector(".preguntasCaja");

        if (datosCj) datosCj.classList.remove("activeInfo");
        if (preguntasCj) preguntasCj.classList.add("activeQuiz");
        ensenarPregunta(0);
        pregContador(1);
    }
    
});


let pregAcum = 0;
let pregNum = 1;


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

function optionSelected(respuesta){
    let aspiranteResp = respuesta.querySelector('input').value;
    let respCorrecta = preguntas[pregAcum].respuesta;
    if(aspiranteResp == respCorrecta){
        console.log("la respuesta es correcta");
    } else {
        console.log("la respuesta es incorrecta");
    }

}


function pregContador(index){
    const progresoAcum = preguntasCj.querySelector(".pregProgreso");
    let progresoTexto = '<span style="display: inline;">' + index + ' de ' + preguntas.length + ' Preguntas</span>';
    progresoAcum.innerHTML = progresoTexto; 
}

const contadorTiempo = preguntasCj.querySelector(".tiempoNumeroSec");



