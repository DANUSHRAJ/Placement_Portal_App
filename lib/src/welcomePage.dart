import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/bezierContainer.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        padding: EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.purple.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black87, Colors.black87])),
        child: Text(
          'Login',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.limeAccent,
          ),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        padding: EdgeInsets.symmetric(vertical: 14,),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Text(
          'Register now',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'SJIT',
            style: GoogleFonts.portLligatSans(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: ' PLACEMENT ',
                style: TextStyle(color: Colors.limeAccent, fontSize: 30),
              ),
              TextSpan(
                text: 'PORTAL',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/inner_bg.gif',
                  fit: BoxFit.fitHeight,
                )),
            Positioned(
                top: -height * .47,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _title(),
                  SizedBox(
                    height: 90,
                  ),
                  _submitButton(),
                  SizedBox(
                    height: 50,
                  ),
                  _signUpButton(),
                  // SizedBox(
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
