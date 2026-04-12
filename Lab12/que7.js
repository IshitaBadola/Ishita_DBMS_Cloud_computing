console.log(Math.random());
// gives a output number between 0 and 1
// The randomness depends on some typr of kyeboard interupt that may occur
// For instance is another process is started in netween the request


function getRandomInt(max) {
	return Math.floor(Math.random()*max);
}


console.log(getRandomInt(3));
console.log(getRandomInt(100));

