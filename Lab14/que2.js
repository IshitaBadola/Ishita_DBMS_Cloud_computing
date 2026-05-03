const fs = require('fs');
const mysql = require ('mysql2');
const express = require('express');
const app = express();
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();

//MySQL Connection
const db = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : dbPassword,
	database : 'library'
});

db.connect(err => {
	if(err) throw err;
	console.log('Mysql is connected!!');
});

app.get('/student', (req,res) => {
	const studentName = req.query.name;

	if(!studentName){
		return res.status(400).send('Please provide a student name');
  }

  const sql = 'SELECT * FROM student WHERE student_name LIKE ?';

  db.query(sql, [`%${studentName}%`], (err, results) => {
    if (err) return res.status(500).send(err);

    res.json(results);
  });
});


app.listen(8012, () => {
console.log('Server running on http://localhost:8012');
});
