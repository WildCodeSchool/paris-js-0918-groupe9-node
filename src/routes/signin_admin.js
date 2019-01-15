
const express = require("express");
const connection = require("../helper/conf.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const Router = express.Router();
const jwtSecret = require("../../jwtSecret");


Router.post('/', (req, res) => {
    connection.query('select password,id from user where email = ?', req.body.email, (err, results) => {
        if (results.length !== 0) {
        console.log(results);
            bcrypt.compare(req.body.password, results[0].password, function (err, result) {
                console.log(result);
                if (result == true) {
                    const tokenInfo = {
                        email: req.body.email,
                        role: "club"
                    }
                    if (tokenInfo) {
                        const token = jwt.sign(tokenInfo, jwtSecret)
                        console.log(token);
                        res.header("Access-Control-Expose-Headers", "x-access-token")
                        res.set('x-access-token', token)
                    }
                    res.status(200).send({
                        info: 'user connected',
                    });
                } else {
                    res.sendStatus(204);
                }
            });

    }
})
})


module.exports = Router;
