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
let enviando = false;

const container = document.getElementById("colorContainer");
const terminarBtn = document.getElementById("terminarBtn");
const modalElement = document.getElementById("segundaRondaModal");

terminarBtn.classList.add("d-none");

function mostrarColores() {
  container.innerHTML = "";
  if (ronda === 1) {
    seleccionados = [];
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

  if (ronda === 1 && seleccionados.length === 8) {
    ronda = 2;
    const modal = new bootstrap.Modal(modalElement);
    modal.show();
  }

  if (ronda === 2 && seleccionados.length === 16) {
    verificarFinalizar();
  }
}

function verificarFinalizar() {
  terminarBtn.classList.remove("d-none");
}

modalElement.addEventListener("hidden.bs.modal", () => {
  if (ronda === 2) {
    mostrarColores();
  }
});

terminarBtn.addEventListener("click", async (e) => {
  e.preventDefault();

  if (enviando) return;
  enviando = true;

  if (ronda !== 2 || seleccionados.length < 16) {
      alert("Debes seleccionar todos los colores de ambas rondas.");
      enviando = false;
      return;
  }

  const selecciones = seleccionados.map((idColor, index) => {
      return {
          idColor,
          posicion: index % 8,
          fase: index < 8 ? 1 : 2
      };
  });


  console.log("Datos que se están enviando:", selecciones); 

  try {
      const response = await fetch("/aspirante/guardar-selecciones-colores", {
          method: "POST",
          headers: {
              "Content-Type": "application/json" 
          },
          body: JSON.stringify({ selecciones })
      });

      
      console.log("Código de estado:", response.status);

      // Leer respuesta como JSON
      const responseText = await response.text();
      console.log("Respuesta completa:", responseText);
      
      let resultado;
      try {
          resultado = JSON.parse(responseText);
      } catch (e) {
          console.error("La respuesta no es JSON válido:", e);
          resultado = { error: "Respuesta del servidor no válida" };
      }

      if (response.ok) {
          alert("¡Selecciones guardadas correctamente!");
          window.location.href = "/aspirante/prueba-completada";
      } else {
          alert("Error: " + (resultado.error || "Error desconocido al guardar"));
          enviando = false;
      }
  } catch (err) {
      console.error("Error en la petición fetch:", err);
      alert("Error al comunicarse con el servidor");
      enviando = false;
  }
});


mostrarColores();