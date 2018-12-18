const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();


Router.get('/withProject', (req, res) => {
    const sql = "SELECT a.id as sponsorId, a.name as sponsorName \
    ,c.* FROM allsponsored.sponsor a \
    left join allsponsored.project_has_sponsor b on a.id = b.sponsor_id \
    left join allsponsored.project c on b.project_id = c.id \
    ;";

    connection.query(sql, (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            console.log(results);
            res.json(results);
        }
    });
})

Router.get('/', (req, res) => {
    connection.query('SELECT * from sponsor', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})

Router.get('/:id', (req, res) => {
    connection.query('SELECT * from sponsor where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})
Router.post('/', (req, res) => {
    console.log(req.body)
    connection.query('INSERT into sponsor SET ?', req.body, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send(`Erreur lors de l'insertion des données`);
        }
        else {
            res.sendStatus(200);
            }
        })
});
// const sponsor_id = results.insertId;
//             connection.query('INSERT INTO sponsor (sponsor_id) VALUES ('+sponsor_id+')', (err, results) => {
//                 if (err) {
//                     console.log(err);
//                     res.status(500).send(`Erreur lors de l'envoi d'un sponsor`);
//                 }
//                 else {
//                     res.sendStatus(200);
//                 }
Router.put('/:id', (req, res) => {
    const idsponsor = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE sponsor SET ? WHERE id = ?', [formData, idsponsor], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM sponsor WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;