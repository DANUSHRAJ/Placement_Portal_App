import 'package:SJIT_PLACEMENT_PORTAL/src/Courses.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CoursesUpload extends StatefulWidget {
  const CoursesUpload({Key key}) : super(key: key);

  @override
  _CoursesUploadState createState() => _CoursesUploadState();
}

class _CoursesUploadState extends State<CoursesUpload> {
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

  Widget _entryFieldalphabets(String title, String hint,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.portLligatSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _entryFieldDob(String title, String hint, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.portLligatSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.limeAccent,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
            keyboardType: TextInputType.number,
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
          )
        ],
      ),
    );
  }

  Widget _submitButton(String title) {
    return InkWell(
      onTap: () {
        //_findAccount(etRegisterNo.text, etPassword.text);
        // Navigator.pop(
        //     context, MaterialPageRoute(builder: (context) => ()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //       color: Colors.purple.shade200,
            //       offset: Offset(2, 4),
            //       blurRadius: 5,
            //       spreadRadius: 1)
            // ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black87, Colors.black87])),
        child: Text(
          title,
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.limeAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'COU',
        style: GoogleFonts.portLligatSans(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        children: [
          TextSpan(
            text: 'RSES',
            style: GoogleFonts.adventPro(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: '\nUPL',
            style: GoogleFonts.adventPro(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.orangeAccent,
            ),
          ),
          TextSpan(
            text: 'OAD',
            style: GoogleFonts.adventPro(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.lightGreenAccent,
            ),
          ),
        ],
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
              ),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.height * .45,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .1),
                    _backButton(),
                    _title(),
                    SizedBox(height: height * .05),
                    _entryFieldalphabets("TITLE OF THE COURSE",
                        "eg:Java,SpringBoot,C++,Python,ML"),
                    _entryFieldalphabets(
                        "ORGANIZATION NAME", "eg:Coursera,EDX,Udemy"),
                    _entryFieldDob("START DATE", "DD-MM-YYYY"),
                    _entryFieldDob("END DATE", "DD-MM-YYYY"),
                    _entryFieldalphabets("CERTIFICATE VERIFICATION",
                        "Enter link Or Certificate Id"),
                    _entryFieldalphabets("PROJECT RELATED LINKS",
                        "Github links or website links or Docker Links"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Card(
                              color: Colors.amberAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '\n     UPLOAD HERE    \n',
                                    style: GoogleFonts.adventPro(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: PpData()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      child: Text(
                        "\n\n*ONLY .PDF FORMAT IS ACCEPTED.\n\n*FILE SIZE MUST BE LESS THAN 2 mb.\n\n",
                        style: GoogleFonts.adventPro(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _submitButton("SUBMIT"),
                    SizedBox(height: height * .15),
                  ],
                ),
              ),
            ),

            //SizedBox(height: height * .67),
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
      currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 1) {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: Courses()));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: CoursesUpload()));
        }
        setState(() {
          _selectedIndex = value;
        });
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.limeAccent,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.upload_file), label: "UPLOAD CERTIFICATES"),
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
      ],
    );
  }
}
