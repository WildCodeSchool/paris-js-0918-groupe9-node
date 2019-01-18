const express = require("express");
const connection = require("../helper/conf.js");
const Router = express.Router();

const bcrypt = require("bcrypt");
const saltRounds = 10;
const nodemailer = require("nodemailer");

Router.put("/", (req, res) => {
    console.log(req.body);
    if (req.body.email && req.body.password) {
    bcrypt.hash(req.body.password, saltRounds, (err, hash) => {
        console.log(hash)
        if (err) {
            console.log(err);
            res.status(500).send(`Erreur lors de l'insertion des données`);
        }
        else {
            const sql = "UPDATE club SET password = ?, updated_at = ? WHERE email = ?"
            connection.query(sql, [hash, new Date(), req.body.email], (err, result) => {
                console.log(result);
                if (result) {
                    if (err) {
                        res.status(500).send(`Erreur lors de changement`);
                    }
                    else {
                        // var smtpTransport = nodemailer.createTransport({
                        //     host: 'smtp.mailtrap.io',
                        //     port: 2525,
                        //     secure: false, // true for 465, false for other ports
                        //     auth: {
                        //         user: `${process.env.MAIL_USER}`, // generated user
                        //         pass: `${process.env.MAIL_PASSWORD}`// generated pass
                        //     }

                        // });
                        var smtpTransport = nodemailer.createTransport({
                            service: "gmail",
                            auth: {
                                user: `${process.env.USER_GMAIL} `,
                                pass: `${process.env.PASS_GMAIL}`
                            }

                        });

                        smtpTransport.sendMail({
                            // from: "e55a69bcaa-0fb124@inbox.mailtrap.io", 
                            from: "gmail",
                            to: req.body.email, // Destinataires
                            subject: "Nouveau mot de passe!", // Sujet
                            text: `Bonjour, Voici votre indetifiant ${req.body.email} et nouveau mot de passe ${req.body.password} pour votre espace club `,
                            html: `Bonjour, Voici votre indetifiant ${req.body.email} et nouveau mot de passe ${req.body.password} pour votre espace club `
                        }, (error, response) => {
                            if (error) {
                                console.log(error);
                            } else {
                                console.log("Message sent: " + response.response);
                                res.sendStatus(200);
                            }
                        });
                        //res.sendStatus(200);
                    }
                }
                else {
                    res.sendStatus(400);
                }
            })
        }
    })
    }
    else {
        res.sendStatus(400);
    }

});
module.exports = Router;