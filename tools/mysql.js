const mysql = require('mysql');

const {promisify} = require('util');

const pool = mysql.createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "12345",
  database: "control_escolar"
})

pool.getConnection((e, connection) => {
  if(e) throw e;

  if(connection) connection.release();
  console.log('DB connected');
  return;
})

pool.query = promisify(pool.query)

module.exports = pool;