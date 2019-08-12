const http = require('http');

http.createServer(function(req, res){

	res.end("Hello World!!!")
	res.end("git Diff")

}).listen(80)
