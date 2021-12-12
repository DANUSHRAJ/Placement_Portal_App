import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Intership_upload.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'IWCDetails.dart';
import 'InternListing.dart';
import 'internapi.dart';

class Interships extends StatefulWidget {
  final String regnovar;
  final String usernamevar;

  final InternsApi api = InternsApi();

  Interships({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  @override
  _IntershipsState createState() =>
      _IntershipsState(regnovar: regnovar, usernamevar: usernamevar);
}

class _IntershipsState extends State<Interships> with TickerProviderStateMixin {
  final String regnovar;
  final String usernamevar;

  _IntershipsState({this.regnovar, this.usernamevar});

  List<IWCDetails> internDet = [];
  bool loading = false;

  var title, name, recno;

  get child => null;

  void _loadInternDetails([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.api.getinternsDet(regnovar).then((value) {
      setState(() {
        internDet = value;
        loading = false;
      });
    });
    Map<int, IWCDetails> map = internDet.asMap();
    for (int i = 0; i < map.length; i++) {
      title = map[i].title;
      name = map[i].name;
      recno = (i + 1).toString();
      //log('Record: RecNo: $recno-Title: $title-Cmp Name: $name');
    }
  }

  int _selectedIndex = 0;
  FToast fToast;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    _loadInternDetails(true);
    fToast = FToast();
    fToast.init(context);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
              text: '\nCOMP',
              style: GoogleFonts.adventPro(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.orangeAccent,
              ),
            ),
            TextSpan(
              text: 'LETED',
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
    final rollno = "dan";
    final List<IWCDetails> internDet1 = internDet;
    return Scaffold(
      body: loading
          ? Center(
              child: Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_rru67jvx.json')
              // CircularProgressIndicator(
              //   value: controller.value,
              // ),
              )
          : Stack(children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/inner_bg.gif',
                  fit: BoxFit.cover,
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
                        Align(alignment: Alignment.topCenter, child: _title()),
                      ]))),
              Align(
                alignment: Alignment.topRight,
                child: InternListing(
                  internDet: internDet,
                ),
              ),
              SizedBox(height: height * 10),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildBottomNavigationBar(),
                ),
              ),
            ]),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      //currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 2) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: IntershipUpload(
                      regnovar: regnovar, usernamevar: usernamevar)));
        } else if (value == 1) {
          _showtoast("NO UPCOMING INTERNS");
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: Interships(
                    regnovar: regnovar,
                    usernamevar: usernamevar,
                  )));
        }
        // setState(() {
        //   _selectedIndex = value;
        // });
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.limeAccent,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined), label: "COMPLETED"),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded), label: "UPCOMING"),
        BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: "UPLOAD"),
      ],
    );
  }
}
