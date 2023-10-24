const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');

router.post('/add', (req, res) => {

    const { projectId, name, description, state, creationDate, deadline } = req.body;

    connection.query('INSERT INTO tasks SET ?', { projectId: projectId, name: name, description: description, state: state, creationDate: creationDate, deadline: deadline }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Registro de Tarea exitosa. ID: ${results.insertId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM tasks`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ tasks: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:taskId', (req, res) => {

    const taskId = req.params.taskId;

    connection.query('SELECT * FROM tasks WHERE taskId = ?', [taskId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ task: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró la tarea solicitada' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:taskId', (req, res) => {

    const taskId = req.params.taskId;

    const { name, description, state, creationDate, deadline } = req.body;

    const updatedInformation = { name, description, state, creationDate, deadline };

    connection.query('UPDATE tasks SET ? WHERE taskId = ?', [updatedInformation, taskId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                if (results[0]) {
                    res.json({ response: `Tarea actualizada. ID: ${taskId}` });
                } else {
                    res.json({ error: 'Tarea no encontrada' });
                }
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:taskId', (req, res) => {

    const taskId = req.params.taskId;

    connection.query('DELETE FROM tasks WHERE taskId = ?', [taskId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ response: 'Tarea eliminada' });
                } else {
                    res.json({ error: 'Tarea no encontrada' });
                }
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});


module.exports = router;
