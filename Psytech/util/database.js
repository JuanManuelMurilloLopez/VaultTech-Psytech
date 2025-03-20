const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'psytech',
  password: '', // Sin contraseña
});

module.exports = pool.promise();
