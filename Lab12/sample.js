console.log("File name:", process.argv[1]);
// argv[0] - always gives node, argv[1] - gives the filename and hence we splice at 2
// this will give the command line arguments
// process is a global oject in NOde
console.log("Arguments passed:", process.argv.slice(2));
// slice(2) - gives the arguments AFTER the file name
