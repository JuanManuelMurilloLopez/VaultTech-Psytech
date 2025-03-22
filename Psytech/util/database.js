const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'psytech',
    password: '' //poner costraseña de cada quien
})

module.exports = pool.promise();