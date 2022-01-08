import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Education.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

int Validation(BuildContext context,List<String> pa,List<NewObject> dropbox){

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

  for (int i = 0; i < 5; i++) {
    if (i != 2 && dropbox[i].title == 'SELECT THE OPTION') {
      showdialog(context, "please select the Valid OPTION");
      return -1;
    }
  }

  if (dropbox[2].title == 'SELECT BEC GRADE') {
    showdialog(context, "please select the Valid SECTION");
    return -1;
  }

  if(pa[0]=='null'||pa[0].isEmpty){
    showdialog(context, "please fill the " + "LANGUAGES KNOWN");
    //print(compareList[check]+" was left blank");
    return -1;
  }

  if(pa[1]=='null'||pa[1].isEmpty){
    showdialog(context, "please fill the " + "GAP IN EDUCATION");
    //print(compareList[check]+" was left blank");
    return -1;
  }
  return 1;

}


class PpExtraD extends StatefulWidget {
  const PpExtraD({Key key}) : super(key: key);

  @override
  _PpExtraDState createState() => _PpExtraDState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpExtraDState extends State<PpExtraD> {
  bool loading = false;

  List<String> pa=[
    'null','null'
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


  static final List<NewObject> dropbox = <NewObject>[
    yesorno.first, //0
    yesorno.first, //1
    becgrade.first, //2
    yesorno.first, //3
    yesorno.first, //4
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
             onChanged: (value) => setState(() => pa[i] = value),
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
                onChanged: (value) => setState(() {dropbox[i] = value;}),
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
            onChanged: (value) => setState(() => pa[i] = value),

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
              text: 'ADDITIONAL',
              style: GoogleFonts.portLligatSans(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: '  INFORMATION',
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
                        _DropBox("SPORTS QUOTA", yesorno, 0),
                        _DropBox("BEC EXAM STATUS", yesorno, 1),
                        _DropBox("BEC EXAM GRADE", becgrade, 2),
                        _entryFieldalphabets(
                            'LANGUAGES KNOWN', 'Tamil,English,Hindi', 0),
                        _entryFieldnumbers(
                            'GAP IN EDUCATION (in Years) - If Any',
                            'if there is no gap enter 0',
                            1),
                        _DropBox("ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]",
                            yesorno, 3),
                        _DropBox(
                            "IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL",
                            yesorno,
                            4),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: (){
                              print("---");
                              for(int i=0;i<dropbox.length;i++){
                                print(dropbox[i].title);
                              }
                              if(Validation(context, pa, dropbox)==1){
                                print("Successfully Completed ");
                              }
                            },
                          )
                        )

                      ],

                    )))
          ]),
        ));
  }
}
