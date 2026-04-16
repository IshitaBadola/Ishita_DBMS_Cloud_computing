const express = require('express');
const app = express();
const port = 8012;

// Route handling query parameters
app.get('/search', (req, res) => {
    const { qparam1, qparam2 } = req.query;

    res.send(`query param1: ${qparam1}, query param2: ${qparam2 || 'none'}`);
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
