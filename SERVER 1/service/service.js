var express = require('express');
const client = require('../config/db_config');


const uploadFile = require("../config/upload");

const firebaseAdmin = require('firebase-admin');
const { v4: uuidv4 } = require('uuid');
const serviceAccount = require('./placement-portal-56d18-firebase-adminsdk-v7pqd-01ce02b42c.json');
//Refernece:
//https://www.youtube.com/watch?v=fbYExfeFsI0
// create
//  = async (req,res)=>{
//     try{
//         const result = await client.db("Cluster0").collection("accounts").insertOne(req.body);
// 	const result1 = await client.db("Cluster0").collection("accounts").findOne(
//             {'regno':req.body.regno}
//         );
//         res.send(result1);
//     } catch(err){
//         console.log(err);
//     }
// }
// find
//  = async (req,res)=>{
//     try{
//         const result = await client.db("Cluster0").collection("accounts").find();
//         var resultfinal = [];
//         await result.forEach(element => {
//             resultfinal.push(element);
//         });
//         res.send(resultfinal);
//     } catch(err){
//         console.log(err);
//     }
// }
// findone
//  = async (req,res)=>{
//     try{
//         const result = await client.db("Cluster0").collection("accounts").findOne(
//             {'regno':req.body.regno}
//         );
//         res.send(result);
//     } catch(err){
//         console.log(err);
//     }
// }
// update
//  = async (req,res)=>{
//     try{
//         const result = await client.db("Cluster0").collection("profile").update(
//            {regno: req.body.regno},
//             {$set: req.body},
//             (err1,result)=>{
//                 if(err1)
//                     console.log(err1);
//             }
//         );
//         const result1 = await client.db("Cluster0").collection("profile").findOne(
//             {'regno':req.body.regno}
//         );
//         res.send(result1);
//     } catch(err){
//         console.log(err);
//     }
// }
// delete
//  = async (req,res)=>{
//     try{
//         const result = await client.db("Cluster0").collection("accounts").deleteMany(
//            {name: req.body.name},
//             (err1,result)=>{
//                 if(err1)
//                     console.log(err1);
//                 else
//                     res.send(result);
//             }
//         );
//     } catch(err){
//         console.log(err);
//     }
// }
// module.exports.sample = async (req,res)=>{
//     try{
//         const result = await client.db("resto").collection("foddet").insertOne({
//             'name':'panner butter masala',
//             'type':'side dish',
//             'quantity': 200
//         });
//         // console.log(result);
//         res.send(result);
//     } catch(err){
//         console.log(err);
//     }
// }

// module.exports.create = async (req,res)=>{
//     try{
//         const result = await client.db("resto").collection("foddet").insertOne({
//             'name':req.body.name,
//             'type':req.body.type,
//             'quantity':req.body.quantity,
//             'path':''
//         });
//         res.send(result);
//     } catch(err){
//         console.log(err);
//     }
// }

// module.exports.read = async (req,res)=>{
//     try{
//         const result = await client.db("resto").collection("foddet").find();
//         var resultfinal = [];
//         // console.log(result);
//         await result.forEach(element => {
//             if(element.file==null)
//                 resultfinal.push(element);
//             // console.log(element);
//         });
//         // console.log(resultfinal);
//         res.send(resultfinal);
//     } catch(err){
//         console.log(err);
//     }
// }

// module.exports.update = async (req,res)=>{
//     /*
//     References: https://www.w3schools.com/nodejs/nodejs_mongodb_update.asp
//     */
//     try{
//         const result = await client.db("resto").collection("foddet").updateMany(
//            {name: req.body.name},
//             {$set: {quantity: req.body.quantity}},
//             (err1,result)=>{
//                 if(err1)
//                     console.log(err1);
//                 else
//                     res.send(result);
//             }
//         );
//     } catch(err){
//         console.log(err);
//     }
// }

// module.exports.delete = async (req,res)=>{
//     /*
//     References: https://www.w3schools.com/nodejs/nodejs_mongodb_delete.asp
//     */
//     try{
//         const result = await client.db("resto").collection("foddet").deleteMany(
//            {name: req.body.name},
//             (err1,result)=>{
//                 if(err1)
//                     console.log(err1);
//                 else
//                     res.send(result);
//             }
//         );
//     } catch(err){
//         console.log(err);
//     }
// }

module.exports.getaccounts = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("accounts").find();
        // console.log(result);
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.getoneaccount = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("accounts").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        // console.log(result);
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.createaccount = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("accounts").insertOne(
            req.body
        );
        const result1 = await client.db("Cluster0").collection("accounts").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        // console.log(result);
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getintern = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("interns").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.getinterndet = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("interns").find({
            'regno':req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadintern = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("interns").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("interns").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getws = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("workshop").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.getwsdet = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("workshop").find({
            'regno':req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadws = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("workshop").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("workshop").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getcourse = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("course").find();
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.getcoursedet = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("course").find({
            'regno':req.body.regno
        });
        var resultfinal = [];
        // console.log(result);
        await result.forEach(element => {
            resultfinal.push(element);
            // console.log(element);
        });
        // console.log(resultfinal);
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadcourse = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("course").insertOne(req.body);
        const result1 = await client.db("Cluster0").collection("course").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
const adminfb = firebaseAdmin.initializeApp({
    credential: firebaseAdmin.credential.cert(serviceAccount),
});
module.exports.uploadFileFB = async (req,res)=>{
    try {
        // console.log("Body: "+ req.body.file);
        await uploadFile(req, res);
        // console.log("File: "+req.file.filename);
        if (req.file == undefined) {
          return res.status(400).send({ message: "Please upload a file!" });
        }

        const storageRef = adminfb.storage().bucket(`gs://placement-portal-56d18.appspot.com`);
        (async() => {
            path='./config/uploads/'+req.file.filename;

            storage = await storageRef.upload(path.toString(), {
                    public: true,
                    destination: `uploads/files/${req.file.filename}`,
                    metadata: {
                        firebaseStorageDownloadTokens: uuidv4(),
                    }
            });
            let url = storage[0].metadata.mediaLink;
            console.log(url);
            
            // const result = await client.db("resto").collection("foddetimg").insertOne({
            //     'name':req.body.name,
            //     'filename':req.file.originalname,
            //     'filelocfb':url
            // });

            // const result1 = await client.db("resto").collection("foddet").updateMany(
            //     {name: req.body.name},
            //      {$set: {path: url}},
            //      (err1,result1)=>{
            //          if(err1)
            //              console.log(err1);
            //      }
            //  );

            res.status(200).send(url);
        })();
      } catch (err) {
        console.log(err);
    
        if (err.code == "LIMIT_FILE_SIZE") {
          return res.status(500).send({
            message: "File size cannot be larger than 2MB!",
          });
        }
    
        res.status(500).send({
          message: `Could not upload the file: ${req.file.originalname}. ${err}`,
        });
      }
}
module.exports.getworkshop = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("workshop").find();
        var resultfinal = [];
        await result.forEach(element => {
            resultfinal.push(element);
        });
        res.send(resultfinal);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadworkshop = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("workshop").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("workshop").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getoneprofile = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadppdata = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getgenealD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadgenealD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updategenealD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
//        console.log("Success");
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getEducationD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadEducationD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updateEducationD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updateCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getPersonalD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadPersonalD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updatePersonalD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};

module.exports.getExtraD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadExtraD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updateExtraD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        // console.log("Success");
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};

module.exports.uploadppdataex = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};