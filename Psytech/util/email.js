const { Resend } = require('resend');
const resend = new Resend(process.env.RESEND_API_KEY);

exports.sendEmail = async (to, subject, text, html) => {
    if (process.env.NODE_ENV === 'develop') {
        return;
    }
    const response = await resend.emails.send({
        from: 'psytech@pruebas.psicodx.com',
        to: to,
        subject: subject,
        text: text,
        html: html
    });
    return response;
};