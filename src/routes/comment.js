const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');

router.post('/add', (req, res) => {

    const { taskId, userId, state, content, date } = req.body;

    connection.query('INSERT INTO comments SET ?', { taskId: taskId, userId: userId, state: state, content: content, date: date }, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Registro de Comentario exitoso. ID: ${results.insertId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM comments`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ comments: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get/:commentId', (req, res) => {

    const commentId = req.params.commentId;

    connection.query('SELECT * FROM comments WHERE commentId = ?', [commentId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ comment: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró el comentario solicitado' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:commentId', (req, res) => {

    const commentId = req.params.commentId;

    const { state, content, date } = req.body;

    const updatedInformation = { state, content, date };

    connection.query('UPDATE comments SET ? WHERE commentId = ?', [updatedInformation, commentId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                if (results[0]) {
                    res.json({ response: `Comentario actualizado. ID: ${commentId}` });
                } else {
                    res.json({ error: 'Comentario no encontrado' });
                }
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:commentId', (req, res) => {

    const commentId = req.params.commentId;

    connection.query('DELETE FROM comments WHERE commentId = ?', [commentId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Comentario eliminado' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});


module.exports = router;
