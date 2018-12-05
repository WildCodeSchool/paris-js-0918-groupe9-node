const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();

Router.get('/', (req, res) => {
    connection.query('SELECT * from product', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})
Router.get('/:id', (req, res) => {
    connection.query('SELECT * from product where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})
Router.post('/', (req, res) => {
    connection.query('INSERT into product SET ?', req.body, (err, results) => {
        console.log(results);
        if (err) {
            console.log(err);
            res.status(500).send(`Erreur lors de l'insertion des données`);
        }
        else {
            res.sendStatus(200);
            }
        })
});
// const product_id = results.insertId;
//             connection.query('INSERT INTO product (product_id) VALUES ('+product_id+')', (err, results) => {
//                 if (err) {
//                     console.log(err);
//                     res.status(500).send(`Erreur lors de l'envoi d'un product`);
//                 }
//                 else {
//                     res.sendStatus(200);
//                 }
Router.put('/:id', (req, res) => {
    const idproduct = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE product SET ? WHERE id = ?', [formData, idproduct], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM product WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;