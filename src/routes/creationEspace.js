const express = require('express');
const router = express.Router();
const nodemailer = require("nodemailer");

router.get('/creationespace', (req, res) => {
    // Création de la méthode de transport de l'email 
    var smtpTransport = nodemailer.createTransport({
        host: 'smtp.mailtrap.io',
        port: 2525,
        secure: false, // true for 465, false for other ports
        auth: {
            user:"7a8075e4a6721f", // generated user
            pass: "797fe7e2074020" // generated pass
        }

    });
    smtpTransport.sendMail({
        from: "e55a69bcaa-0fb124@inbox.mailtrap.io", // Expediteur
        to: req.email, // Destinataires
        subject: "Bienvenue à votre espace client !", // Sujet
        text: "Bonjour, Voici votre indetifiant et mot de pass pour votre espace club" + req.password + req.identifiant,
        html: "<b>Bonjour mamie, Tu peux me donner ton recette du gateau chiffron, Je t'aime</b>"
    }, (error, response) => {
        if (error) {
            console.log(error);
        } else {
            console.log("Message sent: " + response.response);
        }
    });
    res.send('Vous avez envoyer un email à grand mere')
})

module.exports = router;