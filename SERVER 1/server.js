var express = require('express');
var server = require('./routes/serverroute');
var PORT = process.env.PORT || 8081
var app = express();

app.use((req, res, next) => {

    res.header("Access-Control-Allow-Origin", "*");
  
    res.header("Access-Control-Allow-Methods", "*");
  
    res.header("Access-Control-Allow-Headers", "*");
  
    res.header("Access-Control-Allow-Credentials", "*");
  
    next();
  
  });

var st="<!DOCTYPE html><HTML><HEAD></HEAD><BODY>";
var et="</BODY></HTML>";

// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ limit: "500mb", extended: true }));

// parse application/json
app.use(express.json({ limit: "500mb", extended: true }));

//http://localhost:8081/
app.use('/',server);

app.listen(PORT);