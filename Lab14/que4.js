const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');

const app = express();

// Read password
const dbPassword = fs.readFileSync('password.txt', 'utf-8').trim();

// MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: dbPassword,
  database: 'ensembl_local'
});

// Connect
db.connect(err => {
  if (err) throw err;
  console.log('Connected to Ensembl DB...');
});

// Route: Search by gene_id
app.get('/genes', (req, res) => {
  const geneId = req.query.id;  

  if (!geneId) {
    return res.status(400).send('Please provide a gene ID');
  }

  const sql = 'SELECT * FROM gene WHERE gene_id LIKE ?';

  db.query(sql, [`%${geneId}%`], (err, results) => {
    if (err) return res.status(500).send(err);

    if (results.length === 0) {
      return res.send('No gene found');
    }

    res.json(results);
  });
});

// Start server
app.listen(8012, () => {
  console.log('Gene API running on http://localhost:8012'); 
});
