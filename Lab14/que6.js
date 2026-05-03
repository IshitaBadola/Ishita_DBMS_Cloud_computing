const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');

const app = express();

// Read DB password
const dbPassword = fs.readFileSync('db_password.txt', 'utf-8').trim();

// MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: dbPassword,
    database: 'library'
});

// Connect
db.connect(err => {
    if (err) throw err;
    console.log('MySQL Connected...');
});

//
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', '*');
    next();
});

// Route: get all students
app.get('/students', (req, res) => {
    db.query('SELECT * FROM student', (err, results) => {
        if (err) return res.status(500).send(err);

        res.json(results);
    });
});

// Start server
app.listen(8012, () => {
    console.log('Server running on http://localhost:8012');
});
