require('dotenv').config(); 
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL,  
    pass: process.env.EMAIL_PASS 
  }
});

const enviarCorreo = async (destinatario, asunto, mensaje) => {
  try {
    await transporter.sendMail({
      from: process.env.EMAIL,
      to: destinatario,
      subject: asunto,
      text: mensaje
    });
    console.log('Correo enviado exitosamente');
  } catch (error) {
    console.error('Error al enviar el correo:', error);
  }
};

// Exportar como un objeto
module.exports = {
  enviarCorreo
};
