const fs = require('fs');

fs.readFile('data.txt', 'utf8', (err, data) => {
    if (err) {
        console.log("Error reading file");
        return;
    }
    console.log("File content:", data);
});


//here instead of usinf the function keyword we use the arrow function which has the same function as the function keyword
// err and data are inbuilt functions coming from files inbuilt processing
// It does not matter if the text file has the same name, it will be understood that it is an inbuilt function

