import 'dart:convert';

import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';

import 'package:google_fonts/google_fonts.dart';

// import 'api.dart';
// import 'check.dart';
// import 'home_screen.dart';
import 'dart:developer';

import 'profileapi.dart';

void profile(List<String> profile) async {
  List<String> compareList = [
    'UNIVERSITY REG NO',
    'ROLL NO',
    'NAME OF THE CANDIDATE',
    'FIRST NAME',
    'LAST NAME',
    'DATE OF BIRTH (DD/MM/YY)',
    'DATE OF BIRTH (MM/DD/YY)',
    'DATE OF BIRTH (YYYY-MM-DD)',
    'YEAR OF ADMISSION',
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
    'UG DEGREE (FOR PG STUDENTS)',
    'UG BRANCH (FOR PG STUDENTS)',
    'UG PERCENTAGE (FOR PG STUDENTS)',
    'UG CGPA (FOR PG STUDENTS)',
    'UG YEAR OF PASSING (FOR PG STUDENTS)',
    'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)',
    'UG - GRADUATING UNIVERSITY',
    'GRADUATING STATE',
    'LAND LINE NUMBER',
    'PRIMARY MOBILE NO',
    'EMERGENCY CONTACT NO',
    'PRIMARY EMAIL ID',
    'ALTERNATE EMAIL ID',
    'LANGUAGES KNOWN',
    'GAP IN EDUCATION (in Years)',
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
    'POSTAL CODE'
  ];
  int check = -1;
  for (int i = 0; i < profile.length; i++) {
    if (profile[i] == 'null' || profile[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    print(compareList[check] + " was left blank");
  }
  //name
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(profile[2]))) {
    print("candidate");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(profile[3]))) {
    print("first name");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(profile[4]))) {
    print("last name");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(profile[64]))) {
    print("father name");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(profile[68]))) {
    print("mother name");
  }
//  if(dropbox[2].title=='SELECT COLLEGE'){
//    showdialog(context, "please select the Valid COLLEGE");
//    return;
//  }
  //roll no
  if (profile[0].length != 8) {
    print("Check roll number");
  }
  // dob
  // dd/mm/yyyy
  if (!RegExp(r'^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$')
      .hasMatch(profile[5])) {
    print("dob was invalid");
  }
  // mm/dd/yyyy
  if (!RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$')
      .hasMatch(profile[6])) {
    print("dob was invalid");
  }
  // yyyy/mm/dd
  if (!RegExp(r'^\d{4}\/(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])$')
      .hasMatch(profile[7])) {
    print("dob was invalid");
  }

  //year
  if (!RegExp(r'^\d{4}$').hasMatch(profile[8])) {
    print("year of admission");
  }
  if (!RegExp(r'^\d{4}$').hasMatch(profile[12])) {
    print("10th passing");
  }
  if (!RegExp(r'^\d{4}$').hasMatch(profile[18])) {
    print("12th passing");
  }
  if (!RegExp(r'^\d{4}$').hasMatch(profile[23])) {
    print("Diploma passing");
  }
  if (!RegExp(r'^\d{4}$').hasMatch(profile[49])) {
    print("UG passing");
  }

  //percentage
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(profile[9])) {
    print("10th percentage");
  }
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(profile[15])) {
    print("10th percentage");
  }
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(profile[22])) {
    print("diploma percentage");
  }
  if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
      .hasMatch(profile[47])) {
    print("UG percentage");
  }
  //gpa
  for (int i = 26; i < 35; i++) {
    if (!RegExp(r'(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)')
        .hasMatch(profile[i])) {
      print(compareList[i] + "was invalid");
    }
  }
  //arrear
  for (int i = 35; i < 44; i++) {
    if (false) {}
  }

  // phone number
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(profile[53])) {
    print("land line number");
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(profile[54])) {
    print("primary number");
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(profile[55])) {
    print("emergency number");
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(profile[66])) {
    print("father's mobile number");
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(profile[70])) {
    print("mother's mobile number");
  }

  //email id
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(profile[56])) {
    print("primary");
  }
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(profile[57])) {
    print("alternate");
  }
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(profile[67])) {
    print("father email id");
  }
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
      .hasMatch(profile[71])) {
    print("mother email id");
  }

  //pancard
  if (!RegExp(r'[A-Z]{3}[ABCFGHLJPTF]{1}[A-Z]{1}[0-9]{4}[A-Z]{1}$')
      .hasMatch(profile[60])) {
    print("pan card");
  }

    //postal code
//    if (!RegExp(r'^\d{6}$').hasMatch(profile[77])) {
//      //print("postal code");
//      showdialog(context, "Please Check the " + compareList[77]);
//      return;
//    }
//  catch(e){}


  print(profile.length);

  final ProfileApi api = ProfileApi();
//  var result = jsonEncode(jsonformat);
//  log('$result');
  await api.uploadppdata(compareList, profile);
}

class PpData extends StatefulWidget {
  const PpData({Key key}) : super(key: key);

  @override
  _PpDataState createState() => _PpDataState();
}

class Data {
  final String data;

  Data(this.data);
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpDataState extends State<PpData> {
  get _chosenValue => null;
  static const IconData male_rounded =
  IconData(0xf89d, fontFamily: 'MaterialIcons');
  static const IconData female_rounded =
  IconData(0xf73d, fontFamily: 'MaterialIcons');

  static final List<NewObject> title = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
    NewObject('Mr', Icons.person),
    NewObject('Ms', Icons.person),
  ];
  static final List<NewObject> gender = <NewObject>[
    NewObject('SELECT GENDER', Icons.person),
    NewObject('MALE', male_rounded),
    NewObject('FEMALE', female_rounded),
  ];

  static final List<NewObject> college = <NewObject>[
    NewObject('SELECT COLLEGE', Icons.description),
    NewObject('SJIT', Icons.home_outlined),
    NewObject('SJCE', Icons.home_outlined),
  ];

  static final List<NewObject> department = <NewObject>[
    NewObject('SELECT DEPARTMENT', Icons.description),
    NewObject('B.Tech IT', Icons.mobile_friendly_rounded),
    NewObject('B.E CSE', Icons.computer_rounded),
    NewObject('B.E ECE', Icons.signal_cellular_alt_outlined),
    NewObject('B.E EEE', Icons.lightbulb_outline_rounded),
    NewObject('B.E MECH', Icons.settings_applications_rounded),
    NewObject('B.E CIVIL', Icons.apartment_outlined),
  ];

  static final List<NewObject> section = <NewObject>[
    NewObject('SELECT SECTION', Icons.description),
    NewObject('A', Icons.arrow_back_ios),
    NewObject('B', Icons.arrow_back_ios),
    NewObject('C', Icons.arrow_back_ios),
  ];

  static final List<NewObject> yesorno = <NewObject>[
    NewObject('SELECT THE OPTION', Icons.description),
    NewObject('YES', Icons.arrow_back_ios),
    NewObject('NO', Icons.arrow_back_ios),
  ];

  static final List<NewObject> becgrade = <NewObject>[
    NewObject('SELECT BEC GRADE', Icons.description),
    NewObject('PRELIMINARY', Icons.arrow_back_ios),
    NewObject('VANTAGE', Icons.arrow_back_ios),
    NewObject('HIGHER', Icons.arrow_back_ios),
  ];

  static final List<NewObject> hord = <NewObject>[
    NewObject('SELECT THE OPTION', Icons.description),
    NewObject('HOSTEL', Icons.arrow_back_ios),
    NewObject('DAY SCHOLAR', Icons.arrow_back_ios),
  ];

  static final List<NewObject> dropbox = <NewObject>[
    title.first, //0
    gender.first, //1
    college.first, //2
    department.first, //3
    section.first, //4
    yesorno.first, //5
    yesorno.first, //6
    yesorno.first, //7
    becgrade.first, //8
    yesorno.first, //9
    yesorno.first, //10
    hord.first, //11
  ];

  static final List<String> pp = <String>[
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
    'null',
    'null',
    'null'
  ];

  //DropBox a=key.num;


//BACK BUTTON
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
            // Text('Back',
            //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
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
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) => setState(() => pp[i] = value),
          )
        ],
      ),
    );
  }

  Widget _entryFieldDob(String title, String hint, int i,
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
            onChanged: (value) => setState(() => pp[i] = value),
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
          )
        ],
      ),
    );
  }

  Widget _DropBox(String title, List<NewObject> key, int i) {
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
                value: dropbox.elementAt(i), // currently selected item
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
                  dropbox[i] = value;
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
                    color: Colors.black,
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child:
              Image.asset('assets/images/inner_bg.gif', fit: BoxFit.cover)),
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
                  Align(alignment: Alignment.center, child: _title()),
                  SizedBox(height: height * .1),
                  _entryFieldnumbers(
                      'UNIVERSITY REG NO.', 'Eg:312419205041', 0),
                  _entryFieldalphabets('ROLL NO', 'Eg:19IT1242', 1),
                  _DropBox("TITLE", title, 0),
                  _entryFieldalphabets('NAME OF THE CANDIDATE',
                      'enter the name with initial', 2),
                  _entryFieldalphabets('FIRST NAME', 'first name', 3),
                  _entryFieldalphabets('LAST NAME', 'last name', 4),
                  _DropBox("GENDER", gender, 1),
                  _entryFieldDob("D.O.B", "DD-MM-YYYY", 5),
                  _entryFieldDob("D.O.B", "MM-DD-YYYY", 6),
                  _entryFieldDob("D.O.B", "YYYY-MM-DD", 7),
                  _DropBox("COLLEGE", college, 2),
                  _DropBox("DEPARTMENT", department, 3),
                  _DropBox("SECTION", section, 4),
                  _entryFieldnumbers('YEAR OF ADMISSION', 'Eg:2019', 8),
                  _entryFieldnumbers('10th Percentage', 'Eg:92.6', 9),
                  _entryFieldalphabets(
                      '10TH BOARD OF STUDY', 'Eg:State Board', 10),
                  _entryFieldalphabets(
                      '10TH MEDIUM OF STUDY', 'Eg:English', 11),
                  _entryFieldnumbers('10th YEAR OF PASSING', 'Eg:2017', 12),
                  _entryFieldalphabets('NAME OF SCHOOL', 'name of school', 13),
                  _entryFieldalphabets('GRADUATING STATE', 'state name', 14),
                  _entryFieldnumbers('12th Percentage', 'Eg:79.9', 15),
                  _entryFieldalphabets(
                      '12th BOARD OF STUDY', 'Eg:STATE BOARD', 16),
                  _entryFieldalphabets(
                      '12th MEDIUM OF STUDY', 'Eg:English', 17),
                  _entryFieldnumbers('12th YEAR OF PASSING', 'Eg:2017', 18),
                  _entryFieldalphabets('NAME OF SCHOOL', 'name of school', 19),
                  _entryFieldalphabets('GRADUATING STATE', 'state name', 20),
                  _entryFieldalphabets(
                      'DIPLOMA - SPECIALIZATION/BRANCH', 'state name', 21),
                  _entryFieldnumbers('DIPLOMA Percentage', 'Eg:79.9', 22),
                  _entryFieldnumbers('DIPLOMA YEAR OF PASSING', 'Eg:2017', 23),
                  _entryFieldalphabets(
                      'NAME OF INSTITUTE', 'name of institute', 24),
                  _entryFieldalphabets('GRADUATING STATE', 'state name', 25),
                  _entryFieldnumbers('SEM1 GPA', 'Eg:7.12', 26),
                  _entryFieldnumbers('SEM2 GPA', 'Eg:7.12', 27),
                  _entryFieldnumbers('SEM3 GPA', 'Eg:7.12', 28),
                  _entryFieldnumbers('SEM4 GPA', 'Eg:7.12', 29),
                  _entryFieldnumbers('SEM5 GPA', 'Eg:7.12', 30),
                  _entryFieldnumbers('SEM6 GPA', 'Eg:7.12', 31),
                  _entryFieldnumbers('SEM7 GPA', 'Eg:7.12', 32),
                  _entryFieldnumbers('SEM8 GPA', 'Eg:7.12', 33),
                  _entryFieldnumbers('OVERALL GPA', 'Eg:7.12', 34),
                  _entryFieldnumbers('NO OF ARREARS SEM 1',
                      'if there is no arrears enter 0', 35),
                  _entryFieldnumbers('NO OF ARREARS SEM 2',
                      'if there is no arrears enter 0', 36),
                  _entryFieldnumbers('NO OF ARREARS SEM 3',
                      'if there is no arrears enter 0', 37),
                  _entryFieldnumbers('NO OF ARREARS SEM 4',
                      'if there is no arrears enter 0', 38),
                  _entryFieldnumbers('NO OF ARREARS SEM 5',
                      'if there is no arrears enter 0', 39),
                  _entryFieldnumbers('NO OF ARREARS SEM 6',
                      'if there is no arrears enter 0', 40),
                  _entryFieldnumbers('NO OF ARREARS SEM 7',
                      'if there is no arrears enter 0', 41),
                  _entryFieldnumbers('NO OF ARREARS SEM 8',
                      'if there is no arrears enter 0', 42),
                  _entryFieldnumbers('TOTAL NO OF STANDING ARREARS',
                      'if there is no arrears enter 0', 43),
                  _DropBox("HISTORY OF ARREARS [Y/N]", yesorno, 5),
                  _entryFieldnumbers('IF YES, HOW MANY?',
                      'if there is no arrears enter 0', 44),
                  _entryFieldalphabets(
                      'UG DEGREE (FOR PG STUDENTS) ', 'Eg:B.tech', 45),
                  _entryFieldalphabets('UG BRANCH (FOR PG STUDENTS) ',
                      'Eg:Computer Science', 46),
                  _entryFieldnumbers(
                      'UG PERCENTAGE (FOR PG STUDENTS)', 'Eg:95.5', 47),
                  _entryFieldnumbers('UG CGPA (FOR PG STUDENTS)', 'Eg:9.2', 48),
                  _entryFieldnumbers(
                      'UG YEAR OF PASSING (FOR PG STUDENTS)', 'Eg:2023', 49),
                  _entryFieldalphabets(
                      'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)) ',
                      'Eg:St.joseph\'s',
                      50),
                  _entryFieldalphabets(
                      'UG - GRADUATING UNIVERSITY) ', 'Eg:Anna University', 51),
                  _entryFieldalphabets('GRADUATING STATE', 'Eg:Tamil Nadu', 52),
                  _entryFieldnumbers('LAND LINE NUMBER', '', 53),
                  _entryFieldnumbers('PRIMARY MOBILE NO', '', 54),
                  _entryFieldnumbers('EMERGENCY CONTACT NO', '', 55),
                  _entryFieldalphabets('PRIMARY EMAIL ID', 'abc@gmail.com', 56),
                  _entryFieldalphabets(
                      'ALTERNATE EMAIL ID', 'abc@gmail.com', 57),
                  _DropBox("SPORTS QUOTA", yesorno, 6),
                  _DropBox("BEC EXAM STATUS", yesorno, 7),
                  _DropBox("BEC EXAM GRADE", becgrade, 8),
                  _entryFieldalphabets(
                      'LANGUAGES KNOWN', 'Tamil,English,Hindi', 58),
                  _entryFieldnumbers('GAP IN EDUCATION (in Years) - If Any',
                      'if there is no gap enter 0', 59),
                  _DropBox(
                      "ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]", yesorno, 9),
                  _DropBox(
                      "IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL",
                      yesorno,
                      10),
                  _entryFieldalphabets('PAN CARD NUMBER', '', 60),
                  _entryFieldalphabets('NATIONALITY', '', 61),
                  _entryFieldalphabets('INDIAN PASSPORT NUMBER', '', 62),
                  _entryFieldnumbers('AADHAAR NUMBER', '', 63),
                  _entryFieldalphabets('FATHER NAME', '', 64),
                  _entryFieldalphabets('DESIGNATION & ORGANISATION', '', 65),
                  _entryFieldnumbers('FATHER MOBILE NUMBER', '', 66),
                  _entryFieldalphabets('FATHER EMAIL ID', '', 67),
                  _entryFieldalphabets('MOTHER NAME', '', 68),
                  _entryFieldalphabets('DESIGNATION & ORGANISATION', '', 69),
                  _entryFieldnumbers('MOTHER MOBILE NUMBER', '', 70),
                  _entryFieldalphabets('MOTHER EMAIL ID', '', 71),
                  _entryFieldalphabets(
                      'PERMANENT ADDRESS WITH PIN CODE', '', 72),
                  _entryFieldalphabets('PERMANENT ADDRESS LINE 1', '', 73),
                  _entryFieldalphabets('PERMANENT ADDRESS LINE 2', '', 74),
                  _entryFieldalphabets('PERMANENT CITY', '', 75),
                  _entryFieldalphabets('STATE', 'Tamil Nadu', 76),
                  _entryFieldnumbers('POSTAL CODE', '', 77),
                  _DropBox("HOSTEL / DAY SCHOLAR", hord, 11),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      RaisedButton(
                          color: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(17.0),
                          splashColor: Colors.purple,
                          textColor: Colors.white,
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            profile(pp);
                            //print(pp.length);
                            // for (int i = 0; i < pp.length; i++) {
                            //   print(pp[i].toString());
                            // }
                          })
                    ],
                  ),
                  SizedBox(height: 25), //For department
                ],
              ),
            ),
          ),
          //Positioned(top: 40, left: 0, child: _backButton()),
        ]),
      ),
    );
  }
}
