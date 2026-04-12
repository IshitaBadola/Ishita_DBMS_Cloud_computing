const http = require('http');		//Imports Node’s built-in HTTP module and holds all server-related functions

function handleRequest(req, res) {		// here we define a function with a request from client(browser) and a response sent back
    res.write("Hello from node js server");		//sends text to the browser
    res.end();						//ends the response
}

const server = http.createServer(handleRequest);	
//creates constant variable server which with every request call the function handleRequest

server.listen(3000, '0.0.0.0', () => {
    console.log("Server running at http://localhost:3000");
});
// server.listen() tells your Node.js server to start waiting/listening for incoming request from clients(browser)
// //0.0.0.0 
