import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckData extends StatelessWidget {
  // Declare a field that holds the Person data
  final String message;

  // In the constructor, require a Person
  CheckData({Key key,this.message,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var person;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Screen With Data"),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Display passed data from first screen
              new Text("${message}"),
              new RaisedButton(
                  child: new Text("Go Back!"),
                  onPressed: () {
                    // Navigate back to first screen when tapped!
                    Navigator.pop(context);
                  }
              ),
            ],
          )
      ),
    );
  }
}