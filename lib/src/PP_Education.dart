import 'package:SJIT_PLACEMENT_PORTAL/src/PP_CurrentEducation.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

int Validation(BuildContext context,List<String> pe){
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

  for (int i = 0; i < pe.length; i++) {
    if (pe[i] == 'null' || pe[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }

  if (!RegExp(r'^\d{4}$').hasMatch(pe[3])) {
    showdialog(context, "Please Check the " + compareList[3]);
    return -1;
    // print("10th passing");
  }
  if (!RegExp(r'^\d{4}$').hasMatch(pe[9])) {
    //print("12th passing");
    showdialog(context, "Please Check the " + compareList[9]);
    return -1;
  }

  //percentage
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(pe[0])) {
    //print("10th percentage");
    showdialog(context, "Please Check the " + compareList[0]);
    return -1;
  }
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(pe[9])) {
    //print("12th percentage");
    showdialog(context, "Please Check the " + compareList[9]);
    return -1;
  }

  return 1;

}


class PpEducationD extends StatefulWidget {
  const PpEducationD({Key key}) : super(key: key);

  @override
  _PpEducationDState createState() => _PpEducationDState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpEducationDState extends State<PpEducationD> {
  bool loading = false;

  List<String> pe = [
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
    'null',
    'null',
    'null',
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: loading
            ? Center(
                child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_rru67jvx.json'))
            : Container(
                height: height,
                child: Stack(children: <Widget>[
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/inner_bg.gif',
                        fit: BoxFit.cover,
                      )),
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
                          SizedBox(height: height * .05),
                          Align(alignment: Alignment.center, child: _title()),
                          SizedBox(height: height * .1),
                          _entryFieldnumbers('10th Percentage', 'Eg:92.6', 0),
                          _entryFieldalphabets(
                              '10TH BOARD OF STUDY', 'Eg:State Board', 1),
                          _entryFieldalphabets(
                              '10TH MEDIUM OF STUDY', 'Eg:English', 2),
                          _entryFieldnumbers(
                              '10th YEAR OF PASSING', 'Eg:2017', 3),
                          _entryFieldalphabets(
                              'NAME OF SCHOOL', 'name of school', 4),
                          _entryFieldalphabets(
                              'GRADUATING STATE', 'state name', 5),
                          _entryFieldnumbers('12th Percentage', 'Eg:79.9', 6),
                          _entryFieldalphabets(
                              '12th BOARD OF STUDY', 'Eg:STATE BOARD', 7),
                          _entryFieldalphabets(
                              '12th MEDIUM OF STUDY', 'Eg:English', 8),
                          _entryFieldnumbers(
                              '12th YEAR OF PASSING', 'Eg:2017', 9),
                          _entryFieldalphabets(
                              'NAME OF SCHOOL', 'name of school', 10),
                          _entryFieldalphabets(
                              'GRADUATING STATE', 'state name', 11),
                          _entryFieldalphabets(
                              'DIPLOMA - SPECIALIZATION/BRANCH',
                              'state name',
                              12),
                          _entryFieldnumbers(
                              'DIPLOMA Percentage', 'Eg:79.9', 13),
                          _entryFieldnumbers(
                              'DIPLOMA YEAR OF PASSING', 'Eg:2017', 14),
                          _entryFieldalphabets(
                              'NAME OF INSTITUTE', 'name of institute', 15),
                          _entryFieldalphabets(
                              'GRADUATING STATE', 'state name', 16),
                          _entryFieldalphabets(
                              'UG DEGREE (FOR PG STUDENTS) ', 'Eg:B.tech', 17),
                          _entryFieldalphabets('UG BRANCH (FOR PG STUDENTS) ',
                              'Eg:Computer Science', 18),
                          _entryFieldnumbers(
                              'UG PERCENTAGE (FOR PG STUDENTS)', 'Eg:95.5', 19),
                          _entryFieldnumbers(
                              'UG CGPA (FOR PG STUDENTS)', 'Eg:9.2', 20),
                          _entryFieldnumbers(
                              'UG YEAR OF PASSING (FOR PG STUDENTS)',
                              'Eg:2023',
                              21),
                          _entryFieldalphabets(
                              'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)) ',
                              'Eg:St.joseph\'s',
                              22),
                          _entryFieldalphabets('UG - GRADUATING UNIVERSITY) ',
                              'Eg:Anna University', 23),
                          _entryFieldalphabets(
                              'GRADUATING STATE', 'Eg:Tamil Nadu', 24),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {
                                for (int i = 0; i < pe.length; i++) {
                                  print(pe[i]);
                                }
                                if(Validation(context, pe)==1) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: PpCurrentD()));
                                }
                              },
                            ),
                          )
                        ],
                      )))
                ]),
              ));
  }
}
