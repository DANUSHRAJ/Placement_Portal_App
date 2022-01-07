import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Extra.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

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
  List<String> pp=[
    'null','null','null','null','null','null','null','null','null','null',
    'null','null','null','null','null','null','null','null','null','null',
    'null','null','null'
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

                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(onPressed: () {
                            print("-----");
                            for(int i=0;i<pp.length;i++){
                              print(pp[i]);
                            }
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: PpExtraD()));
                          },),
                        )
                      ],
                    )))
          ]),
        ));
  }
}
