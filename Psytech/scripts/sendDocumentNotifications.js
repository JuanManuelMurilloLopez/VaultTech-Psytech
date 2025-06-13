const { Resend } = require('resend');
const db = require('../util/database');
const path = require('path');
const fs = require('fs');
const { getLoginUrl } = require('../util/loginUrl');

class DocumentNotificationService {
  constructor() {
    this.logFile = path.join(__dirname, '../logs/document-notifications.log');
    this.ensureLogDirectory();
    
    // Configurar Resend
    this.resend = new Resend(process.env.RESEND_API_KEY);
  }

  ensureLogDirectory() {
    const logDir = path.dirname(this.logFile);
    if (!fs.existsSync(logDir)) {
      fs.mkdirSync(logDir, { recursive: true });
    }
  }

  log(message) {
    const timestamp = new Date().toISOString();
    const logMessage = `[${timestamp}] ${message}\n`;
    
    console.log(logMessage.trim());
    fs.appendFileSync(this.logFile, logMessage);
  }

  async getAspirantesWithoutDocuments() {
    try {
      const [rows] = await db.execute(`
        SELECT DISTINCT
          u.idUsuario,
          u.nombreUsuario,
          u.apellidoPaterno,
          u.apellidoMaterno,
          u.correo,
          a.idAspirante,
          a.cv,
          a.kardex,
          g.nombreGrupo,
          i.nombreInstitucion,
          DATE(agp.fechaLimite) as fechaLimite
        FROM usuarios u
        INNER JOIN aspirantes a ON u.idUsuario = a.idUsuario
        INNER JOIN gruposaspirantes ga ON a.idAspirante = ga.idAspirante
        INNER JOIN grupos g ON ga.idGrupo = g.idGrupo
        INNER JOIN institucion i ON g.idInstitucion = i.idInstitucion
        INNER JOIN aspirantesgrupospruebas agp ON a.idAspirante = agp.idAspirante AND ga.idGrupo = agp.idGrupo
        WHERE u.estatusUsuario = 1 
        AND g.estatusGrupo = 1
        AND (a.cv IS NULL OR a.kardex IS NULL)
        AND u.idRol = 3
        ORDER BY u.nombreUsuario
      `);
      
      return rows;
    } catch (error) {
      this.log(`Error al consultar aspirantes sin documentos: ${error.message}`);
      throw error;
    }
  }

  async getSpecificAspirante(idAspirante, idGrupo) {
    try {
      const [rows] = await db.execute(`
        SELECT DISTINCT
          u.idUsuario,
          u.nombreUsuario,
          u.apellidoPaterno,
          u.apellidoMaterno,
          u.correo,
          a.idAspirante,
          a.cv,
          a.kardex,
          g.nombreGrupo,
          i.nombreInstitucion,
          DATE(agp.fechaLimite) as fechaLimite
        FROM usuarios u
        INNER JOIN aspirantes a ON u.idUsuario = a.idUsuario
        INNER JOIN gruposaspirantes ga ON a.idAspirante = ga.idAspirante
        INNER JOIN grupos g ON ga.idGrupo = g.idGrupo
        INNER JOIN institucion i ON g.idInstitucion = i.idInstitucion
        INNER JOIN aspirantesgrupospruebas agp ON a.idAspirante = agp.idAspirante AND ga.idGrupo = agp.idGrupo
        WHERE a.idAspirante = ? 
        AND ga.idGrupo = ?
        AND u.estatusUsuario = 1 
        AND (a.cv IS NULL OR a.kardex IS NULL)
      `, [idAspirante, idGrupo]);
      
      return rows[0] || null;
    } catch (error) {
      this.log(`Error al consultar aspirante específico: ${error.message}`);
      throw error;
    }
  }

  createEmailTemplate(aspirante) {
    const documentosFaltantes = [];
    const loginUrl = getLoginUrl(aspirante.correo);
    if (!aspirante.cv) documentosFaltantes.push('CV');
    if (!aspirante.kardex) documentosFaltantes.push('Kardex');
    
    const listaDocumentos = documentosFaltantes.join(' y ');
    
    return `
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
          .container { max-width: 600px; margin: 0 auto; padding: 20px; }
          .header { background-color: #2c3e50; color: white; padding: 20px; text-align: center; }
          .content { padding: 20px; background-color: #f8f9fa; }
          .footer { padding: 15px; text-align: center; font-size: 12px; color: #666; }
          .btn { display: inline-block; padding: 12px 24px; background-color: #294969; color: white !important; text-decoration: none; border-radius: 5px; margin: 10px 0; }
          .alert { background-color: #C1C1C1; border: 1px solid #B1B1B1; padding: 15px; border-radius: 5px; margin: 15px 0; color: #333; }
          h2, p, li, strong { color: #333; }
          .alert strong { color: #333; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>PsyTech - Documentos Pendientes</h1>
            </div>
            
            <div class="content">
                <h2>Hola ${aspirante.nombreUsuario} ${aspirante.apellidoPaterno},</h2>
                
                <p>Te escribimos para recordarte que aún tienes documentos pendientes de subir al sistema PsyTech.</p>
                
                <div class="alert">
                    <strong>Documentos faltantes:</strong> ${listaDocumentos}
                </div>
                
                <p><strong>Información de tu grupo:</strong></p>
                <ul>
                    <li><strong>Institución:</strong> ${aspirante.nombreInstitucion}</li>
                    <li><strong>Grupo:</strong> ${aspirante.nombreGrupo}</li>
                    ${aspirante.fechaLimite ? `<li><strong>Fecha límite:</strong> ${new Date(aspirante.fechaLimite).toLocaleDateString('es-MX')}</li>` : ''}
                </ul>
                
                <p>Es importante que subas estos documentos lo antes posible para completar tu expediente.</p>
                
                <p>Para subir tus documentos, ingresa al sistema PsyTech con tu usuario y contraseña.</p>
                
                <a href="${loginUrl}" class="btn">Acceder al Sistema</a>
                
                <p>Si tienes alguna duda o problema para subir los documentos, no dudes en contactar a soporte.</p>
                
                <p>Saludos cordiales,<br>
                <strong>Equipo PsyTech</strong></p>
            </div>
            
            <div class="footer">
                <p>Este es un mensaje automático, por favor no respondas a este correo.</p>
                <p>© ${new Date().getFullYear()} PsyTech - Sistema de Evaluación Psicológica</p>
            </div>
        </div>
    </body>
    </html>
    `;
  }

  async sendNotification(aspirante) {
    const emailContent = this.createEmailTemplate(aspirante);
    const documentosFaltantes = [];
    if (!aspirante.cv) documentosFaltantes.push('CV');
    if (!aspirante.kardex) documentosFaltantes.push('Kardex');
    
    const subject = `PsyTech - Recordatorio: Documentos pendientes (${documentosFaltantes.join(', ')})`;

    try {
      // Solo usar Resend 
      await this.resend.emails.send({
        from: 'psytech@pruebas.psicodx.com',
        to: [aspirante.correo],
        subject: subject,
        html: emailContent
      });
      
      this.log(`Correo enviado exitosamente a: ${aspirante.correo} (${aspirante.nombreUsuario} ${aspirante.apellidoPaterno})`);
      return true;
      
    } catch (error) {
      this.log(`Error al enviar correo a ${aspirante.correo}: ${error.message}`);
      return false;
    }
  }

  async sendBulkNotifications() {
    this.log('=== INICIANDO ENVÍO DE NOTIFICACIONES ===');
    
    try {
      const aspirantes = await this.getAspirantesWithoutDocuments();
      
      if (aspirantes.length === 0) {
        this.log('No se encontraron aspirantes con documentos faltantes.');
        return { success: true, sent: 0, failed: 0, total: 0 };
      }

      this.log(`Encontrados ${aspirantes.length} aspirantes con documentos faltantes.`);
      
      let sent = 0;
      let failed = 0;
      
      for (const aspirante of aspirantes) {
        const result = await this.sendNotification(aspirante);
        await new Promise(resolve => setTimeout(resolve, 500));
        if (result) {
          sent++;
        } else {
          failed++;
        }
        
        // Pausa entre envios para evitar rate limiting
        await new Promise(resolve => setTimeout(resolve, 1000));
      }
      
      this.log(`=== RESUMEN: ${sent} enviados, ${failed} fallidos de ${aspirantes.length} total ===`);
      
      return { success: true, sent, failed, total: aspirantes.length };
      
    } catch (error) {
      this.log(`Error en envío masivo: ${error.message}`);
      return { success: false, error: error.message };
    }
  }

  async sendIndividualNotification(idAspirante, idGrupo) {
    this.log(`=== ENVIANDO NOTIFICACIÓN INDIVIDUAL (Aspirante: ${idAspirante}, Grupo: ${idGrupo}) ===`);
    
    try {
      const aspirante = await this.getSpecificAspirante(idAspirante, idGrupo);
      
      if (!aspirante) {
        this.log('Aspirante no encontrado o no tiene documentos faltantes.');
        return { success: false, message: 'Aspirante no encontrado o no tiene documentos faltantes' };
      }

      const result = await this.sendNotification(aspirante);
      
      if (result) {
        this.log(`Notificación individual enviada exitosamente a: ${aspirante.correo}`);
        return { success: true, message: 'Notificación enviada exitosamente' };
      } else {
        return { success: false, message: 'Error al enviar la notificación' };
      }
      
    } catch (error) {
      this.log(`Error en notificación individual: ${error.message}`);
      return { success: false, error: error.message };
    }
  }
}

// Funcion principal para ejecutar desde linea de comandos
async function main() {
  const service = new DocumentNotificationService();
  
  console.log('Iniciando servicio de notificaciones de documentos...');
  
  const result = await service.sendBulkNotifications();
  
  if (result.success) {
    console.log(`Proceso completado: ${result.sent} enviados, ${result.failed} fallidos`);
    process.exit(0);
  } else {
    console.error(`Error en el proceso: ${result.error}`);
    process.exit(1);
  }
}

// Exportar para uso en el controlador  
module.exports = DocumentNotificationService;

// Ejecutar si se llama directamente
if (require.main === module) {
  main();
}