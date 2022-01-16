import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/PP_CurrentEducation.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'profileapi.dart';

int Validation(BuildContext context, List<String> pe) {
  List<String> compareList = [
    '10TH PERCENTAGE',
    '10TH BOARD OF STUDY',
    '10TH MEDIUM OF STUDY',
    '10TH YEAR OF PASSING',
    'NAME OF SCHOOL',
    'GRADUATING STATE',
    '12TH PERCENTAGE',
    '12TH BOARD OF STUDY',
    '12TH MEDIUM OF STUDY',
    '12TH YEAR OF PASSING',
    'NAME OF SCHOOL',
    'GRADUATING STATE',
    'DIPLOMA - SPECIALIZATION/BRANCH',
    'DIPLOMA PERCENTAGE',
    'DIPLOMA YEAR OF PASSING',
    'NAME OF THE INSTITUTE',
    'GRADUATING STATE',
    'UG DEGREE (FOR PG STUDENTS)',
    'UG BRANCH (FOR PG STUDENTS)',
    'UG PERCENTAGE (FOR PG STUDENTS)',
    'UG CGPA (FOR PG STUDENTS)',
    'UG YEAR OF PASSING (FOR PG STUDENTS)',
    'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)',
    'UG - GRADUATING UNIVERSITY',
    'GRADUATING STATE'
  ];
  int check = -1;

  Future showdialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: Center(
                child: new Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                Center(
                  child: new FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black),
                      ),
                      color: Colors.deepPurpleAccent,
                      splashColor: Colors.purpleAccent,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("OK")),
                ),
              ],
            ));
  }

//  for (int i = 0; i < pe.length; i++) {
//    if (pe[i] == null || pe[i].isEmpty) {
//      check = i;
//      break;
//    }
//  }
//  if (check != -1) {
//    showdialog(context, "please fill the " + compareList[check]);
//    //print(compareList[check]+" was left blank");
//    return -1;
//  }
//  //year
//  if (!RegExp(r'^\d{4}$').hasMatch(pe[3])) {
//    showdialog(context, "Please Check the " + compareList[3]);
//    return -1;
//    // print("10th passing");
//  }
//  if (!RegExp(r'^\d{4}$').hasMatch(pe[9])) {
//    //print("12th passing");
//    showdialog(context, "Please Check the " + compareList[9]);
//    return -1;
//  }
//
//  //percentage
//  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
//      .hasMatch(pe[0])) {
//    //print("10th percentage");
//    showdialog(context, "Please Check the " + compareList[0]);
//    return -1;
//  }
//  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
//      .hasMatch(pe[9])) {
//    //print("12th percentage");
//    showdialog(context, "Please Check the " + compareList[9]);
//    return -1;
//  }

  return 1;
}

class PpEducationD extends StatefulWidget {
  String regnovar;
  String usernamevar;

  PpEducationD({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  final ProfileApi papi = ProfileApi();

  @override
  _PpEducationDState createState() =>
      _PpEducationDState(regnovar: regnovar, usernamevar: usernamevar);
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpEducationDState extends State<PpEducationD> {
  String regnovar;
  String usernamevar;
  bool loading = false;

  _PpEducationDState({this.regnovar, this.usernamevar});

  void _loadUploadedData([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.papi.getEducationD(regnovar).then((value) {
//      print('In PP_GenealD: $value');
      String temp1 = value.toString();
//      print('$temp1');
      if (value.runtimeType == Null) {
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        pe[0] = value.tp;
        pe[1] = value.tbs;
        pe[2] = value.tms;
        pe[3] = value.tyop;
        pe[4] = value.tsn;
        pe[5] = value.tgs;
        pe[6] = value.twp;
        pe[7] = value.twbs;
        pe[8] = value.twms;
        pe[9] = value.twyop;
        pe[10] = value.twsn;
        pe[11] = value.twgs;
        pe[12] = value.dspec;
        pe[13] = value.dp;
        pe[14] = value.dyop;
        pe[15] = value.dsn;
        pe[16] = value.dgs;
        pe[17] = value.ugdeg;
        pe[18] = value.ugbranch;
        pe[19] = value.ugp;
        pe[20] = value.ugcgpa;
        pe[21] = value.ugyop;
        pe[22] = value.ugclg;
        pe[23] = value.ugguniv;
        pe[24] = value.ugs;
//        dropbox[0].title=value.title;
//        dropbox[0].title=value.title;
//        vregno = value.regno;
//        vname = value.name;
//        vemail = value.username;
//        internDet = value;
        loading = false;
      });
    });
  }

  void _uploadtoDB(BuildContext context, List<String> pg,
      [bool showSpinner = false]) async {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    final String uregno = regnovar;
    final String tp = pe[0]; //Tenth Percentage
    final String tbs = pe[1]; //Tenth Board of Study
    final String tms = pe[2]; //Tenth Medium of Study
    final String tyop = pe[3]; //Tenth Year of Passing
    final String tsn = pe[4]; //Tenth School Name
    final String tgs = pe[5]; //Tenth graduating State
    final String twp = pe[6];
    final String twbs = pe[7];
    final String twms = pe[8];
    final String twyop = pe[9];
    final String twsn = pe[10];
    final String twgs = pe[11];
    final String dspec = pe[12];
    final String dp = pe[13];
    final String dyop = pe[14];
    final String dsn = pe[15];
    final String dgs = pe[16];
    final String ugdeg = pe[17];
    final String ugbranch = pe[18];
    final String ugp = pe[19];
    final String ugcgpa = pe[20];
    final String ugyop = pe[21];
    final String ugclg = pe[22];
    final String ugguniv = pe[23];
    final String ugs = pe[24];

    await widget.papi.uploadEducationD(
        uregno,
        tp,
        tbs,
        tms,
        tyop,
        tsn,
        tgs,
        twp,
        twbs,
        twms,
        twyop,
        twsn,
        twgs,
        dspec,
        dp,
        dyop,
        dsn,
        dgs,
        ugdeg,
        ugbranch,
        ugp,
        ugcgpa,
        ugyop,
        ugclg,
        ugguniv,
        ugs);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUploadedData(true);
  }

  List<String> pe = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryFieldalphabets(String title, String hint, int i,
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
            onChanged: (value) => setState(() => pe[i] = value),
          )
        ],
      ),
    );
  }

  Widget _entryFieldnumbers(String title, String hint, int i,
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
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
            keyboardType: TextInputType.number,
            onChanged: (value) => setState(() => pe[i] = value),

            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: _backButton(),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'EDUCATION',
              style: GoogleFonts.portLligatSans(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: '  DATA',
                  style: GoogleFonts.adventPro(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.limeAccent,
                  ),
                ),
              ]),
        ),
      ],
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
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
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
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "EDUCATION DATA",
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
          // actions: [
          //   IconButton(icon: Icon(Icons.home_outlined), onPressed: () {}),
          // ],
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: loading
            ? Center(child: Lottie.asset('assets/images/loading1.json'))
            : Container(
                height: height,
                child: Stack(children: <Widget>[
                  generateBluredImage(),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // SizedBox(height: height * .05),
                          // Align(alignment: Alignment.center, child: _title()),
                          SizedBox(height: height * .2),
                          _entryFieldnumbers('10th Percentage', pe[0], 0),
                          _entryFieldalphabets('10TH BOARD OF STUDY', pe[1], 1),
                          _entryFieldalphabets(
                              '10TH MEDIUM OF STUDY', pe[2], 2),
                          _entryFieldnumbers('10th YEAR OF PASSING', pe[3], 3),
                          _entryFieldalphabets('NAME OF SCHOOL', pe[4], 4),
                          _entryFieldalphabets('GRADUATING STATE', pe[5], 5),
                          _entryFieldnumbers('12th Percentage', pe[6], 6),
                          _entryFieldalphabets('12th BOARD OF STUDY', pe[7], 7),
                          _entryFieldalphabets(
                              '12th MEDIUM OF STUDY', pe[8], 8),
                          _entryFieldnumbers('12th YEAR OF PASSING', pe[9], 9),
                          _entryFieldalphabets('NAME OF SCHOOL', pe[10], 10),
                          _entryFieldalphabets('GRADUATING STATE', pe[11], 11),
                          _entryFieldalphabets(
                              'DIPLOMA - SPECIALIZATION/BRANCH', pe[12], 12),
                          _entryFieldnumbers('DIPLOMA Percentage', pe[13], 13),
                          _entryFieldnumbers(
                              'DIPLOMA YEAR OF PASSING', pe[14], 14),
                          _entryFieldalphabets('NAME OF INSTITUTE', pe[15], 15),
                          _entryFieldalphabets('GRADUATING STATE', pe[16], 16),
                          _entryFieldalphabets(
                              'UG DEGREE (FOR PG STUDENTS) ', pe[17], 17),
                          _entryFieldalphabets(
                              'UG BRANCH (FOR PG STUDENTS) ', pe[18], 18),
                          _entryFieldnumbers(
                              'UG PERCENTAGE (FOR PG STUDENTS)', pe[19], 19),
                          _entryFieldnumbers(
                              'UG CGPA (FOR PG STUDENTS)', pe[20], 20),
                          _entryFieldnumbers(
                              'UG YEAR OF PASSING (FOR PG STUDENTS)',
                              pe[21],
                              21),
                          _entryFieldalphabets(
                              'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)) ',
                              pe[22],
                              22),
                          _entryFieldalphabets(
                              'UG - GRADUATING UNIVERSITY ', pe[23], 23),
                          _entryFieldalphabets('GRADUATING STATE', pe[24], 24),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xFFE96710),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                if (Validation(context, pe) == 1) {
                                  _uploadtoDB(context, pe);
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: PpCurrentD(regnovar: regnovar, usernamevar: usernamevar,)));
                                }
                              },
                              label: Text('NEXT'),
                              icon: Icon(Icons.arrow_right_alt_rounded),
                            ),
                          ),
                          SizedBox(height: height * .04),
                        ],
                      )))
                ]),
              ));
  }
}
