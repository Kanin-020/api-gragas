const express = require('express');
const cors = require('cors');

const userModel = require('./src/routes/user');


const app = express();

const PORT = 3000;

// * Configuración para angular
// app.use(cors({ cors: "127.0.0.1:4200" }));

app.use(cors({origin: '127.0.0.1'}));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.use('/user/', userModel);

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
