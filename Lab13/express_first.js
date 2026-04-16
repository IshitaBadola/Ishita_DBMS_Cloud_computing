const express = require('express');
const app = express();
const port = 8012;

app.get('/', (req, res) => {
  res.send("Hello Express");
});

app.listen(port, () => {
  console.log("Example webapp listening at 3000");
});

