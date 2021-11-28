import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreenWithData extends StatelessWidget {
  // Declare a field that holds the Person data
  final String Reg_no;
  final String pass_wd;

  // In the constructor, require a Person
  FirstScreenWithData({Key key,this.Reg_no,this.pass_wd,}) : super(key: key);

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
              new Text("Person Data\nReg_no:${Reg_no}\npassword:${pass_wd}"),
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