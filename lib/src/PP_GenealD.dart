import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/GenealDJSON.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_CurrentEducation.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'api.dart';
import 'profileapi.dart';

int Validation(BuildContext context, List<String> pg, List<NewObject> dropbox) {
  List<String> compareList = [
    'UNIVERSITY REG NO',
    'ROLL NO',
    'NAME OF THE CANDIDATE',
    'FIRST NAME',
    'LAST NAME',
    'DATE OF BIRTH (DD/MM/YY)',
    'DATE OF BIRTH (MM/DD/YY)',
    'DATE OF BIRTH (YYYY-MM-DD)',
    'YEAR OF ADMISSION'
  ];
  List<String> compareListDD = [
    'TITILE',
    'GENDER',
    'COLLEGE',
    'DEPARTMENT',
    'SECTION',
    'HOSTEL/DAYSCHOLOAR'
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

  if (dropbox[0].title == 'SELECT TITLE') {
    showdialog(context, "please select the Valid TITLE");
    return -1;
  }
  if (dropbox[1].title == 'SELECT GENDER') {
    showdialog(context, "please select the Valid GENDER");
    return -1;
  }
  if (dropbox[2].title == 'SELECT COLLEGE') {
    showdialog(context, "please select the Valid COLLEGE");
    return -1;
  }
  if (dropbox[3].title == 'SELECT DEPARTMENT') {
    showdialog(context, "please select the Valid DEPARTMENT");
    return -1;
  }
  if (dropbox[4].title == 'SELECT SECTION') {
    showdialog(context, "please select the Valid SECTION");
    return -1;
  }

  if (dropbox[5].title == 'SELECT THE OPTION') {
    showdialog(context, "please select the Valid OPTION");
    return -1;
  }

  for (int i = 0; i < pg.length; i++) {
    pg[i]=pg[i].toUpperCase();
    if (pg[i] == null || pg[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }
  //name

  if(pg[2]!=pg[3]+" "+pg[4]){
    showdialog(context, "Please Check the "+compareList[2]+" is should be combination of "+compareList[3]+" and "+compareList[4]);
    return -1;
  }

 // if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[2]))) {
 //   showdialog(context, "Please Check the " + compareList[2]);
 //   return -1;
 //   //print("candidate");
 // }
 // if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[3]))) {
 //   showdialog(context, "Please Check the " + compareList[3]);
 //   return -1;
 //   //print("first name");
 // }
 // if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[4]))) {
 //   showdialog(context, "Please Check the " + compareList[4]);
 //   return -1;
 //   //print("last name");
 // }

  //register number
 if (!RegExp(r'^3124\d{8}$').hasMatch(pg[0])) {
   showdialog(context, "Please Check the " + compareList[0]);
   return -1;
   //print("Register number was invalid");
 }
  //roll no
  if (pg[1].length != 8) {
    showdialog(context, "Please Check the " + compareList[1]);
    return -1;
    //print("Check roll number");
  }
  // dob
  // dd-mm-yyyy
  if (!RegExp(r'^([0-2][0-9]|(3)[0-1])(\-)(((0)[0-9])|((1)[0-2]))(\-)\d{4}$')
      .hasMatch(pg[5])) {
    //print("dob was invalid");
    showdialog(context, "Please Check the " + compareList[5]);
    return -1;
  }
  // mm-dd-yyyy
  if (!RegExp(r'^(0[1-9]|1[0-2])\-(0[1-9]|1\d|2\d|3[01])\-(19|20)\d{2}$')
      .hasMatch(pg[6])) {
    //print("dob was invalid");
    showdialog(context, "Please Check the " + compareList[6]);
    return -1;
  }
  // yyyy-mm-dd
  if (!RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$')
      .hasMatch(pg[7])) {
    //print("dob was invalid");
    showdialog(context, "Please Check the " + compareList[7]);
    return -1;
  }
  List<String> a=pg[5].split("-");
  List<String> b=pg[6].split("-");
  List<String> c=pg[7].split("-");
  if(a[0]!=b[1]||a[0]!=c[2]||a[1]!=b[0]||a[1]!=c[1]||a[2]!=b[2]||a[2]!=c[0]){
    showdialog(context, "Please Check the DATE OF BIRTH");
    return -1;
  }

  //year
  if (!RegExp(r'^\d{4}$').hasMatch(pg[8])||pg[8]!="20"+pg[0].substring(4,6)) {
    showdialog(context, "Please Check the " + compareList[8]);
    return -1;
    //print("year of admission");
  }

  return 1;
}

class PpGenealD extends StatefulWidget {
  String regnovar;
  String usernamevar;

  final AccountsApi api = AccountsApi();
  final ProfileApi papi = ProfileApi();

  PpGenealD({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  @override
  _PpGenealDState createState() =>
      _PpGenealDState(regnovar: regnovar, usernamevar: usernamevar);
}

class NewObject {
  String title;
  IconData icon;

  NewObject(this.title, this.icon);
}

class _PpGenealDState extends State<PpGenealD> {
  String regnovar;
  String usernamevar;

  _PpGenealDState({this.regnovar, this.usernamevar});

  bool loading = false;

  var vregno, vname, vemail;

  void _loadPPData([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.api.getOneAccount(regnovar).then((value) {
      setState(() {
        vregno = value.regno;
        vname = value.name;
        vemail = value.username;
        pg[0] = vregno;
//        pg[2] = vname;
//        internDet = value;
        loading = false;
      });
    });
  }

  void _loadUploadedData([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.papi.getGenealD(regnovar).then((value) {
//      print('In PP_GenealD: $value');
      String temp1 = value.toString();
//      print('$temp1');
      if (value.runtimeType == Null||value.rollno.runtimeType==Null) {
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        //Done for PG only
        pg[1] = value.rollno;
        pg[2] = value.name;
        pg[3] = value.fname;
        pg[4] = value.lname;
        pg[5] = value.dob1;
        pg[6] = value.dob2;
        pg[7] = value.dob3;
        pg[8] = value.yoa;
        dropbox[0].title = value.title;
        dropbox[1].title = value.gender;
        dropbox[2].title = value.college;
        dropbox[3].title = value.dept;
        dropbox[4].title = value.sec;
        dropbox[5].title = value.hd;
//        vregno = value.regno;
//        vname = value.name;
//        vemail = value.username;
//        internDet = value;
        loading = false;
      });
    });
  }

  void _uploadtoDB(
      BuildContext context, List<String> pg, List<NewObject> dropbox,
      [bool showSpinner = false]) async {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    final String uregno = pg[0];
    final String rollno = pg[1];
    final String name = pg[2];
    final String fname = pg[3];
    final String lname = pg[4];
    final String dob1 = pg[5];
    final String dob2 = pg[6];
    final String dob3 = pg[7];
    final String yoa = pg[8];
    final String title = dropbox[0].title;
    final String gender = dropbox[1].title;
    final String college = dropbox[2].title;
    final String dept = dropbox[3].title;
    final String sec = dropbox[4].title;
    final String hd = dropbox[5].title;

    await widget.papi.uploadgenealD(uregno, rollno, name, fname, lname, dob1,
        dob2, dob3, yoa, title, gender, college, dept, sec, hd);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPPData(true);
    _loadUploadedData(true);
  }

  List<String> pg = [null, null, null, null, null, null, null, null, null];
  //profile General Data
  // String regno;
  // String rollno;
  // String title_d;
  // String name;
  // String fname;
  // String lname;
  // String gender_d;
  // String dob_d;
  // String dob_m;
  // String dob_y;
  // String college_d;
  // String degree;
  // String branch;
  // String section_d;
  // String yoa;
  // String scholar;
  static List<NewObject> title = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
    NewObject('Mr', Icons.person),
    NewObject('Ms', Icons.person),
  ];
  static List<NewObject> gender = <NewObject>[
    NewObject('SELECT GENDER', Icons.person),
    NewObject('MALE', Icons.male_rounded),
    NewObject('FEMALE', Icons.female_rounded),
  ];

  static List<NewObject> college = <NewObject>[
    NewObject('SELECT COLLEGE', Icons.description),
    NewObject('SJIT', Icons.home_outlined),
    NewObject('SJCE', Icons.home_outlined),
  ];

  static List<NewObject> department = <NewObject>[
    NewObject('SELECT DEPARTMENT', Icons.description),
    NewObject('B.Tech IT', Icons.mobile_friendly_rounded),
    NewObject('B.E CSE', Icons.computer_rounded),
    NewObject('B.E ECE', Icons.signal_cellular_alt_outlined),
    NewObject('B.E EEE', Icons.lightbulb_outline_rounded),
    NewObject('B.E MECH', Icons.settings_applications_rounded),
    NewObject('B.E CIVIL', Icons.apartment_outlined),
  ];

  static List<NewObject> section = <NewObject>[
    NewObject('SELECT SECTION', Icons.description),
    NewObject('A', Icons.arrow_back_ios),
    NewObject('B', Icons.arrow_back_ios),
    NewObject('C', Icons.arrow_back_ios),
  ];

  static List<NewObject> hord = <NewObject>[
    NewObject('SELECT THE OPTION', Icons.description),
    NewObject('HOSTEL', Icons.arrow_back_ios),
    NewObject('DAY SCHOLAR', Icons.arrow_back_ios),
  ];

  static List<NewObject> dropbox = <NewObject>[
    title.first, //0
    gender.first, //1
    college.first, //2
    department.first, //3
    section.first, //4
    hord.first, //5
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
//                hintText: hint,
                labelText: pg[i],
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
            onChanged: (value) => setState(() => pg[i] = value),
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
                labelText: pg[i],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
            onChanged: (value) => setState(() => pg[i] = value),
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
            onChanged: (value) => setState(() => pg[i] = value),
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
            onChanged: (value) => setState(() => pg[i] = value),

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
              text: 'GENERAL',
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
            "GENERAL DATA",
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
                  //SizedBox(height: height * .05),
                  Container(
                    child: Stack(children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: height * .2),
                              // Align(alignment: Alignment.center, child: _title()),
                              // SizedBox(height: height * .1),
                              _entryFieldalphabetsdisplay(
                                  'UNIVERSITY REG NO.', pg[0], 0),
                              _entryFieldalphabets('ROLL NO', pg[1], 1),
                              _DropBox("TITLE", title, 0),
                              _entryFieldalphabets(
                                  'NAME OF THE CANDIDATE', pg[2], 2),
                              _entryFieldalphabets('FIRST NAME', pg[3], 3),
                              _entryFieldalphabets('LAST NAME', pg[4], 4),
                              _DropBox("GENDER", gender, 1),
                              _entryFieldDob("D.O.B  (DD-MM-YYYY)", pg[5], 5),
                              _entryFieldDob("D.O.B  (MM-DD-YYYY)", pg[6], 6),
                              _entryFieldDob("D.O.B  (YYYY-MM-DD)", pg[7], 7),
                              _DropBox("COLLEGE", college, 2),
                              _DropBox("DEPARTMENT", department, 3),
                              _DropBox("SECTION", section, 4),
                              _entryFieldnumbers('YEAR OF ADMISSION', pg[8], 8),
                              _DropBox("HOSTEL / DAY SCHOLAR", hord, 5),
                              SizedBox(height: height * .02),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton.extended(
                                  backgroundColor: const Color(0xFFE96710),
                                  foregroundColor: Colors.black,
                                  onPressed: () {
                                    pg[3]=pg[3].trim();
                                    pg[4]=pg[4].trim();
                                    pg[2]=pg[2].trim();
//                                    print('Success');
//                                    print(Validation(context, pg, dropbox));
                                    if (Validation(context, pg, dropbox) == 1) {
//                                       print('Success');
                                      _uploadtoDB(context, pg, dropbox);
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              child: PpEducationD(
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
                  )
                ]),
              ));
  }
}
