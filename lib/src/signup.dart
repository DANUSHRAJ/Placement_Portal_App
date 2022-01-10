import 'dart:developer';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'Account.dart';
import 'api.dart';
import 'home_screen.dart';
import 'dart:ui' as ui;

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;
  final AccountsApi api = AccountsApi();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final etName = new TextEditingController();
  final etRegisterNo = new TextEditingController();
  final etmailId = new TextEditingController();
  final etPassword = new TextEditingController();

  static const colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.black,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    super.initState();
  }

  void _addAccount(String name, String regno, String un, String pwd) async {
    int check = 1;
    if (name.isEmpty || regno.isEmpty || un.isEmpty || pwd.isEmpty) {
      _showtoast("* Fields are empty");
      check = 0;
    } else if (!RegExp(r'^3124\d{8}$').hasMatch(regno)) {
      _showtoast("* Incorrect Register Number format");
      check = 0;
    } else if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$')
        .hasMatch(un)) {
      _showtoast("* Incorrect E-mail format");
      check = 0;
    } else if (!RegExp(r'[a-zA-Z0-9!@#$&()\\-`.+,/\"]{8,16}').hasMatch(pwd)) {
      _showtoast(
          "* Incorrect Password format \n-length must be 8-16 characters");
      check = 0;
    }
    if (check == 1) {
      check = 1;
//      log('Regno: $regno');
      final result = await widget.api.getOneAccount(regno);
//      log('Result: $result');
      if (result == null) {
      } else if (result.regno == regno &&
          result.username == un &&
          result.password == pwd) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      regnovar: result.regno,
                      usernamevar: result.name,
                    )));
        check = 2;
      }
    } else if (check == 1) {
      _showtoast("* Unsuccessfull coz incorrect values!");
    }
    if (check == 1) {
      //String.substring(int startIndex, [ int endIndex ])
      var batch = int.parse(regno.substring(4, 6));
      batch += 2004;
      var batchstr = batch.toString();
//      log('Batch: $batch');
      final createdAccount =
          await widget.api.createAccount(name, regno, un, pwd, batchstr);
      check = 1;
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        check = 0;
      });
      if (check == 1) {
        _showtoast("SIGNUP FAILED");
      }
    }
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

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
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

  //endtry field 1

  Widget _entryField1(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Horizon',
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  title,
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                )
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10000,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: etRegisterNo,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: 'Enter RegisterNumber (eg:3124********)',
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Color(0xFFECD5C5),
                filled: true),
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }

  //entry field 2

  Widget _entryField2(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Horizon',
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  title,
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                )
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10000,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: etmailId,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: 'Enter mail-id',
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Color(0xFFECD5C5),
                filled: true),
            keyboardType: TextInputType.emailAddress,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter
            ],
          )
        ],
      ),
    );
  }

  //entry field 3

  Widget _entryField3(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Horizon',
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  title,
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                )
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10000,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: etPassword,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  fillColor: Color(0xFFECD5C5),
                  filled: true))
        ],
      ),
    );
  }

  //entry field name

  Widget _entryField11(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Horizon',
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  title,
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                )
              ],
              isRepeatingAnimation: true,
              totalRepeatCount: 10000,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: etName,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  fillColor: Color(0xFFECD5C5),
                  filled: true))
        ],
      ),
    );
  }

  Widget buildBlurryWidget() {
    final height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .01,
              ),
              _entryField11("Name          "),
              SizedBox(
                height: height * .01,
              ),
              _entryField1("Register Number"),
              SizedBox(
                height: height * .01,
              ),
              _entryField2("Email id       "),
              SizedBox(
                height: height * .01,
              ),
              _entryField3("Password       ", isPassword: true),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildBlurryWidget1() {
  //   final height = MediaQuery.of(context).size.height;
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(20.0),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
  //       child: Container(
  //         color: Colors.white.withOpacity(0.15),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [

  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        _addAccount(
            etName.text, etRegisterNo.text, etmailId.text, etPassword.text);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .3,
        //padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.bottomRight,

        child: Text(
          "Join now\u2192",
          style: GoogleFonts.adventPro(
              fontSize: 25,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Already have an account ?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
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
      child: new BackdropFilter(
        filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 3,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'OR',
            style: GoogleFonts.adventPro(
                fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 3,
                color: Colors.white,
              ),
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
        ],
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
          "SIGN UP",
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: _backButton(),
        backgroundColor: Colors.black,
        elevation: 10,
      ),
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            generateBluredImage(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                //reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    buildBlurryWidget(),
                    SizedBox(height: height * .05),
                    _submitButton(),
                    SizedBox(height: height * .02),
                    _divider(),
                    SizedBox(height: height * .01),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
