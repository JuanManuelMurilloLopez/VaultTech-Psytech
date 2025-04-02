const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
<<<<<<< HEAD
    database: 'psytech',
    password: 'Milla2912-2004' //poner costraseña de cada quien
=======
    database: 'psytech2',
    password: '' //poner costraseña de cada quien
>>>>>>> 31a38a3d7ba32fdeb5b24760a87e656a69ff5da0
})

module.exports = pool.promise();