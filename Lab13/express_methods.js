// express-lab.js
const express = require('express');
const path = require('path');
const app = express();
const port = 8012;

// ----------------------
// Exercise 1 & 2: GET and POST routes
app.get('/', (req, res) => {
  res.send('GET request to the homepage');
});

app.post('/', (req, res) => {
  res.send('POST request to the homepage');
});

// ----------------------
// Exercise 3: Serve aboutme.html
app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'aboutme.html'));
});



// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
