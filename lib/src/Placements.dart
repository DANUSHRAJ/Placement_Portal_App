import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Placement_Upload.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Placements extends StatefulWidget {
  const Placements({Key key}) : super(key: key);

  @override
  _PlacementsState createState() => _PlacementsState();
}

class _PlacementsState extends State<Placements> {
  int _selectedIndex = 0;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            //add regnovar and usernamevar in home screen
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.home_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'PLACE',
          style: GoogleFonts.portLligatSans(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'MENT',
              style: GoogleFonts.adventPro(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '\nHO',
              style: GoogleFonts.adventPro(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.orangeAccent,
              ),
            ),
            TextSpan(
              text: 'ME',
              style: GoogleFonts.adventPro(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.lightGreenAccent,
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/images/inner_bg.gif', fit: BoxFit.cover),
      ),
      Positioned(
        top: -MediaQuery.of(context).size.height * .45,
        right: -MediaQuery.of(context).size.width * .4,
        child: BezierContainer(),
      ),
      Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: height * .03),
                    Align(alignment: Alignment.topLeft, child: _backButton()),
                    Align(alignment: Alignment.topCenter, child: _title()),

                    SizedBox(height: height * .05),

                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                ' UPCOMING DREAM JOBS ',
                                style: GoogleFonts.adventPro(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //INNER DETAILS
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          color: Colors.cyanAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("")),
                              Align(
                                // child: Container(
                                //   padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SingleChildScrollView(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              elevation: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    ' \n 1.\n  NAME OF THE INTERN:              \n\n  ORGANIZATION NAME:                \n\n',
                                                    style:
                                                        GoogleFonts.adventPro(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              elevation: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    ' \n 2.\n  JOB ROLE:              \n\n  ORGANIZATION NAME:                \n\n',
                                                    style:
                                                        GoogleFonts.adventPro(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    scrollDirection: Axis.horizontal),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //CONTINUE HERE
                    //
                    SizedBox(height: height * .1),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                ' YOUR DREAM OFFERS ',
                                style: GoogleFonts.adventPro(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //INNER DETAILS
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "   \nTOTAL NUMBER OF OFFERS:\n",
                                    style: GoogleFonts.portLligatSans(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              Align(
                                // child: Container(
                                //   padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SingleChildScrollView(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              elevation: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    ' \n 1.\n  ROLE SELECTED FOR:              \n\n  ORGANIZATION NAME:                \n\n',
                                                    style:
                                                        GoogleFonts.adventPro(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: InkWell(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              elevation: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    ' \n 2.\n  ROLE SELECTED FOR:              \n\n  ORGANIZATION NAME:                \n\n',
                                                    style:
                                                        GoogleFonts.adventPro(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
//VIEW YOUR COMPLETED INTERSHIPS
                                      ],
                                    ),
                                    scrollDirection: Axis.horizontal),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .03),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildBottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    ])));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      //currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 1) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: PlacementUpload()));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Placements()));
        }
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.limeAccent,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(Icons.upload_file), label: "UPLOAD OFFER LETTER"),
      ],
    );
  }
}
