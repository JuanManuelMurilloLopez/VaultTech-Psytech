const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const dotenv = require("dotenv");
const helmet = require("helmet");
const compression = require("compression");
const https = require("https");
const fs = require("fs");



dotenv.config();

const app = express();

// Configuracion de sesiones
app.use(session({
    secret: 'claveTemporal',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false } 
}));

app.use(helmet());
app.use(compression());

const certificate = fs.readFileSync("../../certs/server.cert");
const privateKey = fs.readFileSync("../../certs/server.key");

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
        callback(null,request.session.idAspirante + new Date().getMilliseconds()  + file.originalname);
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

https.createServer({key: privateKey, cert: certificate, passphrase: process.env.SSL_PASSPHRASE}, app).listen(process.env.PORT || 5050);

//https.createServer({key: privateKey, cert: certificate}, app).listen(process.env.PORT || 5050);

// Iniciar servidor en el puerto 5050
//app.listen(5050, () => {
//    console.log("Servidor corriendo en http://localhost:5050");
//});
