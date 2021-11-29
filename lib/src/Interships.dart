import 'package:SJIT_PLACEMENT_PORTAL/src/Intership_upload.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Interships extends StatefulWidget {
  const Interships({Key key}) : super(key: key);

  @override
  _IntershipsState createState() => _IntershipsState();
}

class _IntershipsState extends State<Interships> {
  int _selectedIndex = 0;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
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
          text: 'INTERN',
          style: GoogleFonts.portLligatSans(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'SHIP',
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
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/inner_bg.gif',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.height * .45,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .1),
                    Align(alignment: Alignment.center, child: _title()),
                    SizedBox(height: height * .05),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                ' UPCOMING INTERSHIPS ',
                                style: GoogleFonts.adventPro(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       PageTransition(
                        //           type: PageTransitionType.bottomToTop,
                        //           child: PpData()));
                        // },
                      ),
                    ),
                    SizedBox(height: height * .4),
//VIEW YOUR COMPLETED INTERSHIPS
                    Positioned(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                ' COMPLETED INTERSHIPS ',
                                style: GoogleFonts.adventPro(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       PageTransition(
                        //           type: PageTransitionType.bottomToTop,
                        //           child: PpData()));
                        // },
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .67),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
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
                  child: IntershipUpload()));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Interships()));
        }
        // setState(() {
        //   _selectedIndex = value;
        // });
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.limeAccent,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(Icons.upload_file), label: "UPLOAD CERTIFICATES"),
      ],
    );
  }
}
