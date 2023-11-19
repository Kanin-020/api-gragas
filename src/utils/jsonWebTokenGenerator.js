const jsonWebToken = require('jsonwebtoken');

var secretWordGlobal;

const verifyToken = (req, res, next) => {

    const token = req.headers['authorization'];

    const secretWord = getSecretWord();

    if (!token) {
        return res.status(403).json({ error: 'Token no proporcionado' });
    }

    if (!secretWord) {
        return res.status(403).json({ error: 'Llave secreta no proporcionada' });
    }

    jsonWebToken.verify(token, secretWord, (err, decoded) => {

        if (err) {
            return res.status(401).json({ error: 'Token no válido' });
        }

        req.user = decoded;
        next();

    });
};

const generateSecretWord = () => {

    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:,.<>?';

    const secretWordLength = 10;

    let secretWord = '';

    for (let i = 0; i < secretWordLength; i++) {
        const randomCharacter = characters.charAt(Math.floor(Math.random() * characters.length));
        secretWord += randomCharacter;
    }

    setSecretWord(secretWord);

    return secretWord;

}

const setSecretWord = (word) => {
    secretWordGlobal = word;
}

const getSecretWord = () => {
    return secretWordGlobal;
}

module.exports = { verifyToken, generateSecretWord };
