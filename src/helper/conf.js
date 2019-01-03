const mysql = require ('mysql')

const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"Macmacmysql0@",
    database:"allsponsored"
})

connection.connect(err => {
    if (err) throw err
    console.log("connected");
})

module.exports = connection;