const express = require('express');
const router = express.Router();

const controller = require('../controllers/inicioSesion.controller');

//Rutas para el inció de sesión

router.get('/', controller.getInicio);

router.get('/login', controller.getLogin);

router.post('/login', controller.getPost);

router.get('/otp', controller.getOtp);

router.post('/reenviar-otp', controller.reenviarOtp);

router.post('/otp', controller.verificarOTP);

router.get('/logout', controller.getLogout);

module.exports = router;