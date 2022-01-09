import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Personal.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

Future<int> Validation(
    BuildContext context, List<String> pce, NewObject noArrears) async {
  int check = -1;

  List<String> compareList = [
    'SEM1 GPA',
    'SEM2 GPA',
    'SEM3 GPA',
    'SEM4 GPA',
    'SEM5 GPA',
    'SEM6 GPA',
    'SEM7 GPA',
    'SEM8 GPA',
    'OVERALL CGPA',
    'NO OF ARREARS SEM 1',
    'NO OF ARREARS SEM 2',
    'NO OF ARREARS SEM 3',
    'NO OF ARREARS SEM 4',
    'NO OF ARREARS SEM 5',
    'NO OF ARREARS SEM 6',
    'NO OF ARREARS SEM 7',
    'NO OF ARREARS SEM 8',
    'TOTAL NO OF STANDING ARREARS',
    'if yes how many',
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

  for (int i = 0; i < pce.length; i++) {
    if (pce[i] == 'null' || pce[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }

  if (noArrears.title == 'SELECT THE OPTION') {
    showdialog(context, "please select the Valid OPTION");
    return 0;
  }

  //gpa
  for (int i = 0; i < 9; i++) {
    if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
        .hasMatch(pce[i])) {
      //print(compareList[i]+" was invalid");
      showdialog(context, "Please Check the " + compareList[i]);
      return -1;
    }
  }
  //arrear
  for (int i = 9; i < 19; i++) {
    if (!RegExp(r'^(?:[1-9]|[1-4][0-9]|50)$').hasMatch(pce[i])) {
      //print(compareList[i]+" was invalid");
      showdialog(context, "Please Check the " + compareList[i]);
      return -1;
    }
  }
}

class PpCurrentD extends StatefulWidget {
  const PpCurrentD({Key key}) : super(key: key);

  @override
  _PpCurrentDState createState() => _PpCurrentDState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpCurrentDState extends State<PpCurrentD> {
  bool loading = false;

  List<String> pce = [
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

  static final List<NewObject> yesorno = <NewObject>[
    NewObject('SELECT THE OPTION', Icons.description),
    NewObject('YES', Icons.arrow_back_ios),
    NewObject('NO', Icons.arrow_back_ios),
  ];

  NewObject no_arrears = yesorno.first;

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

  Widget _DropBox(
    String title,
    List<NewObject> key,
  ) {
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
          Container(
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              //border: Border.all(color: Colors.deepOrange, width: 4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<NewObject>(
                value: no_arrears, // currently selected item
                items: key
                    .map((item) => DropdownMenuItem<NewObject>(
                          child: Row(
                            children: [
                              Icon(item.icon),
                              const SizedBox(width: 8),
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                  no_arrears = value;
                }),
              ),
            ),
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

            onChanged: (value) => setState(() => pce[i] = value),

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
              text: 'CURRENT EDUCATION',
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
            "CURRENT EDUCATION DATA",
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
                          _entryFieldnumbers('SEM1 GPA', 'Eg:7.12', 0),
                          _entryFieldnumbers('SEM2 GPA', 'Eg:7.12', 1),
                          _entryFieldnumbers('SEM3 GPA', 'Eg:7.12', 2),
                          _entryFieldnumbers('SEM4 GPA', 'Eg:7.12', 3),
                          _entryFieldnumbers('SEM5 GPA', 'Eg:7.12', 4),
                          _entryFieldnumbers('SEM6 GPA', 'Eg:7.12', 5),
                          _entryFieldnumbers('SEM7 GPA', 'Eg:7.12', 6),
                          _entryFieldnumbers('SEM8 GPA', 'Eg:7.12', 7),
                          _entryFieldnumbers('OVERALL GPA', 'Eg:7.12', 8),
                          _entryFieldnumbers('NO OF ARREARS SEM 1',
                              'if there is no arrears enter 0', 9),
                          _entryFieldnumbers('NO OF ARREARS SEM 2',
                              'if there is no arrears enter 0', 10),
                          _entryFieldnumbers('NO OF ARREARS SEM 3',
                              'if there is no arrears enter 0', 11),
                          _entryFieldnumbers('NO OF ARREARS SEM 4',
                              'if there is no arrears enter 0', 12),
                          _entryFieldnumbers('NO OF ARREARS SEM 5',
                              'if there is no arrears enter 0', 13),
                          _entryFieldnumbers('NO OF ARREARS SEM 6',
                              'if there is no arrears enter 0', 14),
                          _entryFieldnumbers('NO OF ARREARS SEM 7',
                              'if there is no arrears enter 0', 15),
                          _entryFieldnumbers('NO OF ARREARS SEM 8',
                              'if there is no arrears enter 0', 16),
                          _entryFieldnumbers('TOTAL NO OF STANDING ARREARS',
                              'if there is no arrears enter 0', 17),
                          _DropBox("HISTORY OF ARREARS [Y/N]", yesorno),
                          _entryFieldnumbers('IF YES, HOW MANY?',
                              'if there is no arrears enter 0', 18),
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
                                        child: PpPersonalD()));
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
