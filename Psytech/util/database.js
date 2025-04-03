const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'psytech',
    password: 'Milla2912-2004' //poner costraseña de cada quien
})

module.exports = pool.promise();