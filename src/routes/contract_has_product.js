const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();

// Router.get('/', (req, res) => {
//     connection.query('SELECT * from contract_has_product', (err, results) => {
//         if (err) {
//             res.status(500).send('Erreur lors de la récupération des données');
//         } else {
//             res.json(results);
//         }
//     });
// })
Router.get('/:idcontract', (req, res) => {
    connection.query('select product.name,contract_has_product.product_id from contract_has_product \
    inner join contract on contract.id= contract_has_product.contract_id \
    inner join product on product.id = contract_has_product.product_id \
    where contract_id=?', req.params.idcontract,(err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})
// Router.get('/:id', (req, res) => {
//     connection.query('SELECT * from contract_has_product where id=?', req.params.id, (err, results) => {
//         if (err) {
//             res.status(500).send("Erreur lors de la récupération des données");
//         } else {
//             res.json(results);
//         }
//     });
// })
Router.post('/', (req, res) => {
    const values = req.body.products.map(product => {
        return (
            [req.body.contract_id,product]
        )
    })
    const sql = 'INSERT into contract_has_product (contract_id,product_id) values ?' 
    connection.query(sql,[values], (err, results) => {
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

Router.put('/:id', (req, res) => {
    const idaction = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE contract_has_product SET ? WHERE id = ?', [formData, idaction], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM contract_has_product WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})

module.exports = Router;