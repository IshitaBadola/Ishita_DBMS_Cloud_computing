const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');
const app=express();
// Read password from file
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();



// MySQL connection
const db = mysql.createConnection({
host: 'localhost',
user: 'root',
password: dbPassword,
database: 'library'
});
db.connect(err => {
if (err) throw err;
console.log('MySQL Connected...');
});


app.get('/student', (req, res) => {
	const studentName = req.query.name;
	
	if (!studentName) {
	   return res.status(400).send('Please provide a student name');
}

const sql = 'SELECT * FROM student WHERE student_name LIKE ?';
console.log(studentName)


db.query(sql, [`%${studentName}%`], (err, results) => {
if (err) {
return res.status(500).send(err);
}

// Here instead of returning a json file we return a html page with the student name, id, email, department and dob
let html = `
<h2>Student Results</h2>
<table border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>Department</th>

<th>Email</th>
<th>DOB</th>
</tr>
`;

results.forEach(s => {
html += `
<tr>
<td>${s.student_id}</td>
<td>${s.student_name}</td>
<td>${s.department}</td>
<td>${s.email}</td>
<td>${new Date(s.DOB).toLocaleDateString()}</td>
</tr>
`;
});
html += "</table>";
res.send(html);

});
});

app.listen(8012, () => {
console.log('Server running on http://localhost:8012');
});
