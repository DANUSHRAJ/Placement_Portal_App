import 'dart:developer';

import 'package:SJIT_PLACEMENT_PORTAL/src/Intership_upload.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
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

class _IntershipsState extends State<Interships> {
  final String regnovar;
  final String usernamevar;

  _IntershipsState({this.regnovar, this.usernamevar});

  List<IWCDetails> internDet = [];
  bool loading=false;

  var title, name, recno;

  void _loadInternDetails([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.api
        .getinternsDet(regnovar)
        .then((value) {
          setState(() {
            internDet = value;
            loading=false;
          });
        });
    Map<int, IWCDetails> map = internDet.asMap();
    for (int i = 0; i < map.length; i++) {
      title = map[i].title;
      name = map[i].name;
      recno = (i + 1).toString();
      log('Record: RecNo: $recno-Title: $title-Cmp Name: $name');
    }
  }

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadInternDetails(true);
//    log('$recno');
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        _loadInternDetails(true);
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => HomeScreen(
//                      regnovar: regnovar,
//                      usernamevar: usernamevar,
//                    )));
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
    final rollno = "dan";
    final List<IWCDetails> internDet1 = internDet;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.regnovar),
        centerTitle: true,
      ),
      body:  loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : InternListing(internDet: internDet,),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: IntershipUpload(
                          regnovar: regnovar, usernamevar: usernamevar)));
//              _loadInternDetails(true);
            },
            tooltip: 'Upload Internship',
            backgroundColor: Colors.purple,
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 10),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: buildBottomNavigationBar(),
//          ),
        ],
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
                  child: IntershipUpload(
                      regnovar: regnovar, usernamevar: usernamevar)));
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Interships(regnovar: regnovar, usernamevar: usernamevar,)));
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
