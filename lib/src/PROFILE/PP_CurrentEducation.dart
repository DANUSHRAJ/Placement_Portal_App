import 'dart:ui';

import 'PP_Education.dart';
import 'PP_Personal.dart';

import '../GENERAL/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../api/profileapi.dart';

int Validation(BuildContext context, List<String> pce, NewObject noArrears) {
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
    pce[i] = pce[i].toUpperCase();
    if (pce[i] == null || pce[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }
//
  if (noArrears.title == 'SELECT THE OPTION') {
    showdialog(context, "please select the Valid OPTION");
    return 0;
  }
//
//  //gpa
  for (int i = 0; i < 9; i++) {
    if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
            .hasMatch(pce[i]) &&
        pce[i] != '-') {
      //print(compareList[i]+" was invalid");
      showdialog(context, "Please Check the " + compareList[i]);
      return -1;
    }
  }
//  //arrear
  for (int i = 9; i < 19; i++) {
    if (!RegExp(r'^[0-9]+$').hasMatch(pce[i]) && pce[i] != '-') {
      //print(compareList[i]+" was invalid");
      showdialog(context, "Please Check the " + compareList[i]);
      return -1;
    }
  }
  // int sum=0;
  // for(int i=9;i<17;i++){
  //   sum+=int.parse(pce[i]);
  // }
  // if(sum!=int.parse(pce[17])){
  //   showdialog(context, "Please Check the No. of ARREARS are given correctly");
  //   return -1;
  // }
  return 1;
}

class PpCurrentD extends StatefulWidget {
  String regnovar;
  String usernamevar;

  PpCurrentD({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  final ProfileApi papi = ProfileApi();

  @override
  _PpCurrentDState createState() =>
      _PpCurrentDState(regnovar: regnovar, usernamevar: usernamevar);
}

class NewObject {
  String title;
  IconData icon;

  NewObject(this.title, this.icon);
}

class _PpCurrentDState extends State<PpCurrentD> {
  String regnovar;
  String usernamevar;
  bool loading = false;

  _PpCurrentDState({this.regnovar, this.usernamevar});

  void _loadUploadedData([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.papi.getCurrentD(regnovar).then((value) {
//      print('In PP_GenealD: $value');
//      String temp1 = value.toString();
//      print('$temp1');
//      if(temp1=='null'||temp1.isEmpty){
//        print(value.runtimeType);
      if (value.runtimeType == Null || value.gpa1.runtimeType == Null) {
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        pce[0] = value.gpa1;
        pce[1] = value.gpa2;
        pce[2] = value.gpa3;
        pce[3] = value.gpa4;
        pce[4] = value.gpa5;
        pce[5] = value.gpa6;
        pce[6] = value.gpa7;
        pce[7] = value.gpa8;
        pce[8] = value.ogpa;
        pce[9] = value.are1;
        pce[10] = value.are2;
        pce[11] = value.are3;
        pce[12] = value.are4;
        pce[13] = value.are5;
        pce[14] = value.are6;
        pce[15] = value.are7;
        pce[16] = value.are8;
        pce[17] = value.tare;
        pce[18] = value.areno;
        no_arrears.title = value.areYN;
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

  void _uploadtoDB(BuildContext context, List<String> pg, NewObject noArrears,
      [bool showSpinner = false]) async {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }
//    print("Success");
    final String uregno = regnovar;
    final String gpa1 = pce[0];
    final String gpa2 = pce[1];
    final String gpa3 = pce[2];
    final String gpa4 = pce[3];
    final String gpa5 = pce[4];
    final String gpa6 = pce[5];
    final String gpa7 = pce[6];
    final String gpa8 = pce[7];
    final String ogpa = pce[8];
    final String are1 = pce[9];
    final String are2 = pce[10];
    final String are3 = pce[11];
    final String are4 = pce[12];
    final String are5 = pce[13];
    final String are6 = pce[14];
    final String are7 = pce[15];
    final String are8 = pce[16];
    final String tare = pce[17];
    final String areYN = noArrears.title;
    final String areno = pce[18];

    await widget.papi.uploadCurrentD(
        uregno,
        gpa1,
        gpa2,
        gpa3,
        gpa4,
        gpa5,
        gpa6,
        gpa7,
        gpa8,
        ogpa,
        are1,
        are2,
        are3,
        are4,
        are5,
        are6,
        are7,
        are8,
        tare,
        areYN,
        areno);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUploadedData(true);
  }

  List<String> pce = [
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

  List<String> helpmsg = [
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12 if you didn't attend the semester give 0",
    "Eg: 7.12",
    // arrears
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 1 if you didn't have any arrears give 0",
    "Eg: 8 if you didn't have any arrears give 0",
    "Eg: 2 if you didn't have any standing arrears give 0",
  ];

  static List<NewObject> yesorno = <NewObject>[
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
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
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

  Widget _entryFieldnumbers(String title, String hintmsg, String hint, int i,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.portLligatSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.limeAccent,
                ),
              ),
              Tooltip(
                message: hintmsg,
                preferBelow: false,
                verticalOffset: 25,
                showDuration: Duration(seconds: 1),
                child: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
              )
            ],
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "CURRENT EDUCATION DATA",
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
                          SizedBox(height: height * .2),
                          _entryFieldnumbers('SEM1 GPA', helpmsg[0], pce[0], 0),
                          _entryFieldnumbers('SEM2 GPA', helpmsg[1], pce[1], 1),
                          _entryFieldnumbers('SEM3 GPA', helpmsg[2], pce[2], 2),
                          _entryFieldnumbers('SEM4 GPA', helpmsg[3], pce[3], 3),
                          _entryFieldnumbers('SEM5 GPA', helpmsg[4], pce[4], 4),
                          _entryFieldnumbers('SEM6 GPA', helpmsg[5], pce[5], 5),
                          _entryFieldnumbers('SEM7 GPA', helpmsg[6], pce[6], 6),
                          _entryFieldnumbers('SEM8 GPA', helpmsg[7], pce[7], 7),
                          _entryFieldnumbers(
                              'OVERALL CGPA', helpmsg[8], pce[8], 8),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 1', helpmsg[9], pce[9], 9),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 2', helpmsg[10], pce[10], 10),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 3', helpmsg[11], pce[11], 11),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 4', helpmsg[12], pce[12], 12),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 5', helpmsg[13], pce[13], 13),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 6', helpmsg[14], pce[14], 14),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 7', helpmsg[15], pce[15], 15),
                          _entryFieldnumbers(
                              'NO OF ARREARS SEM 8', helpmsg[16], pce[16], 16),
                          _entryFieldnumbers('TOTAL NO OF STANDING\nARREARS',
                              helpmsg[17], pce[17], 17),
                          _DropBox("HISTORY OF ARREARS [Y/N]", yesorno),
                          _entryFieldnumbers(
                              'HOW MANY ARREARS?\nIF YES ELSE give 0',
                              helpmsg[18],
                              pce[18],
                              18),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xFFE96710),
                              foregroundColor: Colors.black,
                              onPressed: () {
//                                print(Validation(context, pce, no_arrears));
                                if (Validation(context, pce, no_arrears) == 1) {
//                                   print("Success");
                                  _uploadtoDB(context, pce, no_arrears);
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: PpPersonalD(
                                            regnovar: regnovar,
                                            usernamevar: usernamevar,
                                          )));
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
