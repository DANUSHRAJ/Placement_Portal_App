import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/signupviewdata.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'api.dart';
// import 'check.dart';
// import 'home_screen.dart';
import 'dart:developer';

class PpData extends StatefulWidget {
  const PpData({Key key}) : super(key: key);

  @override
  _PpDataState createState() => _PpDataState();
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
    NewObject('SELECT TITLE', Icons.description),
    NewObject('A', Icons.arrow_back_ios),
    NewObject('B', Icons.arrow_back_ios),
    NewObject('C', Icons.arrow_back_ios),
  ];

  static final List<NewObject> yesorno = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
    NewObject('YES', Icons.arrow_back_ios),
    NewObject('NO', Icons.arrow_back_ios),
  ];

  static final List<NewObject> becgrade = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
    NewObject('PRELIMINARY', Icons.arrow_back_ios),
    NewObject('VANTAGE', Icons.arrow_back_ios),
    NewObject('HIGHER', Icons.arrow_back_ios),
  ];

  static final List<NewObject> hord = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
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
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
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

  Widget _entryFieldnumbers(String title, String hint,
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
              child: Image.asset(
                'assets/images/inner_bg.gif',
                fit: BoxFit.fitHeight,
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
                  SizedBox(height: height * .1),
                  _title(),
                  SizedBox(height: height * .1),

                  _entryFieldnumbers('UNIVERSITY REG NO.', 'Eg:312419205041'),
                  _entryFieldalphabets('ROLL NO', 'Eg:19IT1242'),

                  _DropBox("TITLE", title, 0),
                  _entryFieldalphabets(
                      'NAME OF THE CANDIDATE', 'enter the name with inital'),
                  _entryFieldalphabets('FIRST NAME', 'first name'),
                  _entryFieldalphabets('LAST NAME', 'last name'),
                  //Gender dropdown
                  _DropBox("GENDER", gender, 1),

                  _entryFieldDob("D.O.B", "DD-MM-YYYY"),
                  _entryFieldDob("D.O.B", "MM-DD-YYYY"),
                  _entryFieldDob("D.O.B", "YYYY-MM-DD"),
                  //College dropdown
                  _DropBox("COLLEGE", college, 2),

                  _DropBox("DEPARTMENT", department, 3),
                  //Section
                  _DropBox("SECTION", section, 4),

                  _entryFieldnumbers('YEAR OF ADMISSION', 'Eg:2019'),
                  _entryFieldnumbers('10th Percentage', 'Eg:92.6'),
                  // board of study
                  // board of medium
                  _entryFieldnumbers('10th YEAR OF PASSING', 'Eg:2017'),
                  _entryFieldalphabets('NAME OF SCHOOL', 'name of school'),
                  _entryFieldalphabets('GRADUATING STATE', 'state name'),
                  _entryFieldnumbers('12th Percentage', 'Eg:79.9'),
                  // board of study
                  // board of medium
                  _entryFieldnumbers('12th YEAR OF PASSING', 'Eg:2017'),
                  _entryFieldalphabets('NAME OF SCHOOL', 'name of school'),
                  _entryFieldalphabets('GRADUATING STATE', 'state name'),
                  _entryFieldalphabets(
                      'DIPLOMA - SPECIALIZATION/BRANCH', 'state name'),
                  _entryFieldnumbers('DIPLOMA Percentage', 'Eg:79.9'),
                  _entryFieldnumbers('DIPLOMA YEAR OF PASSING', 'Eg:2017'),
                  _entryFieldalphabets(
                      'NAME OF INSTITUTE', 'name of institute'),
                  _entryFieldalphabets('GRADUATING STATE', 'state name'),
                  _entryFieldnumbers('SEM1 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM2 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM3 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM4 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM5 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM6 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM7 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('SEM8 GPA', 'Eg:7.12'),
                  _entryFieldnumbers('OVERALL GPA', 'Eg:7.12'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 1', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 2', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 3', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 4', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 5', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 6', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 7', 'if there is no arrears enter 0'),
                  _entryFieldnumbers(
                      'NO OF ARREARS SEM 8', 'if there is no arrears enter 0'),
                  _entryFieldnumbers('TOTAL NO OF STANDING ARREARS',
                      'if there is no arrears enter 0'),
                  //History of arrears Y/N
                  _DropBox("HISTORY OF ARREARS [Y/N]", yesorno, 5),
                  _entryFieldnumbers(
                      'IF YES, HOW MANY?', 'if there is no arrears enter 0'),
                  _entryFieldalphabets(
                      'UG DEGREE (FOR PG STUDENTS) ', 'Eg:B.tech'),
                  _entryFieldalphabets(
                      'UG BRANCH (FOR PG STUDENTS) ', 'Eg:Computer Science'),
                  _entryFieldnumbers(
                      'UG PERCENTAGE (FOR PG STUDENTS)', 'Eg:95.5'),
                  _entryFieldnumbers('UG CGPA (FOR PG STUDENTS)', 'Eg:9.2'),
                  _entryFieldnumbers(
                      'UG YEAR OF PASSING (FOR PG STUDENTS)', 'Eg:2023'),
                  _entryFieldalphabets(
                      'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)) ',
                      'Eg:St.joseph\'s'),
                  _entryFieldalphabets(
                      'UG - GRADUATING UNIVERSITY) ', 'Eg:Anna University'),
                  _entryFieldalphabets('GRADUATING STATE', 'Eg:Tamil Nadu'),
                  _entryFieldnumbers('LAND LINE NUMBER', ''),
                  _entryFieldnumbers('PRIMARY MOBILE NO', ''),
                  _entryFieldnumbers('EMERGENCY CONTACT NO', ''),
                  _entryFieldalphabets('PRIMARY EMAIL ID', 'abc@gmail.com'),
                  _entryFieldalphabets('ALTERNATE EMAIL ID', 'abc@gmail.com'),
                  //SPORTS QUOTA
                  _DropBox("SPORTS QUOTA", yesorno, 6),
                  //BEC EXAM STATUS
                  _DropBox("BEC EXAM STATUS", yesorno, 7),
                  // BEC EXAM GRADE
                  _DropBox("BEC EXAM GRADE", becgrade, 8),
                  _entryFieldalphabets(
                      'LANGUAGES KNOWN', 'Tamil English Hindi'),
                  _entryFieldnumbers('GAP IN EDUCATION (in Years) - If Any',
                      'if there is no gap enter 0'),
                  // ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]
                  _DropBox(
                      "ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]", yesorno, 9),
                  // IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL
                  _DropBox(
                      "IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL",
                      yesorno,
                      10),
                  // DURATION OF THE COURSE
                  // CERTIFICATION VENDOR/AUTHORITY/AGENCY NAME
                  _entryFieldalphabets('PAN CARD NUMBER', ''),
                  _entryFieldalphabets('NATIONALITY', ''),
                  _entryFieldalphabets('INDIAN PASSPORT NUMBER', ''),
                  _entryFieldnumbers('AADHAAR NUMBER', ''),
                  _entryFieldalphabets('MOTHER NAME', ''),
                  _entryFieldalphabets('DESIGNATION & ORGANISATION', ''),
                  _entryFieldnumbers('MOTHER MOBILE NUMBER', ''),
                  _entryFieldalphabets('MOTHER EMAIL ID', ''),
                  _entryFieldalphabets('PERMANENT ADDRESS WITH PINCODE', ''),
                  _entryFieldalphabets('PERMANENT ADDRESS LINE 1', ''),
                  _entryFieldalphabets('PERMANENT ADDRESS LINE 2', ''),
                  _entryFieldalphabets('PERMANENT CITY', ''),
                  _entryFieldalphabets('STATE', 'Tamil Nadu'),
                  _entryFieldnumbers('POSTAL CODE', ''),
                  //HOSTEL / DAYSCHOLAR
                  _DropBox("HOSTEL / DAY SCHOLAR", hord, 11),

                  // _entryFieldalphabets('NAME', 'ENTER NAME'),
                  // _entryFieldnumbers('REGISTRATION NUMBER', 'ENTER REG NO'),
                  // _entryFieldDob("D.O.B", "DD-MM-YYYY"),
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
                          onPressed: () {})
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
