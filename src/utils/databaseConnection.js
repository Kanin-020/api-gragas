const mysql = require('mysql2');

const connection = mysql.createConnection(({
    host: 'localhost',
    user: 'root',
    database: 'gragas'
}));

module.exports = connection;
