const mysql = require ('mysql')
require('dotenv').config()

const connection = mysql.createConnection({
    host:`${process.env.DB_COMPTE}`,
    user:`${process.env.DB_USER}`,
    password:`${process.env.DB_PASSWORD}`,
    database:`${process.env.DB_DATABASE}`
})

connection.connect(err => {
    if (err) throw err
    console.log("connected");
})

module.exports = connection;