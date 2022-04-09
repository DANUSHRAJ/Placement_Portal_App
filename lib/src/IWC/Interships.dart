import 'dart:developer';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'Intership_upload.dart';
import '../PROFILE/PP_Data.dart';

import '../GENERAL/home_screen.dart';
import '../GENERAL/loginPage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../JSON/IWCDetails.dart';
import 'InternListing.dart';
import '../api/internapi.dart';

class Interships extends StatefulWidget {
  final String regnovar;
  final String usernamevar;

  final InternsApi api = InternsApi();

  Interships({Key key, this.regnovar, this.usernamevar}) : super(key: key);

  @override
  _IntershipsState createState() =>
      _IntershipsState(regnovar: regnovar, usernamevar: usernamevar);
}

class _IntershipsState extends State<Interships> with TickerProviderStateMixin {
  final String regnovar;
  final String usernamevar;
  AnimationController _controller;
  _IntershipsState({this.regnovar, this.usernamevar});

  List<IWCDetails> internDet = [];
  bool loading = false;

  var title, name, recno;

  get child => null;

  void _loadInternDetails([bool showSpinner = false]) async {
//    log('Regno: $regnovar');
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }
//    print("Success");
    await widget.api.getinternsDet(regnovar).then((value) {
      setState(() {
        internDet = value;
        print(value.runtimeType);
        loading = false;
      });
    });
    Map<int, IWCDetails> map = internDet.asMap();
    for (int i = 0; i < map.length; i++) {
//      print(map[i]);
      title = map[i].title;
      name = map[i].name;
      recno = (i + 1).toString();
      //log('Record: RecNo: $recno-Title: $title-Cmp Name: $name');
    }
  }

  int _selectedIndex = 0;
  FToast fToast;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    _loadInternDetails(true);
    fToast = FToast();
    fToast.init(context);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final rollno = "dan";

    final List<IWCDetails> internDet1 = internDet;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "INTERSHIP COMPLETED",
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
      backgroundColor: Colors.black,
      body: loading
          ? Center(child: Lottie.asset('assets/images/loading.json'))
          : Stack(children: <Widget>[
              generateBluredImage(),
              Align(
                alignment: Alignment.centerLeft,
                child: InternListing(
                  internDet: internDet,
                ),
              ),
              //SizedBox(height: height * 1),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildBottomNavigationBar(),
                ),
              ),
              SizedBox(height: height * .1),
            ]),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        if (value == 2) {
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
        // setState(() {
        //   _selectedIndex = value;
        // });
      },
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.deepOrangeAccent,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined), label: "COMPLETED"),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded), label: "UPCOMING"),
        BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: "UPLOAD"),
      ],
    );
  }
}
