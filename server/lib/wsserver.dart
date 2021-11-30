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
  final coll = db.collection('workshop');

  // Create server
  const port = 8083;
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

  serv.get('/', [
    setCors,
        (ServRequest req, ServResponse res) async {
      final ws = await coll.find().toList();
      return res.status(200).json({'workshop': ws});
    }
  ]);

  serv.post('/', [
    setCors,
        (ServRequest req, ServResponse res) async {
      await coll.save(req.body);
//      log('$req.body');
      return res.json(
        await coll.findOne(where.eq('title', req.body['title'])),
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
