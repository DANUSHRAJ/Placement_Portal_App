import 'dart:io';
import 'dart:ui';

import '../IWC/Courses.dart';
import '../IWC/Interships.dart';
import '../PROFILE/PP_GenealD.dart';
import '../IWC/Workshops.dart';
import 'menatwork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../PROFILE/PP_GenealD.dart';
import '../GENERAL/Size_congfig.dart';

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
                      if (Platform.isAndroid) {
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        });
                      } else if (Platform.isIOS) {
                        exit(0);
                      } else {
                        exit(0);
                      }
                    },
                    child: new Text(
                      'Yes',
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
        showdialog(context, "Are you sure to leave");
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

  Widget buildBlurryWidget(
      Widget _child, Widget __child, Widget ___child, Widget ____child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _child,
              __child,
              ___child,
              ____child,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        //shadowColor: Colors.orangeAccent,
        leading: _backButton(context),
        actions: [
          //IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.notifications_rounded),
              onPressed: () {
                _showtoast("No Notifications found");
              }),
        ],
        backgroundColor: Colors.transparent,
        elevation: 30,
      ),
      body: Stack(
        children: <Widget>[
          generateBluredImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    // height: SizeConfig.blockSizeVertical * 35,
                    // width: SizeConfig.blockSizeHorizontal * 100,
                    // //height: 90,
                    //margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(5),
                              width: width * 0.9,
                              child: buildBlurryWidget(
                                  Text(
                                    "\nHi,",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.adventPro(
                                        fontSize: 30,
                                        color: Colors.limeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$usernamevar".split(" ")[0],
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.adventPro(
                                        fontSize: 35,
                                        color: Colors.limeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$regnovar",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.adventPro(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Have A Great Day\n",
                                    textAlign: TextAlign.justify,
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
                                    builder: (context) => Menatwork()
                                    // PpGenealD(
                                    //       regnovar: regnovar,
                                    //       usernamevar: usernamevar,
                                    //     ))
                                    ));
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Menatwork()
                            // PpGenealD(
                            //       regnovar: regnovar,
                            //       usernamevar: usernamevar,
                            //     ))

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
                                    child: Menatwork()));

                            // Workshops(
                            //     regnovar: regnovar,
                            //     usernamevar: usernamevar)));
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
                                    child: Menatwork()));
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
                                    child: Menatwork()));
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
