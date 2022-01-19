import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class Menatwork extends StatefulWidget {
  const Menatwork({Key key}) : super(key: key);

  @override
  _MenatworkState createState() => _MenatworkState();
}

class _MenatworkState extends State<Menatwork> {
  Widget _backButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child:
                  Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          //shadowColor: Colors.orangeAccent,
          leading: _backButton(context),
        ),
        body: Container(
            color: Colors.black,
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Lottie.asset("assets/images/underc.json"),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '\n\n\n\n\n\n\n\n\n\n\n\n\nWill Get Back To You Soon  ',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.adventPro(
                      fontSize: 30,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold),
                ),
              )
            ])));
  }
}
