//controlador
const letras = [
    "G",
    "L",
    "I",
    "T",
    "V",
    "S",
    "R",
    "D",
    "C",
    "E",
    "W",
    "F",
    "K",
    "Z",
    "O",
    "B",
    "X",
    "P",
    "A",
    "N",
  ];

  const m = [
    // G
    [[1, 11, 21, 31, 41, 51, 61, 71, 81], []],
    // L
    [[12, 22, 32, 42, 52, 62, 72, 82], [81]],
    // I
    [
      [23, 33, 43, 53, 63, 73, 83],
      [82, 71],
    ],
    // T
    [
      [34, 44, 54, 64, 74, 84],
      [83, 72, 61],
    ],
    // V
    [
      [45, 55, 65, 75, 85],
      [84, 73, 62, 51],
    ],
    // S
    [
      [56, 66, 76, 86],
      [85, 74, 63, 52, 41],
    ],
    // R
    [
      [67, 77, 87],
      [86, 75, 64, 53, 42, 31],
    ],
    // D
    [
      [78, 88],
      [87, 76, 65, 54, 43, 32, 21],
    ],
    // C
    [[89], [88, 77, 66, 55, 44, 33, 22, 11]],
    // E
    [[], [89, 78, 67, 56, 45, 34, 23, 12, 1]],
    // W
    [[90, 80, 70, 60, 50, 40, 30, 20, 10], []],
    // F
    [[79, 69, 59, 49, 39, 29, 19, 9], [10]],
    // K
    [
      [68, 58, 48, 38, 28, 18, 8],
      [9, 20],
    ],
    // Z
    [
      [57, 47, 37, 27, 17, 7],
      [8, 19, 30],
    ],
    // O
    [
      [46, 36, 26, 16, 6],
      [7, 18, 29, 40],
    ],
    // B
    [
      [35, 25, 15, 5],
      [6, 17, 28, 39, 50],
    ],
    // X
    [
      [24, 14, 4],
      [5, 16, 27, 38, 49, 60],
    ],
    // P
    [
      [13, 3],
      [4, 15, 26, 37, 48, 59, 70],
    ],
    // A
    [[2], [3, 14, 25, 36, 47, 58, 69, 80]],
    // N
    [[], [2, 13, 24, 35, 46, 57, 68, 79, 90]],
  ];

  let suma = new Array(m.length).fill(0);

  try {
    //Calificar

    const promesas = [];

    let pregunta = 0;
    const size = m.length;

    for (let l = 0; l < size; l++) {
      for (let o = 0; o <= 1; o++) {
        let opcion = "a";
        if (o === 0) {
          opcion = "a";
        } else {
          opcion = "b";
        }
        for (let p = 0; p < m[l][o].length; p++) {
          pregunta = m[l][o][p];
          const letra = l;
          promesas.push(
            RespondeKostick.fetchRespuesta(
              request.session.grupo,
              request.session.idUsuario.idUsuario,
              pregunta
            )
              .then((respuesta) => {
                console.log("Opción Kostick: ", respuesta[0][0].opcionKostick);
                console.log("Opción: ", opcion);
                if (respuesta[0][0].opcionKostick === opcion) {
                  suma[letra]++;
                }
              })
              .catch((err) => {
                console.error(`Error en pregunta ${pregunta}:`, err);
              })
          );
        }
      }
    }
    await Promise.all(promesas);

    for (let i = 0; i < letras.length; i++) {
      console.log(letras[i] + ": " + suma[i]);
    }
  } catch (err) {
    console.error("Error general:", err);
    response.status(500).send("Ocurrió un error al calificar la prueba");
  }

  const mis_resultadosKostick = new ResultadosKostick(
    request.session.grupo,
    request.session.idUsuario.idUsuario,
    suma[0],
    suma[1],
    suma[2],
    suma[3],
    suma[4],
    suma[5],
    suma[6],
    suma[7],
    suma[8],
    suma[9],
    suma[10],
    suma[11],
    suma[12],
    suma[13],
    suma[14],
    suma[15],
    suma[16],
    suma[17],
    suma[18],
    suma[19]
  );
  mis_resultadosKostick.save().then(() => {
    //cargan su vista y lo que ocupe su vista
  })

