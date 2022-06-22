var express = require('express');
const client = require('../config/db_config');
var server_router = express.Router();
var service = require('../service/service');

var st = "<!DOCTYPE html><HTML><HEAD></HEAD><BODY>";
var et = "</BODY></HTML>";

// client.connect();

//http://localhost:8081/server/
server_router.post("/", (req, res) => {
    res.send(
        st + "<H1>" + "server Router Works!<br>Welcome to SJIT Placement Portal!" + "</H1>" + et
    );
});

// //http://localhost:8081/server/sample
// server_router.post("/sample",service.sample);

// //http://localhost:8081/server/create
// server_router.post("/create",service.create);

// //http://localhost:8081/server/read
// server_router.post("/read",service.read);

// //http://localhost:8081/server/update
// server_router.post("/update",service.update);

// //http://localhost:8081/server/delete
// server_router.post("/delete",service.delete);



//http://localhost:8081/getaccounts
server_router.get("/getaccounts", service.getaccounts);

//http://localhost:8081/getoneaccount
server_router.post("/getoneaccount", service.getoneaccount);

//http://localhost:8081/createaccount
server_router.post("/createaccount", service.createaccount);

//http://localhost:8081/addtokenid
server_router.post("/addtokenid", service.addtokenid);

//http://localhost:8081/removetokenid
server_router.post("/removetokenid", service.removetokenid);

//http://localhost:8081/getintern
server_router.post("/getintern", service.getintern);

//http://localhost:8081/getinterndet
server_router.post("/getinterndet", service.getinterndet);

//http://localhost:8081/uploadintern
server_router.post("/uploadintern", service.uploadintern);

//http://localhost:8081/getws
server_router.post("/getws", service.getws);

//http://localhost:8081/getwsdet
server_router.post("/getwsdet", service.getwsdet);

//http://localhost:8081/uploadws
server_router.post("/uploadws", service.uploadws);

//http://localhost:8081/getcourse
server_router.post("/getcourse", service.getcourse);

//http://localhost:8081/getcoursedet
server_router.post("/getcoursedet", service.getcoursedet);

//http://localhost:8081/uploadcourse
server_router.post("/uploadcourse", service.uploadcourse);

//http://localhost:8081/uploadFileFB
server_router.post("/uploadFileFB", service.uploadFileFB);

//http://localhost:8081/getworkshop
server_router.post("/getworkshop", service.getworkshop);

//http://localhost:8081/uploadworkshop
server_router.post("/uploadworkshop", service.uploadworkshop);

//http://localhost:8081/getoneprofile
server_router.post("/getoneprofile", service.getoneprofile);

//http://localhost:8081/uploadppdata
server_router.post("/uploadppdata", service.uploadppdata);

//http://localhost:8081/getgenealD
server_router.post("/getgenealD", service.getgenealD);

//http://localhost:8081/uploadgenealD
server_router.post("/uploadgenealD", service.uploadgenealD);

//http://localhost:8081/updategenealD
server_router.post("/updategenealD", service.updategenealD);

//http://localhost:8081/getEducationD
server_router.post("/getEducationD", service.getEducationD);

//http://localhost:8081/uploadEducationD
server_router.post("/uploadEducationD", service.uploadEducationD);

//http://localhost:8081/updateEducationD
server_router.post("/updateEducationD", service.updateEducationD);

//http://localhost:8081/getCurrentD
server_router.post("/getCurrentD", service.getCurrentD);

//http://localhost:8081/uploadCurrentD
server_router.post("/uploadCurrentD", service.uploadCurrentD);

//http://localhost:8081/updateCurrentD
server_router.post("/updateCurrentD", service.updateCurrentD);

//http://localhost:8081/getPersonalD
server_router.post("/getPersonalD", service.getPersonalD);

//http://localhost:8081/uploadPersonalD
server_router.post("/uploadPersonalD", service.uploadPersonalD);

//http://localhost:8081/updatePersonalD
server_router.post("/updatePersonalD", service.updatePersonalD);

//http://localhost:8081/getExtraD
server_router.post("/getExtraD", service.getExtraD);

//http://localhost:8081/uploadExtraD
server_router.post("/uploadExtraD", service.uploadExtraD);

//http://localhost:8081/updateExtraD
server_router.post("/updateExtraD", service.updateExtraD);

//http://localhost:8081/uploadppdataex
server_router.post("/uploadppdataex", service.uploadppdataex);

//http://localhost:8081/displayNotification
server_router.post("/displayNotification", service.displayNotification);

module.exports = server_router;