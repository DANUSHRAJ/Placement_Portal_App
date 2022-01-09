import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Extra.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

int Validation(BuildContext context, List<String> pp) {
  List<String> compareList = [
    'LAND LINE NUMBER',
    'PRIMARY MOBILE NO',
    'EMERGENCY CONTACT NO',
    'PRIMARY EMAIL ID',
    'ALTERNATE EMAIL ID',
    'PAN CARD NUMBER',
    'NATIONALITY',
    'INDIAN PASSPORT NUMBER',
    'AADHAAR NUMBER',
    'FATHER NAME',
    'DESIGNATION & ORGANISATION',
    'FATHER MOBILE NUMBER',
    'FATHER EMAIL ID',
    'MOTHER NAME',
    'DESIGNATION & ORGANISATION',
    'MOTHER MOBILE NUMBER',
    'MOTHER EMAIL ID',
    'PERMANENT ADDRESS WITH PIN CODE',
    'PERMANENT ADDRESS LINE 1',
    'PERMANENT ADDRESS LINE 2',
    'PERMANENT CITY',
    'STATE',
    'POSTAL CODE',
  ];

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

  int check = -1;
  for (int i = 0; i < pp.length; i++) {
    if (pp[i] == 'null' || pp[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }

  // phone number
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[0])) {
    //print("land line number");
    showdialog(context, "Please Check the " + compareList[0]);
    return -1;
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[1])) {
    //print("primary number");
    showdialog(context, "Please Check the " + compareList[1]);
    return -1;
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[2])) {
    //print("emergency number");
    showdialog(context, "Please Check the " + compareList[2]);
    return -1;
  }

  //email id
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$').hasMatch(pp[3])) {
    //print("primary");
    showdialog(context, "Please Check the " + compareList[3]);
    return -1;
  }
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$').hasMatch(pp[4])) {
    //print("alternate");
    showdialog(context, "Please Check the " + compareList[4]);
    return -1;
  }

  //pancard
  if (!RegExp(r'[A-Z]{3}[ABCFGHLJPTF]{1}[A-Z]{1}[0-9]{4}[A-Z]{1}$')
      .hasMatch(pp[5])) {
    //print("pan card");
    showdialog(context, "Please Check the " + compareList[5]);
    return -1;
  }

  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pp[9]))) {
    showdialog(context, "Please Check the " + compareList[9]);
    return -1;
    //print("father name");
  }

  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[11])) {
    //print("father's mobile number");
    showdialog(context, "Please Check the " + compareList[11]);
    return -1;
  }

  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(pp[12])) {
    //print("father email id");
    showdialog(context, "Please Check the " + compareList[12]);
    return -1;
  }

  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pp[13]))) {
    showdialog(context, "Please Check the " + compareList[13]);
    return -1;
    //print("mother name");
  }

  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[15])) {
    //print("mother's mobile number");
    showdialog(context, "Please Check the " + compareList[15]);
    return -1;
  }

  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(pp[16])) {
    //print("mother email id");
    showdialog(context, "Please Check the " + compareList[16]);
    return -1;
  }

  //postal code
  if (!RegExp(r'^\d{6}$').hasMatch(pp[22])) {
    //print("postal code");
    showdialog(context, "Please Check the " + compareList[22]);
    return -1;
  }
  return 1;
}

class PpPersonalD extends StatefulWidget {
  const PpPersonalD({Key key}) : super(key: key);

  @override
  _PpPersonalDState createState() => _PpPersonalDState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpPersonalDState extends State<PpPersonalD> {
  bool loading = false;
  List<String> pp = [
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null'
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
              child: Icon(Icons.home_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryFieldalphabetsdisplay(String title, String hint, int i,
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
            enabled: false,
            onChanged: (value) => setState(() => pp[i] = value),
          )
        ],
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
            onChanged: (value) => setState(() => pp[i] = value),
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
            onChanged: (value) => setState(() => pp[i] = value),

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
              text: 'PERSONAL',
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "PERSONAL DATA",
            style: GoogleFonts.adventPro(
                fontSize: 30,
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
            ? Center(
                child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_rru67jvx.json'))
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
                          SizedBox(height: height * .2),
                          _entryFieldnumbers('LAND LINE NUMBER', '', 0),
                          _entryFieldnumbers('PRIMARY MOBILE NO', '', 1),
                          _entryFieldnumbers('EMERGENCY CONTACT NO', '', 2),
                          _entryFieldalphabetsdisplay(
                              'PRIMARY EMAIL ID', 'email', 3),
                          _entryFieldalphabets(
                              'ALTERNATE EMAIL ID', 'abc@gmail.com', 4),
                          _entryFieldalphabets('PAN CARD NUMBER', '', 5),
                          _entryFieldalphabets('NATIONALITY', '', 6),
                          _entryFieldalphabets('INDIAN PASSPORT NUMBER', '', 7),
                          _entryFieldnumbers('AADHAAR NUMBER', '', 8),
                          _entryFieldalphabets('FATHER NAME', '', 9),
                          _entryFieldalphabets(
                              'DESIGNATION & ORGANISATION', '', 10),
                          _entryFieldnumbers('FATHER MOBILE NUMBER', '', 11),
                          _entryFieldalphabets('FATHER EMAIL ID', '', 12),
                          _entryFieldalphabets('MOTHER NAME', '', 13),
                          _entryFieldalphabets(
                              'DESIGNATION & ORGANISATION', '', 14),
                          _entryFieldnumbers('MOTHER MOBILE NUMBER', '', 15),
                          _entryFieldalphabets('MOTHER EMAIL ID', '', 16),
                          _entryFieldalphabets(
                              'PERMANENT ADDRESS WITH PIN CODE', '', 17),
                          _entryFieldalphabets(
                              'PERMANENT ADDRESS LINE 1', '', 18),
                          _entryFieldalphabets(
                              'PERMANENT ADDRESS LINE 2', '', 19),
                          _entryFieldalphabets('PERMANENT CITY', '', 20),
                          _entryFieldalphabets('STATE', 'Tamil Nadu', 21),
                          _entryFieldnumbers('POSTAL CODE', '', 22),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xFFE96710),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                // if (Validation(context, pg, dropbox) == 1) {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: PpExtraD()));
                                //}
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
