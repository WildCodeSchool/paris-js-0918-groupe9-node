const express = require("express");
const connection = require("../helper/conf.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const Router = express.Router();
const jwtSecret = require("../../jwtSecret");

Router.post("/", (req, res) => {
  connection.query(
    "select password,id from user where email = ?",
    req.body.email,
    (err, results) => {
      if (results[0].id === 1 && results[0].password === "12345") {
        const saltRounds = 10;
        bcrypt.hash(results[0].password, saltRounds, (err, hash) => {
          if (err) throw err;
          connection.query(
            "UPDATE user SET password = ? WHERE id = ?",
            [hash, results[0].id],
            (err, result) => {
              if (err) throw err;
              bcrypt.compare(results[0].password, hash, (err, result) => {
                console.log(req.body.password, results[0].password);
                if (result == true) {
                  const tokenInfo = {
                    email: req.body.email,
                    role: "admin"
                  };
                  if (tokenInfo) {
                    const token = jwt.sign(tokenInfo, jwtSecret);
                    res.header(
                      "Access-Control-Expose-Headers",
                      "x-access-token"
                    );
                    res.set("x-access-token", token);
                  }
                  res.status(200).send({
                    info: "user connected"
                  });
                } else {
                  res.sendStatus(204);
                }
              });
            }
          );
        });
      } else if (results.length !== 0) {
        bcrypt.compare(req.body.password, results[0].password, function(
          err,
          result
        ) {
          if (result == true) {
            const tokenInfo = {
              email: req.body.email,
              role: "admin"
            };
            if (tokenInfo) {
              const token = jwt.sign(tokenInfo, jwtSecret);
              console.log(token);
              res.header("Access-Control-Expose-Headers", "x-access-token");
              res.set("x-access-token", token);
            }
            res.status(200).send({
              info: "user connected"
            });
          } else {
            res.sendStatus(204);
          }
        });
      }
    }
  );
});

module.exports = Router;
