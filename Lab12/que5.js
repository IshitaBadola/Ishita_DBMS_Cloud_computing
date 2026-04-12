const fs = require('fs');

fs.readFile('data.txt', 'utf8', function(err, data) {
    if (err) {
        console.log("Error reading file");
        return;
    }
    console.log("File content:", data);
});

// Here we use the keyword function instead of using the arrow function
// the function is an argument to readFile
// fs is file system module
