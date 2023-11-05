const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');

router.post('/add', (req, res) => {

    const { name, description, status, creationDate, deadline } = req.body;

    connection.query('INSERT INTO projects SET ?', { name: name, description: description, status: status, creationDate: creationDate, deadline: deadline }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Registro de proyecto exitoso. ID: ${results.insertId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM projects`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ projects: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:projectId', (req, res) => {

    const projectId = req.params.projectId;

    connection.query('SELECT * FROM projects WHERE projectId = ?', [projectId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ project: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró el proyecto solicitado' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:projectId', (req, res) => {

    const projectId = req.params.projectId;

    const { name, description, status, creationDate, deadline } = req.body;

    const updatedInformation = { name, description, status, creationDate, deadline };

    connection.query('UPDATE projects SET ? WHERE projectId = ?', [updatedInformation, projectId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Proyecto actualizado. ID: ${projectId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:projectId', (req, res) => {

    const projectId = req.params.projectId;

    connection.query('DELETE FROM projects WHERE projectId = ?', [projectId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Proyecto eliminado' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});


module.exports = router;
