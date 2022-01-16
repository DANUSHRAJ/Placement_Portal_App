import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
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
                  color: Colors.orangeAccent.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 30,
                  spreadRadius: 4)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black87, Colors.black87])),
        child: Text(
          'Login',
          // style: GoogleFonts.portLligatSans(
          //   textStyle: Theme.of(context).textTheme.display1,
          //   fontSize: 20,
          //   fontWeight: FontWeight.w700,
          //   color: Colors.deepOrangeAccent,
          // ),
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
        padding: EdgeInsets.symmetric(
          vertical: 14,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: Text(
          'Register now',
          // style: GoogleFonts.portLligatSans(
          //   textStyle: Theme.of(context).textTheme.display1,
          //   fontSize: 20,
          //   fontWeight: FontWeight.w700,
          //   color: Colors.white,
          // ),
        ),
      ),
    );
  }

  Widget _title() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: 'SJIT',
            // style: GoogleFonts.portLligatSans(
            //   textStyle: Theme.of(context).textTheme.display1,
            //   fontSize: 30,
            //   fontWeight: FontWeight.w700,
            //   color: Colors.orangeAccent,
            // ),
            children: [
              TextSpan(
                text: ' PLACEMENT ',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              TextSpan(
                text: 'PORTAL',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
              ),
            ]),
      ),
    );
  }

  Widget generateBluredImage() {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/rots.gif'),
          fit: BoxFit.cover,
        ),
      ),
      //I blured the parent container to blur background image, you can get rid of this part
      child: new BackdropFilter(
        filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          //you can change opacity with color here(I used black) for background.
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            generateBluredImage(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    Image.asset('assets/images/joseph.png',
                        width: 300, height: 150),
                    SizedBox(
                      height: 10,
                    ),
                    Align(alignment: Alignment.topCenter, child: _title()),
                    SizedBox(
                      height: 100,
                    ),
                    _submitButton(),
                    SizedBox(
                      height: 50,
                    ),
                    _signUpButton(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
