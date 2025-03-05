const express = require('express');
const app = express();

const path = require('path');

const rutasInicioSesion = require('./routes/routes-inicioSesion');
app.use('/', rutasInicioSesion);

const rutasCoordinador = require('./routes/routes-coordinador');
app.use('/coordinador', rutasCoordinador);

const rutasAspirante = require('./routes/routes-aspirante');
app.use('/aspirante', rutasAspirante);

const rutasPsicologo = require('./routes/routes-psicologo');
app.use('/psicologo', rutasPsicologo);

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');
app.set('views', 'views');

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));

app.listen(5050);