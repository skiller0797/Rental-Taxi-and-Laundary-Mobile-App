var express = require('express');
var app = express();
var fs = require("fs");

app.get('/listUsers', function (req, res) {
   fs.readFile( __dirname + "/database/" + "users.json", 'utf8', function (err, data) {
    if (err) {
      console.log( err );
    } else{
      res.end( data );
    }
   });
})

var server = app.listen(8080, function () {
   var host = '192.168.145.82';
   var port = '8080';
   console.log("Example app listening at http://%s:%s", host, port);
})