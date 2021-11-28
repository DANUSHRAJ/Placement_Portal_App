import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SJIT_PLACEMENT_PORTAL/main.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/signup.dart';



class SecondScreenWithData extends StatelessWidget {
  // Declare a field that holds the Person data
  final String name;
  final String Reg_no;
  final String email_id;
  final String pass_wd;

  // In the constructor, require a Person
  SecondScreenWithData({Key key,this.name,this.Reg_no,this.email_id,this.pass_wd,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var person;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen With Data"),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Display passed data from first screen
              new Text("Person Data  \nname: ${name} \nReg_no:${Reg_no}\nemail_id:${email_id} \npassword:${pass_wd}"),
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