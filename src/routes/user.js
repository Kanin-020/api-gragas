const express = require('express');
const router = express.Router();
const connection = require('../utils/databaseConnection');

router.post('/register', (req, res) => {

    const dateObject = new Date();

    const { name, email, password, role } = req.body;

    const creationDate = dateObject.toLocaleString();

    const lastLoginDate = 'none';

    connection.query('INSERT INTO users SET ?', { name: name, email: email, password: password, role: role, creationDate: creationDate, lastLoginDate: lastLoginDate }, async (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: `Registro de usuario exitoso. ID: ${results.insertId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

router.post('/login', (req, res) => {

    const dateObject = new Date();

    const { email, password } = req.body;
    const loginQuery = `SELECT * FROM users WHERE email = '${email}'`;
    const lastLoginDate = dateObject.toLocaleString();
    const dateQuery = `UPDATE users SET lastLoginDate = '${lastLoginDate}' WHERE email = '${email}'`;

    connection.query(loginQuery, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {

                const user = results[0];

                if (user.password == password) {

                    connection.query(dateQuery, () => {
                        res.json({
                            userId: results[0].userId,
                            role: results[0].role,
                        });
                    });

                }

            }

        } catch (error) {
            res.status(500).json({ error: error });
        }


    });

});

router.get('/get-all', (req, res) => {

    connection.query(`SELECT * FROM users`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ users: results });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.get('/get-workers', (req, res) => {

    connection.query(`SELECT * FROM users WHERE role = 'trabajador'`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results) {
                    res.json({ workers: results });
                } else {
                    res.status(400).json({ error: 'No hay trabajadores en la base de datos' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

router.get('/get-administrators', (req, res) => {

    connection.query(`SELECT * FROM users WHERE role = 'administrador'`, (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results) {
                    res.json({ administrators: results });
                } else {
                    res.status(400).json({ error: 'No hay administradores en la base de datos' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});

router.get('/get/:userId', (req, res) => {

    const userId = req.params.userId;

    connection.query('SELECT * FROM users WHERE userId = ?', [userId], (error, results) => {
        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                if (results[0]) {
                    res.json({ user: results[0] });
                } else {
                    res.status(400).json({ error: 'No se encontró el usuario solicitado' });
                }
            }
        } catch (error) {
            res.status(500).json({ error: error });
        }
    });

});

router.put('/edit/:userId', (req, res) => {

    const userId = req.params.userId;

    const { name, email, password, role } = req.body;

    const updatedInformation = { name, email, password, role };

    connection.query('UPDATE users SET ? WHERE userId = ?', [updatedInformation, userId], (error, results) => {

        try {
            if (error) {
                res.status(400).send({ error: error });
            } else {
                res.json({ response: `Usuario actualizado. ID: ${userId}` });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });


});

router.delete('/delete/:userId', (req, res) => {

    const userId = req.params.userId;

    connection.query('DELETE FROM users WHERE userId = ?', [userId], (error, results) => {

        try {
            if (error) {
                res.status(400).json({ error: error });
            } else {
                res.json({ response: 'Usuario eliminado' });
            }

        } catch (error) {
            res.status(500).json({ error: error });
        }

    });

});


module.exports = router;
