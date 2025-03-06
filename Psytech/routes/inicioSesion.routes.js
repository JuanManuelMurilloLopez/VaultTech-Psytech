const express = require('express');
const router = express.Router();

const controller = require('../controllers/inicioSesion.controller');

//Rutas para el inció de sesión

router.get('/login', controller.get_login);

module.exports = router;