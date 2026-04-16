const path = require('path');
const express = require('express');
const app = express();
const port = 8012;

// Serve static files
app.use(express.static('public_pages'));
//app.get('/', (req.res))

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
