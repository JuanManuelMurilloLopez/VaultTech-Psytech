const express = require('express');
const router = express.Router();

const controller = require('../controllers/controller-inicioSesion');

//Rutas para el inció de sesión

router.get('/login', controller.get_login);

module.exports = router;