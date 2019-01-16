const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();

Router.get('/', (req, res) => {
    connection.query('SELECT * from order', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})
Router.get('/:id', (req, res) => {
    connection.query('SELECT * from order where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})

Router.get('/:id/details', (req, res) => {
    const sql = "SELECT `order`.id as orderId, `order`.delivery_address, product.name as productName, order_has_product.quantity, order_has_product.color, order_has_product.size from `order`\
    JOIN order_has_product ON `order`.id = order_has_product.order_id\
    JOIN product ON product.id = order_has_product.product_id\
    WHERE `order`.id = ?;"
    connection.query(sql, req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})

Router.post('/', (req, res) => {
    connection.query('INSERT into order SET ?', req.body, (err, results) => {
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
// const order_id = results.insertId;
//             connection.query('INSERT INTO order (order_id) VALUES ('+order_id+')', (err, results) => {
//                 if (err) {
//                     console.log(err);
//                     res.status(500).send(`Erreur lors de l'envoi d'un order`);
//                 }
//                 else {
//                     res.sendStatus(200);
//                 }

Router.post('/:idcontract', (req, res) => {
    connection.query('INSERT into `order` (contract_id) values (?)', req.params.idcontract, (err, results) => {
        console.log(results);
        if (err) {
            console.log(err);
            res.status(500).send(`Erreur lors de l'insertion des données`);
        }
        else {
            req.body.products.map(product => {
                const sql = 'INSERT into order_has_product (product_id,order_id,quantity,size,color) values (?,?,?,?,?)'
                const value = [product.product_id, results.insertId, product.quantity, product.size, product.color]
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
        })
});

Router.put('/:id', (req, res) => {
    const idorder = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE order SET ? WHERE id = ?', [formData, idorder], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM order WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;