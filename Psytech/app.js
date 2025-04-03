const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');

const app = express();

// Configuracion de sesiones
app.use(session({
    secret: 'claveTemporal',
    resave: false,
    saveUninitialized: true
}));

// Servir archivos estaticos desde public
app.use(express.static(path.join(__dirname, 'public')));

// Configuracion de EJS como motor de vistas
app.set('view engine', 'ejs');
app.set('views', 'views');

// Middleware para procesar datos del formulario
app.use(bodyParser.urlencoded({ extended: false }));

// Middleware para procesar JSON
app.use(express.json());

const multer = require('multer');

const fileStorage = multer.diskStorage({
    destination: (request, file, callback) => {
        callback(null, 'public/expedientes');
    },
    filename: (request, file, callback) => {
        callback(null, file.originalname + new Date().toISOString().substring(0, 10));
    },
});

//app.use(multer({ storage: fileStorage }).single('cv'));
//app.use(multer({ storage: fileStorage }).single('kardex'));
const upload = multer({ storage: fileStorage });

app.use(upload.fields([
    { name: 'cv', maxCount: 1 },
    { name: 'kardex', maxCount: 1 }
]));

// Importar rutas
const rutasInicioSesion = require('./routes/inicioSesion.routes');
app.use('/', rutasInicioSesion);

const rutasCoordinador = require('./routes/coordinador.routes');
app.use('/coordinador', rutasCoordinador);

const rutasAspirante = require('./routes/aspirante.routes');
app.use('/aspirante', rutasAspirante);

const rutasPsicologo = require('./routes/psicologo.routes');
app.use('/psicologo', rutasPsicologo);

// Iniciar servidor en el puerto 5050
app.listen(5050, () => {
    console.log("Servidor corriendo en http://localhost:5050");
});
