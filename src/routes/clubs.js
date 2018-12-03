const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();

Router.get('/', (req, res) => {
    connection.query('SELECT * from club', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des employés');
        } else {
            res.json(results);
        }
    });
})
Router.get('/:id', (req, res) => {
    connection.query('SELECT * from club where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des club');
        } else {
            res.json(results);
        }
    });
})
Router.post('/', (req, res) => {
    connection.query('INSERT into club SET ?', req.body, (err, results) => {
        console.log(results);
        if (err) {
            console.log(err);
            res.status(500).send(`Erreur lors de l'envoi d'un club`);
        }
        else {
            res.sendStatus(200);
            }
        })
});
// const club_id = results.insertId;
//             connection.query('INSERT INTO contract (club_id) VALUES ('+club_id+')', (err, results) => {
//                 if (err) {
//                     console.log(err);
//                     res.status(500).send(`Erreur lors de l'envoi d'un club`);
//                 }
//                 else {
//                     res.sendStatus(200);
//                 }
Router.put('/:id', (req, res) => {
    const idClub = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE club SET ? WHERE id = ?', [formData, idClub], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification d'un club");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM club WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification d'un club ");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;