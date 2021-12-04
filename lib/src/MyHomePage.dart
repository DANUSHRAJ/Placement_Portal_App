import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

ResetPass resetPassFromJson(String str) => ResetPass.fromJson(json.decode(str));

String resetPassToJson(ResetPass data) => json.encode(data.toJson());

class ResetPass {
  ResetPass({
    this.status,
    this.msg,
    this.error,
  });

  String status;
  String msg;
  String error;

  factory ResetPass.fromJson(Map<String, dynamic> json) => ResetPass(
        status: json["status"],
        msg: json["msg"] == null ? null : json["msg"],
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg == null ? null : msg,
        "error": error == null ? null : error,
      };
}

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    String jsonStringSuccess = '''
    {
 "status":"ok",
  "msg":"ok message"  
}
    ''';

    String jsonStringError = '''
    {
 "status":"error",  
  "error":"error message"
}
    ''';

    http.Response response = http.Response(jsonStringSuccess, 200);
    if (response.statusCode == 200) {
      ResetPass resetPassSuccess = resetPassFromJson(response.body);
      print("msg: ${resetPassSuccess.msg} error: ${resetPassSuccess.error}");
    }

    http.Response responseError = http.Response(jsonStringError, 200);
    if (responseError.statusCode == 200) {
      ResetPass resetPassError = resetPassFromJson(responseError.body);
      print("msg: ${resetPassError.msg} error: ${resetPassError.error}");
    }

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FORGET PWD"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
