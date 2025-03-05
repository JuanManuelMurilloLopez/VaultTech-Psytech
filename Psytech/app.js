const express = require('express');
const app = express();

const path = require('path');

const rutasInicioSesion = require('./routes/inicioSesion.routes');
app.use('/', rutasInicioSesion);

const rutasCoordinador = require('./routes/coordinador.routes');
app.use('/coordinador', rutasCoordinador);

const rutasAspirante = require('./routes/aspirante.routes');
app.use('/aspirante', rutasAspirante);

const rutasPsicologo = require('./routes/psicologo.routes');
app.use('/psicologo', rutasPsicologo);

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');
app.set('views', 'views');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));

app.listen(5050);