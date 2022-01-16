var express = require('express');
const client = require('../config/db_config');

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
        const result = await client.db("Cluster0").collection("profile_edu").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadEducationD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_edu").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile_edu").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updateEducationD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_edu").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile_edu").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_cur").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_cur").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile_cur").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.updateCurrentD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_cur").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile_cur").findOne(
            {'regno':req.body.regno}
        );
        res.send(result1);
    } catch(err){
        console.log(err);
    }
};
module.exports.getPersonalD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_per").findOne(
            {'regno':req.body.regno}
        );
        res.send(result);
    } catch(err){
        console.log(err);
    }
};
module.exports.uploadPersonalD = async (req,res)=>{
    try{
        const result = await client.db("Cluster0").collection("profile_per").insertOne(req.body);
	    const result1 = await client.db("Cluster0").collection("profile_per").findOne(
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
        const result = await client.db("Cluster0").collection("profile_per").update(
           {regno: req.body.regno},
            {$set: req.body},
            (err1,result)=>{
                if(err1)
                    console.log(err1);
            }
        );
        const result1 = await client.db("Cluster0").collection("profile_per").findOne(
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