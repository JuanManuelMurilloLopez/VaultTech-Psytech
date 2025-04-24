document.addEventListener('DOMContentLoaded', () => {
    const selects = document.querySelectorAll('select');
    const errorMessage = document.getElementById('error-message');
    const submitButton = document.getElementById('submit-button');
    const form = document.getElementById('hartman-form');
    
    /*
    * Resalta las opciones ya contestadas
    */   
  
    selects.forEach((select) => {
      if (select.value) {
        const questionBox = select.closest('.question-box');
        if (questionBox) {
          questionBox.classList.add('is-selected');
        }
      }
    });
    
    /*
    * Checa por duplicados
    */
    checkForDuplicates();
    
    /*
    * Evento para todos los seleccionados 
    */
  
    selects.forEach((select) => {
      select.addEventListener('change', (event) => {
        const selectedValue = event.target.value;
        const questionBox = event.target.closest('.question-box');
        
        if (questionBox) {
          if (selectedValue) {
            questionBox.classList.add('is-selected');
          } else {
            questionBox.classList.remove('is-selected');
          }
        }
        
        checkForDuplicates();
      });
    });
    
    /*
    * Funcion de duplicados
    */
    function checkForDuplicates() {
      const selectionCounts = {};
      let hasDuplicates = false;
    
      // Quita estilos anteriores
      document.querySelectorAll('.question-box').forEach(box => {
        box.classList.remove('has-duplicate');
      });
    
      // Verifica duplicados
      selects.forEach((select) => {
        const value = select.value;
        if (value) {
          if (!selectionCounts[value]) {
            selectionCounts[value] = [select];
          } else {
            hasDuplicates = true;
            selectionCounts[value].push(select);
          }
        }
      });
    
      // Aplica clases visuales a duplicados
      for (const selects of Object.values(selectionCounts)) {
        if (selects.length > 1) {
          selects.forEach(select => {
            const box = select.closest('.question-box');
            if (box) box.classList.add('has-duplicate');
          });
        }
      }
    
      // Muestra u oculta el mensaje de error
      if (hasDuplicates) {
        errorMessage.classList.remove('d-none');
        if (submitButton) submitButton.disabled = true;
      } else {
        errorMessage.classList.add('d-none');
        if (submitButton) submitButton.disabled = false;
      }
    }    
    
    // Validacion
    form.addEventListener('submit', (event) => {
      const selectionValues = Array.from(selects).map(select => select.value).filter(value => value);
      const uniqueValues = new Set(selectionValues);
      
      // Evita que haya duplicados
      if (selectionValues.length !== uniqueValues.size) {
        event.preventDefault();
        checkForDuplicates();
        errorMessage.classList.remove('d-none');
        
        // Scroll to the error message
        errorMessage.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });