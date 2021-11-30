import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Interships.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/loginPage.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/signupviewdata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/welcomePage.dart';
import 'api.dart';
import 'check.dart';
import 'home_screen.dart';

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
  // String Name="";
  // int RegisterNo;
  // String mailId = "";
  // String Password = "";

  static const colorizeColors = [
    Colors.limeAccent,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.black,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Horizon',
  );

  void _addAccount(String name, String regno, String un, String pwd) async {
    log('$name-$regno-$un-$pwd');
    final createdAccount = await widget.api.createAccount(name, regno, un, pwd);

    int check = 1;
    // setState(() {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => Interships()));
    //   check = 0;
    // });
    if (check == 1) {
      Navigator.push(
          // context, MaterialPageRoute(builder: (context) => WelcomePage(title: "",));
          context,
          MaterialPageRoute(
              builder: (context) => CheckData(
                    message: "FAILURE",
                  )));
    }
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
              //pause: const Duration(milliseconds: 1000),
              // onTap: () {
              //   print("Tap Event");
              // },
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
                hintStyle: TextStyle(
                  color: Colors.black45, // <-- Change this
                  fontSize: null,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Colors.white,
                filled: true),
            keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
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
              //pause: const Duration(milliseconds: 1000),
              // onTap: () {
              //   print("Tap Event");
              // },
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: Colors.white,
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
              //pause: const Duration(milliseconds: 1000),
              // onTap: () {
              //   print("Tap Event");
              // },
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  fillColor: Colors.white,
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
              //pause: const Duration(milliseconds: 1000),
              // onTap: () {
              //   print("Tap Event");
              // },
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  fillColor: Colors.white,
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
                  color: Colors.purple,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black, Colors.black87])),
        child: Text(
          'Register Now',
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.limeAccent,
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
                  color: Colors.limeAccent,
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
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'GN',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.orangeAccent,
              ),
            ),
            TextSpan(
              text: 'UP',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ]),
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
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(5)),
        //     boxShadow: <BoxShadow>[
        //       BoxShadow(
        //           color: Colors.pink.shade700,
        //           offset: Offset(2, 4),
        //           blurRadius: 5,
        //           spreadRadius: 2)
        //     ],
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [
        //           Color(0xffffa000).withAlpha(200),
        //           Color(0xff7b1fa2).withAlpha(200),
        //           Color(0xfffb7172).withAlpha(300)
        //         ])),
        child: Stack(
          children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/inner_bg.gif',
                  fit: BoxFit.fitHeight,
                )),
            Positioned(
              top: -MediaQuery.of(context).size.height * .45,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Positioned(
              top: 100,
              left: 156,
              child: _title(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),

                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    //   SizedBox(height: height * .14),
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
