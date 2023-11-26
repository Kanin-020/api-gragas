const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');


router.post('/add', verifyToken, (req, res) => {

    const { commentId, taskId, userId } = req.body;

    connection.query('INSERT INTO relations_comments SET ?', { commentId: commentId, taskId: taskId, userId: userId }, (error, results) => {
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

router.get('/get-all', verifyToken, (req, res) => {

    connection.query(`SELECT * FROM relations_comments`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_comments: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:relation_commentId', verifyToken, (req, res) => {

    const relation_commentId = req.params.relation_commentId;

    connection.query('SELECT * FROM relations_comments WHERE relation_commentId = ?', [relation_commentId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ relation_comments: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró la relación solicitada' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/comment/:commentId', verifyToken, (req, res) => {

    const commentId = req.params.commentId;

    connection.query('SELECT * FROM relations_comments WHERE commentId = ?', [commentId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_comments: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/task/:taskId', verifyToken, (req, res) => {

    const taskId = req.params.taskId;

    connection.query('SELECT * FROM relations_comments WHERE taskId = ?', [taskId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_comments: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/user/:userId', verifyToken, (req, res) => {

    const userId = req.params.userId;

    connection.query('SELECT * FROM relations_comments WHERE userId = ?', [userId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ relations_comments: results });
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:relation_commentId', verifyToken, (req, res) => {

    const relation_commentId = req.params.relation_commentId;

    const { commentId, taskId, userId } = req.body;

    const updatedInformation = { commentId, taskId, userId };

    connection.query('UPDATE relations_comments SET ? WHERE relation_commentId = ?', [updatedInformation, relation_commentId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Relación modificada. ID: ${relation_commentId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:relation_commentId', verifyToken, (req, res) => {

    const relation_commentId = req.params.relation_commentId;

    connection.query('DELETE FROM relations_comments WHERE relation_commentId = ?', [relation_commentId], (error, results) => {

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
