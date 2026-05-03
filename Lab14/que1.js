const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();
const app = express();

// MySQL connection
const db = mysql.createConnection({
	host:'localhost',
	user:'root',
	password: dbPassword,
	database:'library'
});

db.connect(err => {
	if(err) throw err;
	console.log('MySQL Connected.....')
});

// Route: Get all students
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

