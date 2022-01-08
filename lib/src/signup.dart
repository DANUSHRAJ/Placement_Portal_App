import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
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
    }
    if (!RegExp(r'^3124\d{8}$').hasMatch(regno)) {
      _showtoast("* Incorrect Register Number format");
      check = 0;
    }
    if (!RegExp(r'^([a-z0-9\.-]+)@([a-z0-9-]+).([a-z]{2,20})$').hasMatch(un)) {
      _showtoast("* Incorrect E-mail format");
      check = 0;
    }
    if (!RegExp(r'[a-zA-Z0-9!@#$&()\\-`.+,/\"]{8,16}').hasMatch(pwd)) {
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
      } else if (result.regno == regno || result.username == un) {
        log('Try to Login with correct credentials!');
        _showtoast("Try to Login with correct credentials!");
        check = 0;
      }
    } else {
      log('Unsuccessfull coz incorrect values!');
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
      margin: EdgeInsets.symmetric(vertical: 10),
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

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        _addAccount(
            etName.text, etRegisterNo.text, etmailId.text, etPassword.text);
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
                  blurRadius: 10,
                  spreadRadius: 3)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black, Colors.black87])),
        child: Text(
          'Register Now',
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                    fontSize: 14,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          text: 'SI',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrangeAccent,
          ),
          children: [
            TextSpan(
              text: 'GN',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: 'UP',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ]),
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

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField11("Name          "),
        _entryField1("Register Number"),
        _entryField2("Email id       "),
        _entryField3("Password       ", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
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
                    SizedBox(height: height * .1),
                    Align(alignment: Alignment.center, child: _title()),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
