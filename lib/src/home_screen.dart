import 'dart:ui';

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

import 'PP_GenealD.dart';
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
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          //you can change opacity with color here(I used black) for background.
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget buildBlurryWidget(Widget _child, Widget __child, Widget ___child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _child,
              __child,
              ___child,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // to get size
    //var size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        //shadowColor: Colors.orangeAccent,
        leading: _backButton(context),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_rounded), onPressed: () {}),
        ],
        backgroundColor: Colors.transparent,
        elevation: 30,
      ),
      body: Stack(
        children: <Widget>[
          generateBluredImage(),
          SizedBox(
            height: 26,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    //height: 90,
                    // margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(
                        //   width: 26,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // SizedBox(height: height * .03),
                            Container(
                              child: buildBlurryWidget(
                                  Text(
                                    "\n    Welcome, $usernamevar    ",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 30,
                                        color: Colors.limeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$regnovar",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Have A Great Day\n",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
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
                                Image.asset(
                                  "assets/images/Pdata.gif",
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
                                    builder: (context) => PpGenealD(
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
                                Image.asset(
                                  'assets/images/Timeline.gif',
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
                                    builder: (context) => PpGenealD(
                                          regnovar: regnovar,
                                          usernamevar: usernamevar,
                                        )));
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
                                Image.asset(
                                  'assets/images/Interns.gif',
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
                                Image.asset(
                                  'assets/images/workshops.gif',
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
                                Image.asset(
                                  'assets/images/courses.gif',
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
                                Image.asset(
                                  'assets/images/Placem.gif',
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
                                    child: HomeScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  welcomePage() {}
}
