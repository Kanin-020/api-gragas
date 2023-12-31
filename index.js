const express = require('express');
const cors = require('cors');

const userModel = require('./src/routes/user');
const projectModel = require('./src/routes/project');
const taskModel = require('./src/routes/task');
const commentModel = require('./src/routes/comment');
const relationsCommentsModel = require('./src/routes/relations_comments')
const relationsProjectsModel = require('./src/routes/relations_projects');


const app = express();

const PORT = 3000;

app.use(cors({ cors: "127.0.0.1:4200" }));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.use('/user', userModel);
app.use('/project', projectModel);
app.use('/task', taskModel);
app.use('/comment', commentModel);
app.use('/relations-comments', relationsCommentsModel);
app.use('/relations-projects', relationsProjectsModel);


app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
