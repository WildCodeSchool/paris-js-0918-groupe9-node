const express = require('express');
const connection = require('../helper/conf.js')
const Router = express.Router();
const multer = require('multer');
const upload = multer({ dest: 'tmp/' });

Router.get('/', (req, res) => {
    connection.query('SELECT * from project', (err, results) => {
        if (err) {
            res.status(500).send('Erreur lors de la récupération des données');
        } else {
            res.json(results);
        }
    });
})

Router.get('/:id', (req, res) => {
    connection.query('SELECT * from project where id=?', req.params.id, (err, results) => {
        if (err) {
            res.status(500).send("Erreur lors de la récupération des données");
        } else {
            res.json(results);
        }
    });
})
Router.post('/', (req, res) => {
    connection.query('INSERT into project SET ?', req.body, (err, results) => {
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
// const project_id = results.insertId;
//             connection.query('INSERT INTO project (project_id) VALUES ('+project_id+')', (err, results) => {
//                 if (err) {
//                     console.log(err);
//                     res.status(500).send(`Erreur lors de l'envoi d'un project`);
//                 }
//                 else {
//                     res.sendStatus(200);
//                 }
Router.put('/:id', (req, res) => {
    const idproject = req.params.id;
    const formData = req.body;
    formData.updated_at = new Date();
    connection.query('UPDATE project SET ? WHERE id = ?', [formData, idproject], (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la modification des données");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM project WHERE id =?', req.params.id, (err, results) => {
        if (err) {
            console.log(err);
            res.status(500).send("Erreur lors de la suppression");
        } else {
            res.sendStatus(200);
        }

    })
})
Router.post('/uploaddufichier', upload.array('monfichier'), function (req, res, next) {
    req.files.forEach(file => {
        if (file.size > 1024 * 1024 * 3) {
            res.status(400).send("File is too big!")
            return;
        };

        if (!file.mimetype.includes('image/png,pdf')) {
            res.status(400).send("File is not png!")
            return;
        };

        fs.rename(file.path, 'public/images/' + file.originalname, function (err) {
            if (err) {
                res.send('problème durant le déplacement');
            } else {
                res.send('Fichier uploadé avec succès');
            }
        });
    });

})
module.exports = Router;