const { MongoClient } = require('mongodb');

const uri = "mongodb+srv://123:U97SEpqwM6odClph@cluster0.njoe3.mongodb.net/Cluster0?retryWrites=true&w=majority";
const client =  new MongoClient(uri);
async function connect(){
  try{
    await client.connect();
    console.log('Connected');
  } catch(err){
    console.log(err);
  }
}
connect();
module.exports = client;