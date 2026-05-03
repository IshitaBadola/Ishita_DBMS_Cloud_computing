const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');

const app = express();


app.use(express.urlencoded({ extended: true }));

// Read DB password
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();

// DB connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: dbPassword,
    database: 'library'
});

// Connect
db.connect(err => {
    if (err) {
        console.log(err);
        return;
    }
    console.log('Connected to MySQL...');
});


app.get('/', (req, res) => {
    res.send(`
        <h2>Update Student</h2>
        <form method="POST" action="/update">
            <label>ID:</label><br>
            <input type="number" name="id" required><br><br>

            <label>New Name:</label><br>
            <input type="text" name="name" required><br><br>

            <button type="submit">Update</button>
        </form>
    `);
});

app.post('/update', (req, res) => {
    const id = req.body.id;
    const name = req.body.name;

    console.log("Received:", id, name); // DEBUG

    if (!id || !name) {
        return res.send("Missing data");
    }

    const sql = "UPDATE student SET student_name = ? WHERE student_id = ?";

    db.query(sql, [name, id], (err, result) => {
        if (err) {
            console.log(err);
            return res.send("Database error");
        }

        console.log(result); // DEBUG

        if (result.affectedRows === 0) {
            return res.send("No student found with this ID");
        }

        res.send("Student updated successfully!");
    });
});

// Start server
app.listen(8014, () => {
    console.log("Server running on http://localhost:8014");
});
