const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');


router.post('/add', (req, res) => {

    const { projectId, taskId, userId } = req.body;

    connection.query('INSERT INTO relations_projects SET ?', { projectId: projectId, taskId: taskId, userId: userId }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Relación creada` });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM relations_projects`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_projects: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:relation_projectId', (req, res) => {

    const relation_projectId = req.params.relation_projectId;

    connection.query('SELECT * FROM relations_projects WHERE relation_projectId = ?', [relation_projectId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relation_projects: results[0] });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/project/:projectId', (req, res) => {

    const projectId = req.params.projectId;

    connection.query('SELECT * FROM relations_projects WHERE projectId = ?', [projectId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_projects: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/task/:taskId', (req, res) => {

    const taskId = req.params.taskId;

    connection.query('SELECT * FROM relations_projects WHERE taskId = ?', [taskId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_projects: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/user/:userId', (req, res) => {

    const userId = req.params.userId;

    connection.query('SELECT * FROM relations_projects WHERE userId = ?', [userId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ relations_projects: results });
                } else {
                    res.status(400).json({ error: 'No se encontró la relación solicitada' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:relation_projectId', (req, res) => {

    const relation_projectId = req.params.relation_projectId;

    const { projectId, taskId, userId } = req.body;

    const updatedInformation = { projectId, taskId, userId };

    connection.query('UPDATE relations_projects SET ? WHERE relation_projectId = ?', [updatedInformation, relation_projectId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Relación modificada. ID: ${relation_projectId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:relation_projectId', (req, res) => {

    const relation_projectId = req.params.relation_projectId;

    connection.query('DELETE FROM relations_projects WHERE relation_projectId = ?', [relation_projectId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Relación eliminada' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});


module.exports = router;
