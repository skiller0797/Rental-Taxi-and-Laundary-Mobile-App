// var express = require('express');
// var app = express();
// var fs = require("fs");

// app.get('/listUsers', function (req, res) {
//    fs.readFile( __dirname + "/database/" + "users.json", 'utf8', function (err, data) {
//     if (err) {
//       console.log( err );
//     } else{
//       res.end( data );
//     }
//    });
// })

// var server = app.listen(8080, function () {
//    var host = '192.168.145.82';
//    var port = '8080';
//    console.log("Example app listening at http://%s:%s", host, port);
// })

const express = require('express');
require('dotenv').config();
const connectDB = require('./db/connect');
const app = express();
var cors = require('cors');
const authRouter = require('./routes/auth');
app.use(cors());
app.use(express.json());
app.use('/api', authRouter);

//port and connect to db
const port = process.env.port || 5000;
const start = async() => {
  try{
    await connectDB(process.env.MONGO_URL);
    app.listen(port, () => {
      console.log('Server is running on port', port);
    })
  } catch(err) {
    console.log('error => ', err);
  }
}

start();