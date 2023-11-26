const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');
const { verifyToken } = require('../utils/jsonWebTokenGenerator');

router.post('/add', verifyToken, (req, res) => {

    const { status, content, date } = req.body;

    connection.query('INSERT INTO comments SET ?', { status: status, content: content, date: date }, (error, results) => {
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

router.get('/get-all', verifyToken, (req, res) => {

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

router.get('/get/:commentId', verifyToken, (req, res) => {

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

router.put('/edit/:commentId', verifyToken, (req, res) => {

    const commentId = req.params.commentId;

    const { status, content } = req.body;

    const updatedInformation = { status, content };

    connection.query('UPDATE comments SET ? WHERE commentId = ?', [updatedInformation, commentId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Comentario actualizado. ID: ${commentId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:commentId', verifyToken, (req, res) => {

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
