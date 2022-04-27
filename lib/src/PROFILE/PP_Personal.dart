import 'dart:ui';

import 'PP_Education.dart';
import 'PP_Extra.dart';

import '../GENERAL/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../api/api.dart';
import '../api/profileapi.dart';

int Validation(BuildContext context, List<String> pp) {
  List<String> compareList = [
    'LAND LINE NUMBER',
    'PRIMARY MOBILE NO',
    'EMERGENCY CONTACT NO',
    'PRIMARY EMAIL ID',
    'ALTERNATE EMAIL ID',
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
    'POSTAL CODE',
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

  int check = -1;
  for (int i = 0; i < pp.length; i++) {
    if (!(i == 3 || i == 4 || i == 12 || i == 16)) pp[i] = pp[i].toUpperCase();
    if (pp[i] == null || pp[i].isEmpty) {
      check = i;
      break;
    }
  }
  if (check != -1) {
    showdialog(context, "please fill the " + compareList[check]);
    //print(compareList[check]+" was left blank");
    return -1;
  }

//  // phone number
  if (!RegExp(r'^(?:[+0]9)?[0-9]{11}$').hasMatch(pp[0]) && pp[0] != 'NA') {
    //print("land line number");
    showdialog(context, "Please Check the " + compareList[0]);
    return -1;
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[1])) {
    //print("primary number");
    showdialog(context, "Please Check the " + compareList[1]);
    return -1;
  }
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[2])) {
    //print("emergency number");
    showdialog(context, "Please Check the " + compareList[2]);
    return -1;
  }
  if (pp[1] == pp[2]) {
    showdialog(context,
        "Please Check Your Primary number and Emergency number should not be same");
    return -1;
  }
//
//  //email id
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$').hasMatch(pp[3])) {
    //print("primary");
    showdialog(context, "Please Check the " + compareList[3]);
    return -1;
  }
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$').hasMatch(pp[4])) {
    //print("alternate");
    showdialog(context, "Please Check the " + compareList[4]);
    return -1;
  }

  if (pp[1] == pp[2]) {
    showdialog(context,
        "Please Check Your Primary Email ID and Alternate Email ID should not be same");
    return -1;
  }

//
//  //pancard
  if (!RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(pp[5])) {
    //print("pan card");
    showdialog(context, "Please Check the " + compareList[5]);
    return -1;
  }
//^[A-PR-WYa-pr-wy][1-9]\\d\\s?\\d{4}[1-9]$
  if (!RegExp(r'^[A-Z]{1}[0-9]{7}$').hasMatch(pp[7]) && pp[7] != 'NA') {
    showdialog(context, "Please Check the " + compareList[7]);
    return -1;
  }

  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[11]) && pp[11] != 'NA') {
    //print("father's mobile number");
    showdialog(context, "Please Check the " + compareList[11]);
    return -1;
  }

  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
          .hasMatch(pp[12]) &&
      pp[12] != 'NA') {
    //print("father email id");
    showdialog(context, "Please Check the " + compareList[12]);
    return -1;
  }
//
  if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(pp[15]) && pp[15] != 'NA') {
    //print("mother's mobile number");
    showdialog(context, "Please Check the " + compareList[15]);
    return -1;
  }
//
  if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
          .hasMatch(pp[16]) &&
      pp[16] != 'NA') {
    //print("mother email id");
    showdialog(context, "Please Check the " + compareList[16]);
    return -1;
  }
//
//  //postal code
  if (!RegExp(r'^\d{6}$').hasMatch(pp[22])) {
    //print("postal code");
    showdialog(context, "Please Check the " + compareList[22]);
    return -1;
  }
  return 1;
}

class PpPersonalD extends StatefulWidget {
  String regnovar;
  String usernamevar;

  PpPersonalD({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  final AccountsApi api = AccountsApi();
  final ProfileApi papi = ProfileApi();

  @override
  _PpPersonalDState createState() =>
      _PpPersonalDState(regnovar: regnovar, usernamevar: usernamevar);
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _PpPersonalDState extends State<PpPersonalD> {
  String regnovar;
  String usernamevar;
  bool loading = false;

  _PpPersonalDState({this.regnovar, this.usernamevar});

  void _loadPPData([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    await widget.api.getOneAccount(regnovar).then((value) {
      setState(() {
        pp[3] = value.username;
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

    await widget.papi.getPersonalD(regnovar).then((value) {
//      print('In PP_GenealD: $value');
//      String temp1 = value.toString();
//      print('$temp1');
//      if(temp1=='null'||temp1.isEmpty){
//        print(value.runtimeType);
      if (value.runtimeType == Null || value.land.runtimeType == Null) {
        setState(() {
          loading = false;
        });
        return;
      }
      setState(() {
        pp[0] = value.land;
        pp[1] = value.pmno;
        pp[2] = value.emno;
        pp[3] = value.pmail;
        pp[4] = value.amail;
        pp[5] = value.pan;
        pp[6] = value.natio;
        pp[7] = value.pass;
        pp[8] = value.adhr;
        pp[9] = value.fname;
        pp[10] = value.focp;
        pp[11] = value.fmno;
        pp[12] = value.fmail;
        pp[13] = value.mname;
        pp[14] = value.mocp;
        pp[15] = value.mmno;
        pp[16] = value.mmail;
        pp[17] = value.paddr;
        pp[18] = value.paddr1;
        pp[19] = value.paddr2;
        pp[20] = value.pcity;
        pp[21] = value.state;
        pp[22] = value.pco;
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

  void _uploadtoDB(BuildContext context, [bool showSpinner = false]) async {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }
//    print("Success");
    final String uregno = regnovar;
    final String land = pp[0];
    final String pmno = pp[1];
    final String emno = pp[2];
    final String pmail = pp[3];
    final String amail = pp[4];
    final String pan = pp[5];
    final String natio = pp[6];
    final String pass = pp[7];
    final String adhr = pp[8];
    final String fname = pp[9];
    final String focp = pp[10];
    final String fmno = pp[11];
    final String fmail = pp[12];
    final String mname = pp[13];
    final String mocp = pp[14];
    final String mmno = pp[15];
    final String mmail = pp[16];
    final String paddr = pp[17];
    final String paddr1 = pp[18];
    final String paddr2 = pp[19];
    final String pcity = pp[20];
    final String state = pp[21];
    final String pco = pp[22];

    await widget.papi.uploadPersonalD(
        uregno,
        land,
        pmno,
        emno,
        pmail,
        amail,
        pan,
        natio,
        pass,
        adhr,
        fname,
        focp,
        fmno,
        fmail,
        mname,
        mocp,
        mmno,
        mmail,
        paddr,
        paddr1,
        paddr2,
        pcity,
        state,
        pco);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUploadedData(true);
    _loadPPData(true);
  }

  List<String> pp = [
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
    null,
    null,
    null,
    null,
    null
  ];

  List<String> helpmsg = [
    'Eg: 84598349381 if you don\'t have give NA',
    'Eg: 8759847459',
    'Eg: 9823347459 \nemergency no. must\nand should not same primary number',
    'Eg: abcde@gmail.com',
    'Eg: pqrst@gmail.com',
    'Eg: ASDFG7777B \nif you don\'t have now give NA\nBut for placement it\'s must',
    'Eg: INDIAN',
    'Eg: V9485644 if you don\'t have give NA',
    'Eg: 123456789012',
    'Eg: Robert Daniel',
    'Eg: DOCTOR else give NA',
    'Eg: 1234567890 else give NA',
    'Eg: wxyz@gmail.com else give NA',
    'Eg: Emily Catherine',
    'Eg: TEACHER or HOMEMAKER else give NA',
    'Eg: 1234567890 else give NA',
    'Eg: wxyz@gmail.com else give NA',
    'Eg: 2/10 6TH CROSS STREET, PALAVAKKAM, CHENNAI 600115',
    'Eg: 2/10 6TH CROSS STREET',
    'Eg: PALAVAKKAM',
    'Eg: CHENNAI',
    'Eg: TAMIL NADU',
    'Eg: 600115'
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

  Widget _entryFieldalphabets(String title, String hintmsg, String hint, int i,
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
            onChanged: (value) => setState(() => pp[i] = value),

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
            "PERSONAL DATA",
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
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .2),
                          _entryFieldnumbers(
                              'LAND LINE NUMBER', helpmsg[0], pp[0], 0),
                          _entryFieldnumbers(
                              'PRIMARY MOBILE NO', helpmsg[1], pp[1], 1),
                          _entryFieldnumbers(
                              'EMERGENCY CONTACT NO', helpmsg[2], pp[2], 2),
                          _entryFieldalphabetsdisplay(
                              'PRIMARY EMAIL ID', pp[3], 3),
                          _entryFieldalphabets(
                              'ALTERNATE EMAIL ID', helpmsg[4], pp[4], 4),
                          _entryFieldalphabets(
                              'PAN CARD NUMBER', helpmsg[5], pp[5], 5),
                          _entryFieldalphabets(
                              'NATIONALITY', helpmsg[6], pp[6], 6),
                          _entryFieldalphabets(
                              'INDIAN PASSPORT NUMBER', helpmsg[7], pp[7], 7),
                          _entryFieldnumbers(
                              'AADHAAR NUMBER', helpmsg[8], pp[8], 8),
                          _entryFieldalphabets(
                              'FATHER NAME', helpmsg[9], pp[9], 9),
                          _entryFieldalphabets(
                              'Father DESIGNATION\n& ORGANISATION',
                              helpmsg[10],
                              pp[10],
                              10),
                          _entryFieldnumbers(
                              'FATHER MOBILE NUMBER', helpmsg[11], pp[11], 11),
                          _entryFieldalphabets(
                              'FATHER EMAIL ID', helpmsg[12], pp[12], 12),
                          _entryFieldalphabets(
                              'MOTHER NAME', helpmsg[13], pp[13], 13),
                          _entryFieldalphabets(
                              'Mother DESIGNATION\n& ORGANISATION',
                              helpmsg[14],
                              pp[14],
                              14),
                          _entryFieldnumbers(
                              'MOTHER MOBILE NUMBER', helpmsg[15], pp[15], 15),
                          _entryFieldalphabets(
                              'MOTHER EMAIL ID', helpmsg[16], pp[16], 16),
                          _entryFieldalphabets(
                              'PERMANENT ADDRESS\nWITH PIN CODE',
                              helpmsg[17],
                              pp[17],
                              17),
                          _entryFieldalphabets('PERMANENT ADDRESS LINE 1',
                              helpmsg[18], pp[18], 18),
                          _entryFieldalphabets('PERMANENT ADDRESS LINE 2',
                              helpmsg[19], pp[19], 19),
                          _entryFieldalphabets(
                              'PERMANENT CITY', helpmsg[20], pp[20], 20),
                          _entryFieldalphabets(
                              'STATE', helpmsg[21], pp[21], 21),
                          _entryFieldnumbers(
                              'POSTAL CODE', helpmsg[22], pp[22], 22),
                          SizedBox(height: height * .02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xFFE96710),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                if (Validation(context, pp) == 1) {
                                  _uploadtoDB(context);
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: PpExtraD(
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
