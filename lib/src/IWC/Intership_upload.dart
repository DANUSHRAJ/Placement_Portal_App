import 'dart:developer';
import 'dart:ui';

import 'Interships.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import '../GENERAL/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../api/internapi.dart';

class IntershipUpload extends StatefulWidget {
  final String regnovar;
  final String usernamevar;

  IntershipUpload({Key key, this.regnovar, this.usernamevar}) : super(key: key);

//  final AccountsApi api = AccountsApi();
  final InternsApi api = InternsApi();

  @override
  _IntershipUploadState createState() =>
      _IntershipUploadState(regnovar: regnovar, usernamevar: usernamevar);
}

class _IntershipUploadState extends State<IntershipUpload> {
  final String regnovar;
  final String usernamevar;

  _IntershipUploadState({this.regnovar, this.usernamevar});

  int _selectedIndex = 0;
// variable names = i_title  i_name  i_sd i_ed  i_clink i_plink i_flink
  final i_title = new TextEditingController();
  final i_name = new TextEditingController();
  final i_sd = new TextEditingController();
  final i_ed = new TextEditingController();
  final i_clink = new TextEditingController();
  final i_plink = new TextEditingController();
  final i_flink = new TextEditingController();

  void _addInternDetails(String if_title, String if_name, String if_sd,
      String if_ed, String if_clink, String if_plink, String if_flink) async {
//    log('$name-$regno-$un-$pwd');
//    log('$regnovar-$usernamevar');
    int check = 1;
    if (if_title.isEmpty || if_name.isEmpty || if_sd.isEmpty || if_ed.isEmpty) {
//      log('Please Fill all the fields');
      check = 0;
    }
    DateTime startDate = DateTime.parse(if_sd);
    DateTime endDate = DateTime.parse(if_ed);
    if (startDate.isBefore(endDate)) {
//      log('Correct Date');
    } else {
      check = 0;
//      log('Wrong Date');
    }
    if (check == 1) {
      if_flink = "";
      final upload_intern = await widget.api.uploadIntern(regnovar, usernamevar,
          if_title, if_name, if_sd, if_ed, if_clink, if_plink, if_flink);
      int check = 1;
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IntershipUpload(
                      regnovar: regnovar,
                      usernamevar: usernamevar,
                    )));
        check = 0;
      });
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      regnovar: regnovar,
                      usernamevar: usernamevar,
                    )));
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
            controller: i_title,
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
          )
        ],
      ),
    );
  }

  Widget _entryFieldalphabets2(String title, String hint,
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
            controller: i_name,
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
          )
        ],
      ),
    );
  }

  FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget _entryFieldalphabets3(String title, String hint,
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
            controller: i_clink,
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
          )
        ],
      ),
    );
  }

  Widget _entryFieldalphabets4(String title, String hint,
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
            controller: i_plink,
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
            controller: i_sd,
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

  Widget _entryFieldDob2(String title, String hint, {bool isPassword = false}) {
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
            controller: i_ed,
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

  Widget _submitButton(String title) {
    return InkWell(
      onTap: () {
        _addInternDetails(i_title.text, i_name.text, i_sd.text, i_ed.text,
            i_clink.text, i_plink.text, i_flink.text);
        //_findAccount(etRegisterNo.text, etPassword.text);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      regnovar: regnovar,
                      usernamevar: usernamevar,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.orangeAccent,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black87, Colors.black87])),
        child: Text(
          title,
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showtoast(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.limeAccent,
        fontSize: 16.0);
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
      appBar: AppBar(
        title: Text(
          "INTERNSHIP UPLOAD",
          style: GoogleFonts.adventPro(
              fontSize: 30,
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
      body: Container(
        child: Stack(
          children: <Widget>[
            generateBluredImage(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _entryFieldalphabets("TITLE OF THE INTERN",
                        "eg: ML,Cyber Security,Full Stack"),
                    _entryFieldalphabets2(
                        "ORGANIZATION NAME", "eg:Amazon,Microsoft,Zoho"),
                    _entryFieldDob("START DATE", "YYYY-MM-DD"),
                    _entryFieldDob2("END DATE", "YYYY-MM-DD"),
                    _entryFieldalphabets3("CERTIFICATE VERIFICATION",
                        "Enter link Or Certificate Id"),
                    _entryFieldalphabets4("PROJECT RELATED LINKS",
                        "Github links or website links or Docker Links"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Card(
                              color: Colors.amberAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '\n     UPLOAD HERE    \n',
                                    style: GoogleFonts.adventPro(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: HomeScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      child: Text(
                        "\n\n*ONLY .PDF FORMAT IS ACCEPTED.\n\n*FILE SIZE MUST BE LESS THAN 2 mb.\n\n",
                        style: GoogleFonts.adventPro(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _submitButton("SUBMIT"),
                    SizedBox(height: height * .1),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
            //SizedBox(height: height * .67),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 0) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: IntershipUpload(
                      regnovar: regnovar, usernamevar: usernamevar)));
        } else if (value == 1) {
          _showtoast("NO UPCOMING INTERNS");
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: Interships(
                    regnovar: regnovar,
                    usernamevar: usernamevar,
                  )));
        }
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.deepOrangeAccent,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: "UPLOAD"),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded), label: "UPCOMING"),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined), label: "COMPLETED"),
      ],
    );
  }
}