const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();

Router.get('/', (req, res) => {
    connection.query('SELECT * from order_has_product', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})
Router.get('/:id', (req, res) => {
    connection.query('SELECT * from order_has_product where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})
Router.post('/', (req, res) => {
    req.body.products.map(product => {
        const sql = 'INSERT into order_has_product (product_id,order_id,quantity,size,color) values (?,?,?,?,?)'
        const value = [product.product_id, product.order_id, product.quantity, product.size, product.color]
        connection.query(sql, value, (err, results) => {
            console.log(results);
            if (err) {
                console.log(err);
                res.status(500).send(`Erreur lors de l'insertion des données`);
            }
            else {
                res.sendStatus(200);
            }
        })
    }
    )
}
);

Router.put('/:id', (req, res) => {
    const idquestion = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE order_has_product SET ? WHERE id = ?', [formData, idquestion], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM order_has_product WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;