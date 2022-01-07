import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Personal.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

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
  static final List<NewObject> yesorno = <NewObject>[
    NewObject('SELECT THE OPTION', Icons.description),
    NewObject('YES', Icons.arrow_back_ios),
    NewObject('NO', Icons.arrow_back_ios),
  ];
  static final List<NewObject> dropbox = <NewObject>[
    title.first, //0
    gender.first, //1
    college.first, //2
    department.first, //3
    section.first, //4//11
    yesorno.first,
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
            // onChanged: (value) => setState(() => pp[i] = value),
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
            // onChanged: (value) => setState(() => pp[i] = value),
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
            // onChanged: (value) => setState(() => pp[i] = value),
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
                //onChanged: (value) => setState(() {dropbox[i] = value;}),
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

            //onChanged: (value) => setState(() => pp[i] = value),

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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: PpPersonalD()));
                          },),
                        )

                      ],

                    )))
          ]),
        ));
  }
}
