const mysql = require('mysql2')
const config = require('./config')

// 1.创建数据库连接
const pool = mysql.createPool({
  host: config.MYSQL_HOST,
  port: config.MYSQL_PORT,
  database: config.MYSQL_DATABASE,
  user: config.MYSQL_USER,
  password: config.MYSQL_PASSWORD
})

// 2.测试连接
pool.getConnection((err, poolConnection) => {
  poolConnection.connect(err => {
    if (err) {
      console.log('连接失败~', err);
    } else {
      console.log('数据库连接成功~');
    }
  })
})

// 3.导出promise
module.exports = pool.promise()