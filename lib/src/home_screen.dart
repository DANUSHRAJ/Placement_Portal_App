import 'package:SJIT_PLACEMENT_PORTAL/src/Courses.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_GenealD.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Placements.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Workshops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Widget/bezierContainer.dart';
import 'welcomePage.dart';

class HomeScreen extends StatelessWidget {
  final String regnovar;
  final String usernamevar;

  HomeScreen({
    Key key,
    this.regnovar,
    this.usernamevar,
  }) : super(key: key);
  Future showdialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text(message),
              actions: [
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text(
                      'Cancel',
                      style: GoogleFonts.adventPro(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    },
                    child: new Text(
                      'Exit',
                      style: GoogleFonts.adventPro(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                //Text("Confirm", TextStyle())),
              ],
            ));
  }

  Widget _backButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showdialog(context, "Click confirm to Log Out");
        // Navigator.pop(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen(regnovar: regnovar, usernamevar: usernamevar,)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Icon(Icons.home_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _showtoast(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.limeAccent,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    // to get size
    //var size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    // style
    // var cardTextStyle = TextStyle(
    //     fontFamily: "Montserrat Regular",
    //     fontSize: 14,
    //     color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child:
                  Image.asset('assets/images/inner_bg.gif', fit: BoxFit.cover)),
          Positioned(
              top: -height * .45,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: 26,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Welcome, $usernamevar",
                              style: GoogleFonts.adventPro(
                                  fontSize: 30,
                                  color: Colors.limeAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "$regnovar",
                              style: GoogleFonts.adventPro(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Have A great day",
                              style: GoogleFonts.adventPro(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: true,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          //PERSONAL DATA
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/767646/screenshots/1943995/team.gif',
                                  height: 95,
                                ),
                                Text(
                                  'PERSONAL DATA',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PpData(
                                          regnovar: regnovar,
                                          usernamevar: usernamevar,
                                        )));
                          },
                        ),

                        //TIMELINE
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/789033/screenshots/3685590/waiting.gif',
                                  height: 95,
                                ),
                                Text(
                                  'TIMELINE',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PpGenealD()));
                          },
                        ),

                        //INTERNS
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/1162077/screenshots/5403918/focus-animation.gif',
                                  height: 95,
                                ),
                                Text(
                                  'INTERNSHIPS',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: Interships(
                                        regnovar: regnovar,
                                        usernamevar: usernamevar)));
                          },
                        ),

                        //WORSHOPS
                        InkWell(
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/707433/screenshots/6720160/gears2.gif',
                                  height: 95,
                                ),
                                Text(
                                  'WORKSHOPS',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: Workshops(
                                        regnovar: regnovar,
                                        usernamevar: usernamevar)));
                          },
                        ),

                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/527271/screenshots/2470948/loop_2.gif',
                                  height: 95,
                                ),
                                Text(
                                  'COURSES',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: Courses()));
                          },
                        ),

                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn.dribbble.com/users/2344801/screenshots/4774578/alphatestersanimation2.gif',
                                  height: 95,
                                ),
                                Text(
                                  'PLACEMENTS',
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: Placements()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton(context)),
        ],
      ),
    );
  }

  welcomePage() {}
}
