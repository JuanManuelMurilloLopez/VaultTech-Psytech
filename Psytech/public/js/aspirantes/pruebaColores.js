const colores = [
  { idColor: 1, nombre: "Azul", numeroColor: 1, hexColor: "#0F4C81" },
  { idColor: 2, nombre: "Verde", numeroColor: 2, hexColor: "#317F43" },
  { idColor: 3, nombre: "Rojo", numeroColor: 3, hexColor: "#D53032" },
  { idColor: 4, nombre: "Amarillo", numeroColor: 4, hexColor: "#F2BE22" },
  { idColor: 5, nombre: "Violeta", numeroColor: 5, hexColor: "#7D32D6" },
  { idColor: 6, nombre: "Marrón", numeroColor: 6, hexColor: "#6D3F2A" },
  { idColor: 7, nombre: "Negro", numeroColor: 7, hexColor: "#000000" },
  { idColor: 8, nombre: "Gris", numeroColor: 0, hexColor: "#A6A6A6" }
];

let ronda = 1;
let seleccionados = [];
let finalizando = false; // Variable para controlar si se esta en proceso de finalizacion

const container = document.getElementById("colorContainer");
const terminarBtn = document.getElementById("terminarBtn");
const modalElement = document.getElementById("segundaRondaModal");
const finalizarModalElement = document.getElementById("finalizarModal");
const seleccionesContainer = document.getElementById("seleccionesContainer");
const colorSelectionForm = document.getElementById("colorSelectionForm");

terminarBtn.classList.add("d-none");

function mostrarColores() {
  container.innerHTML = "";
  if (ronda === 1) {
    seleccionados = [];
    seleccionesContainer.innerHTML = ""; // Limpiar campos de selecciones anteriores
  }

  const desordenados = [...colores].sort(() => Math.random() - 0.5);

  desordenados.forEach((color, i) => {
    const angle = (i / desordenados.length) * 2 * Math.PI;
    const radius = 200;
    const centerX = 425;
    const centerY = 300;

    const x = centerX + radius * Math.cos(angle) - 55;
    const y = centerY + radius * Math.sin(angle) - 55;

    const wrapper = document.createElement("div");
    wrapper.className = "color-wrapper";
    wrapper.style.left = `${x}px`;
    wrapper.style.top = `${y}px`;

    const label = document.createElement("span");
    label.className = "color-number";
    label.textContent = color.numeroColor;

    const box = document.createElement("div");
    box.className = "color-box";
    box.style.backgroundColor = color.hexColor;
    box.onclick = () => seleccionarColor(color.idColor, wrapper);

    wrapper.appendChild(label);
    wrapper.appendChild(box);
    container.appendChild(wrapper);
  });
}

function seleccionarColor(idColor, wrapperElement) {
  wrapperElement.remove();
  seleccionados.push(idColor);

  // Guardar selecciones en el formulario
  actualizarCamposFormulario();

  if (ronda === 1 && seleccionados.length === 8) {
    ronda = 2;
    const modal = new bootstrap.Modal(modalElement);
    modal.show();
  }

  if (ronda === 2 && seleccionados.length === 16) {
    verificarFinalizar();
  }
}

function actualizarCamposFormulario() {
  // Limpiar contenedor
  seleccionesContainer.innerHTML = "";
  
  // Crear campos con las selecciones
  seleccionados.forEach((idColor, index) => {
    const fase = index < 8 ? 1 : 2;
    const posicion = index % 8;
    
    // Campo para idColor
    const colorInput = document.createElement("input");
    colorInput.type = "hidden";
    colorInput.name = `selecciones[${index}][idColor]`;
    colorInput.value = idColor;
    seleccionesContainer.appendChild(colorInput);
    
    // Campo para fase
    const faseInput = document.createElement("input");
    faseInput.type = "hidden";
    faseInput.name = `selecciones[${index}][fase]`;
    faseInput.value = fase;
    seleccionesContainer.appendChild(faseInput);
    
    // Campo para posición
    const posicionInput = document.createElement("input");
    posicionInput.type = "hidden";
    posicionInput.name = `selecciones[${index}][posicion]`;
    posicionInput.value = posicion;
    seleccionesContainer.appendChild(posicionInput);
  });
}

function verificarFinalizar() {
  // En vez de mostrar boton, mostrar modal de finalizar
  const modal = new bootstrap.Modal(finalizarModalElement);
  modal.show();
}

// Event listeners para los modals
modalElement.addEventListener("hidden.bs.modal", () => {
  if (ronda === 2) {
    mostrarColores();
  }
});

// Agregar evento al boton dentro del modal de finalizar
document.getElementById("submitPruebaBtn").addEventListener("click", () => {
  // Marcar que se esta finalizando para evitar el warning de beforeunload
  finalizando = true;
  
  // Marcar el formulario como en envio
  colorSelectionForm.setAttribute('data-submitting', 'true');
  
  // Enviar el formulario
  colorSelectionForm.submit();
});

// Iniciar prueba
mostrarColores();

// Modificar el script de beforeunload en el ejs
window.addEventListener('beforeunload', function(e) {
  // No mostrar warning si se termna desde el modal
  if (finalizando) {
    return;
  }
  
  // No interrumpir cuando se envia el formulario
  if (document.querySelector('#colorSelectionForm').getAttribute('data-submitting') === 'true') {
    return;
  }
  
  // Si la prueba esta en progreso (hay selecciones) mostrar warning
  if (seleccionados && seleccionados.length > 0) {
    const message = "¿Está seguro que desea salir? Su progreso en la prueba se perderá.";
    e.returnValue = message;
    return message;
  }
});