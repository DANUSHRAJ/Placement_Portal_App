import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

//mongosh "mongodb+srv://cluster0.g4db3.mongodb.net/Cluster0" --username anishchamaria
//mongodb+srv://anishchamaria:FurdHOlMcX3wiudb@cluster0.g4db3.mongodb.net/Cluster0?retryWrites=true&w=majority
//mongodb+srv://123:U97SEpqwM6odClph@cluster0.njoe3.mongodb.net/myFirstDatabase?retryWrites=true&w=majority
void start() async {
  // Log into database
  final db = await Db.create(
      'mongodb+srv://123:U97SEpqwM6odClph@cluster0.njoe3.mongodb.net/Cluster0?retryWrites=true&w=majority');
  await db.open();
//  final coll = db.collection('accounts');
//  final coll = db.collection('interns');

  // Create server
  const port = 8081;
  final serv = Sevr();

  final corsPaths = ['/', '/:id'];
  for (var route in corsPaths) {
    serv.options(route, [
      (req, res) {
        setCors(req, res);
        return res.status(200);
      }
    ]);
  }

  serv.get('/getaccounts', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('accounts');
      final accounts = await coll.find().toList();
      return res.status(200).json({'accounts': accounts});
    }
  ]);

  serv.post('/getoneaccount', [
    setCors,
        (ServRequest req, ServResponse res) async {
      final coll = db.collection('accounts');
//      return res.json(await coll.findOne(where.eq('regno', req.body['regno'])));
      final accounts = await coll.findOne(where.eq('regno', req.body['regno']));
      return res.json(accounts);
    }
  ]);

  serv.post('/createaccount', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('accounts');
      await coll.save(req.body);
//      log('$req.body');
      return res.json(
        await coll.findOne(where.eq('username', req.body['username'])),
      );
    }
  ]);

  serv.get('/getintern', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('interns');
      final interns = await coll.find().toList();
      return res.status(200).json({'interns': interns});
    }
  ]);

  serv.post('/uploadintern', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('interns');
      await coll.save(req.body);
//      log('$req.body');
      return res.json(
        await coll.findOne(where.eq('username', req.body['username'])),
      );
    }
  ]);

  serv.get('/getworkshop', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('workshop');
      final workshop = await coll.find().toList();
      return res.status(200).json({'workshop': workshop});
    }
  ]);

  serv.post('/uploadworkshop', [
    setCors,
    (ServRequest req, ServResponse res) async {
      final coll = db.collection('workshop');
      await coll.save(req.body);
//      log('$req.body');
      return res.json(
        await coll.findOne(where.eq('username', req.body['username'])),
      );
    }
  ]);

  // serv.delete('/:id', [
  //   setCors,
  //   (ServRequest req, ServResponse res) async {
  //     await coll
  //         .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
  //     return res.status(200);
  //   }
  // ]);

  // Listen for connections
  serv.listen(port, callback: () {
    print('Server listening on port: $port');
  });

  serv.close();
}

void setCors(ServRequest req, ServResponse res) {
  res.response.headers.add('Access-Control-Allow-Origin', '*');
  res.response.headers.add('Access-Control-Allow-Methods', 'GET, POST, DELETE');
  res.response.headers
      .add('Access-Control-Allow-Headers', 'Origin, Content-Type');
  res.response.headers.add('Access-Control-Allow-Credentials', 'true');
}
