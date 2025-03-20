const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');

const app = express();

// Configuración de sesiones
app.use(session({
    secret: 'claveTemporal',
    resave: false,
    saveUninitialized: true
}));

// Servir archivos estáticos desde la carpeta public
app.use(express.static(path.join(__dirname, 'public')));

// Configuración de EJS como motor de vistas
app.set('view engine', 'ejs');
app.set('views', 'views');

// Middleware para procesar datos del formulario
app.use(bodyParser.urlencoded({ extended: false }));

// Importar rutas
const rutasInicioSesion = require('./routes/inicioSesion.routes');
app.use('/', rutasInicioSesion);

const rutasCoordinador = require('./routes/coordinador.routes');
app.use('/coordinador', rutasCoordinador);

const rutasAspirante = require('./routes/aspirante.routes');
app.use('/aspirante', rutasAspirante);

const rutasPsicologo = require('./routes/psicologo.routes');
app.use('/psicologo', rutasPsicologo);

//Salir de la sesion
exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('/login');
    });
};

// Iniciar servidor en el puerto 5050
app.listen(5050, () => {
    console.log("Servidor corriendo en http://localhost:5050");
});