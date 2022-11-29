// server.js

const express = require('express');

//Create an app
const app = express();
app.get('/', (req, res) => {
    res.send('Express app using node js\n');
});

//Listen port
const PORT = 4000;
app.listen(PORT);
console.log(`Running on port ${PORT}`);