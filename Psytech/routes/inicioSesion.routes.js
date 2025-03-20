const express = require('express');
const router = express.Router();

const controller = require('../controllers/inicioSesion.controller');

//Rutas para el inció de sesión

router.get('/login', controller.get_login);

router.post('/login', controller.post_login);

module.exports = router;