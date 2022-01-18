import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'profileapi.dart';
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
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.black),
                ),
                color: Colors.deepOrange,
                splashColor: Colors.deepOrangeAccent,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("OK")),
          ),
        ],
      ));
}

int Validation(BuildContext context, List<String> pa, List<NewObject> dropbox) {


  for (int i = 0; i < dropbox.length; i++) {
    if (i != 2 && dropbox[i].title == 'SELECT THE OPTION') {
      showdialog(context, "please select the Valid OPTION");
      return -1;
    }
  }

  if (dropbox[2].title == 'SELECT BEC GRADE') {
    showdialog(context, "please select the Valid SECTION");
    return -1;
  }

  if (pa[0] == null || pa[0].isEmpty) {
    showdialog(context, "please fill the " + "LANGUAGES KNOWN");
    //print(compareList[check]+" was left blank");
    return -1;
  }

  if (pa[1] == null || pa[1].isEmpty) {
    showdialog(context, "please fill the " + "GAP IN EDUCATION");
    //print(compareList[check]+" was left blank");
    return -1;
  }

  if (pa[2] == null || pa[2].isEmpty) {
    showdialog(context, "please fill the " +"SKILL");
    //print(compareList[check]+" was left blank");
    return -1;
  }
  return 1;
}

class PpExtraD extends StatefulWidget {
  String regnovar;
  String usernamevar;

  final ProfileApi papi = ProfileApi();

  PpExtraD({Key key,this.regnovar,this.usernamevar}) : super(key: key);

  @override
  _PpExtraDState createState() => _PpExtraDState(regnovar : regnovar,usernamevar: usernamevar);
}

class NewObject {
  String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpExtraDState extends State<PpExtraD> {
  String regnovar;
  String usernamevar;
  bool loading = false;

  _PpExtraDState({this.regnovar, this.usernamevar});

  void _loadUploadedData([bool showSpinner = false]) async{
    if(showSpinner){
      setState(() {
        loading=true;
      });
    }

    await widget.papi.getExtraD(regnovar).then((value){
      if (value.runtimeType == Null) {
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        pa[0] = value.lang;
        pa[1] = value.gap;
        pa[2] = value.skill;
        dropbox[0].title=value.sportQ;
        dropbox[1].title=value.becS;
        dropbox[2].title=value.becG;
        dropbox[3].title=value.higherS;
        loading = false;
      });
    });
  }

  void _uploadtoDB(BuildContext context, List<String> pa,List<NewObject> dropbox,
      [bool showSpinner = false]) async {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }
//    print("Success");
    final String uregno = regnovar;
    final String lang = pa[0];
    final String gap = pa[1];
    final String skill = pa[2];
    final String sportQ = dropbox[0].title;
    final String becS = dropbox[1].title;
    final String becG = dropbox[2].title;
    final String higherS = dropbox[3].title;

    await widget.papi.uploadExtraD(
        uregno,
        lang,
        gap,
        skill,
        sportQ,
        becS,
        becG,
        higherS);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUploadedData(true);
  }

  List<String> pa = [null, null,null];

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
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
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
                labelText: pa[i],
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
            onChanged: (value) => setState(() => pa[i] = value),

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
            "ADDITIONAL INFORMATION",
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
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
                          _DropBox("SPORTS QUOTA", yesorno, 0),
                          _DropBox("BEC EXAM STATUS", yesorno, 1),
                          _DropBox("BEC EXAM GRADE", becgrade, 2),
                          _entryFieldalphabets(
                              'LANGUAGES KNOWN', pa[0], 0),
                          _entryFieldnumbers(
                              'GAP IN EDUCATION (in Years) - If Any',
                              pa[1],
                              1),
                          _DropBox("ARE YOU PLANNING FOR HIGHER STUDIES? [Y/N]",
                              yesorno, 3),
                          _entryFieldalphabets(
                              'IF ANY SKILL CERTIFICATIONS OBTAINED NAME THE SKILL', pa[2], 2),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xFFE96710),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                 if (Validation(context, pa, dropbox) == 1) {
                                   _uploadtoDB(context,pa,dropbox);

                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: HomeScreen(
                                          regnovar: regnovar,
                                          usernamevar: usernamevar,
                                        )));
                                   showdialog(context, "Your Profile Data has been Submitted Successfully!");
                                }
                              },
                              label: Text('SUBMIT'),
                              icon: Icon(Icons.upload_rounded),
                            ),
                          ),
                          SizedBox(height: height * .04),
                        ],
                      )))
                ]),
              ));
  }
}
