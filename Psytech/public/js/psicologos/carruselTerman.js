document.addEventListener('DOMContentLoaded', () => {
    const contenedor = document.getElementById('contenedor-carrusel');
    const idAspirante = contenedor.dataset.idAspirante;
    const idGrupo = contenedor.dataset.idGrupo;
    const nombreCompleto = contenedor.dataset.nombreCompleto;
    const estatusPrueba = contenedor.dataset.estatusPrueba;

    cargarCarrusel(idAspirante, idGrupo);

    document.getElementById('generarPDF').addEventListener('click', () => {
        descargarTodoPDF(nombreCompleto, estatusPrueba);
    });
    });

    async function cargarCarrusel(idAspirante, idGrupo) {
        const carrusel = document.getElementById('carrusel-series');
        carrusel.innerHTML = '';
    
        const series = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const nombresSeries = [ "Información y conocimientos.", 
                                "Comprensión.", 
                                "Significados verbales.", 
                                "Selección lógica.", 
                                "Aritmética.", 
                                "Juicio práctico.",
                                "Analogías.",
                                "Ordenamiento de frases.",
                                "Clasificación.",
                                "Seriación."
                            ];
    
        for (const idSerie of series) {
            try {
                const respuesta = await fetch(`/psicologa/consultaAspirantes/${idAspirante}/${idGrupo}/serie/${idSerie}`);
                const data = await respuesta.json();
    
                if (data.success) {
                    const divSerie = document.createElement('div');
                    divSerie.classList.add('box', 'mb-5', 'serie-container');
    
                    const titulo = document.createElement('h3');
                    titulo.classList.add('title', 'is-4', 'has-text-centered');
                    titulo.textContent = `Serie ${idSerie}: ${nombresSeries[idSerie - 1]}`;
    
                    const tabla = document.createElement('table');
                    tabla.classList.add('table', 'is-bordered', 'is-striped', 'is-hoverable', 'is-fullwidth');
    
                    const thead = document.createElement('thead');
                    thead.innerHTML = `
                        <tr>
                            <th>No.</th>
                            <th>Pregunta</th>
                            <th>Respuesta</th>
                            <th>Tiempo (s)</th>
                        </tr>
                    `;
    
                    const tbody = document.createElement('tbody');
                    data.respuestas.forEach(respuesta => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = `
                            <td>${respuesta.numeroPregunta}</td>
                            <td>${respuesta.preguntaTerman}</td>
                            <td>${respuesta.respuestaAspirante}</td>
                            <td>${respuesta.tiempoRespuesta}</td>
                        `;
                        tbody.appendChild(tr);
                    });
    
                    tabla.appendChild(thead);
                    tabla.appendChild(tbody);
    
                    divSerie.appendChild(titulo);
                    divSerie.appendChild(tabla);
    
                    carrusel.appendChild(divSerie);
                }
            } catch (error) {
                console.error("Error al cargar serie:", idSerie, error);
            }
        }
    }
    

    async function descargarTodoPDF(nombreCompleto, estatusPrueba) {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF('p', 'pt', 'a4');
    
        const nombreArchivo = `Respuestas_Terman_${nombreCompleto.replace(/\s+/g, '_')}.pdf`;
    
        const series = document.querySelectorAll('.serie-container');
    
        for (let i = 0; i < series.length; i++) {
            if (i !== 0) doc.addPage();
    
            const tituloSerie = series[i].querySelector('h3').innerText;
            const tabla = series[i].querySelector('table');
    
            // Agrega título general
            doc.setFontSize(16);
            doc.text("Test de Aptitud Mental - Terman", 40, 40);
    
            doc.setFontSize(12);
            doc.text(nombreCompleto, 40, 60);

            doc.setFontSize(12);
            doc.text(`Estatus de la prueba: ${estatusPrueba}`, 40, 80);
    
            // Agrega título de la serie (un poco más abajo)
            doc.setFontSize(14);
            doc.text(tituloSerie, 40, 105);
    
            // Extraemos las filas de la tabla
            const rows = [];
            tabla.querySelectorAll('tbody tr').forEach(tr => {
                const row = [];
                tr.querySelectorAll('td').forEach(td => {
                    row.push(td.innerText.trim());
                });
                rows.push(row);
            });
    
            // Agrega tabla
            doc.autoTable({
                startY: 120, // Dejamos espacio para títulos
                head: [[
                    "ID Pregunta",
                    "Pregunta",
                    "Respuesta",
                    "Tiempo (segundos)"
                ]],
                body: rows,
                theme: 'striped',
                headStyles: { fillColor: [41, 128, 185] },
                margin: { top: 40, bottom: 40 },
                styles: {
                    fontSize: 8,
                    cellPadding: 3,
                }
            });
        }
    
        doc.save(nombreArchivo);
    }
    