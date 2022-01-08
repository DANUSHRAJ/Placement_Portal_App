import 'package:SJIT_PLACEMENT_PORTAL/src/PP_CurrentEducation.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'api.dart';

Future<int> Validation(
    BuildContext context, List<String> pg, List<NewObject> dropbox) async {
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
    if (pg[i] == 'null' || pg[i].isEmpty) {
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
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[2]))) {
    showdialog(context, "Please Check the " + compareList[2]);
    return -1;
    //print("candidate");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[3]))) {
    showdialog(context, "Please Check the " + compareList[3]);
    return -1;
    //print("first name");
  }
  if (!(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(pg[4]))) {
    showdialog(context, "Please Check the " + compareList[4]);
    return -1;
    //print("last name");
  }

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

  //year
  if (!RegExp(r'^\d{4}$').hasMatch(pg[8])) {
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

  PpGenealD({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  @override
  _PpGenealDState createState() =>
      _PpGenealDState(regnovar: regnovar, usernamevar: usernamevar);
}

class NewObject {
  final String title;
  final IconData icon;

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
//        internDet = value;
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPPData(true);
  }

  List<String> pg = [
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
  static final List<NewObject> title = <NewObject>[
    NewObject('SELECT TITLE', Icons.description),
    NewObject('Mr', Icons.person),
    NewObject('Ms', Icons.person),
  ];
  static final List<NewObject> gender = <NewObject>[
    NewObject('SELECT GENDER', Icons.person),
    NewObject('MALE', Icons.male_rounded),
    NewObject('FEMALE', Icons.female_rounded),
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
                          _entryFieldalphabetsdisplay(
                              'UNIVERSITY REG NO.', vregno, 0),
                          _entryFieldalphabets('ROLL NO', 'Eg:19IT1242', 1),
                          _DropBox("TITLE", title, 0),
                          _entryFieldalphabetsdisplay(
                              'NAME OF THE CANDIDATE', vname, 2),
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
                          _DropBox("HOSTEL / DAY SCHOLAR", hord, 5),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {
                                for (int i = 0; i < pg.length; i++) {
                                  print(pg[i]);
                                }
                                for (int i = 0; i < dropbox.length; i++) {
                                  print(dropbox[i].title);
                                }
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: PpEducationD()));
                              },
                            ),
                          )
                        ],
                      )))
                ]),
              ));
  }
}
