var express = require('express');
// var bodyParser = require('body-parser');
var app = express();

app.get('/zomg', function(req,res){
  res.send('it works!');
});

module.exports = app;
