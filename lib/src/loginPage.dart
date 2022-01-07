import 'dart:convert';
import 'dart:developer';

import 'package:SJIT_PLACEMENT_PORTAL/src/signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'Widget/bezierContainer.dart';
import 'api.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  final AccountsApi api = AccountsApi();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  final etPassword = new TextEditingController();
  final etRegisterNo = new TextEditingController();
  final account = new AccountsApi();

  void _findAccount(String regnovar, String passvar) async {
    if (regnovar.isEmpty) {
      _showtoast("* Username field is empty");
    } else if (passvar.isEmpty) {
      _showtoast("* Password field is empty");
    } else {
      final result = await widget.api.getOneAccount(regnovar);
      if (result.regno == regnovar && result.password == passvar) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      regnovar: result.regno,
                      usernamevar: result.name,
                    )));
      } else {
        _showtoast(
            "                 LOGIN FAILED\nUsername or Password is Incorrect");
      }
    }
  }

  FToast fToast;
  void _findAccountforFP(String regnovar) async {
    int check = 1;
    if (regnovar.isEmpty) {
      log('Please fill the Register Number');
      _showtoast("* Please enter your register number");
      check = 0;
    }
    if (check == 1) {
      final result = await widget.api.getOneAccount(regnovar);
      if (result == null) {
      } else {
        if (result.regno == regnovar) {
          var user_name = result.name;
          var user_email = result.username;
          var user_pass = result.password;
          final serviceId = 'service_05h93bt';
          final templateId = 'template_ak2pbyr';
          final userId = 'user_I2dh7BAhEyocnuYr33mnr';

          final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
          final response = await http.post(url,
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({
                'service_id': serviceId,
                'template_id': templateId,
                'user_id': userId,
                'template_params': {
                  'user_name': "$user_name",
                  'user_email': "$user_email",
                  'user_subject': "Forgot Password",
                  'user_message': "$regnovar's password is: $user_pass",
                }
              }));

          print(response.body);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              //padding: EdgeInsets.only(top: 10), //, bottom: 10),
              child: Icon(Icons.home_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

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
  Widget _entryField(String title, {bool isPassword = false}) {
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
                hintText: 'Enter Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
            keyboardType: TextInputType.number,

            // ],
          )
        ],
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
            controller: etPassword,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: 'Enter Password',
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

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        _findAccount(etRegisterNo.text, etPassword.text);
        // Navigator.pop(
        //     context, MaterialPageRoute(builder: (context) => ()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.purple.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black87, Colors.black87])),
        child: Text(
          'Login',
          style: GoogleFonts.adventPro(
              fontSize: 30,
              color: Colors.limeAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
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
          Text(
            'OR',
            style: GoogleFonts.adventPro(
                fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 3,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Not yet Joined ?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.limeAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel1() {
    return InkWell(
      onTap: () {
        if ((etRegisterNo.toString().isNotEmpty)) {
          _findAccountforFP(etRegisterNo.text);
          _showtoast("Kindly Check your E-mail inbox/spam box");
        }
//        }Navigator.push(
//            context, MaterialPageRoute(builder: (context) => Interships()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.bottomRight,
              child: Text('Forgot Password ?',
                  style: TextStyle(
                      color: Colors.limeAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'LO',
          style: GoogleFonts.adventPro(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'G',
              style: GoogleFonts.adventPro(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.orangeAccent,
              ),
            ),
            TextSpan(
              text: 'IN',
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
        _entryField("Username"),
        _entryField1("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            child: Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/inner_bg.gif',
              fit: BoxFit.cover,
            )),
        Positioned(
            top: -height * .45,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainer()),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * .08),
                Positioned(top: 40, left: 0, child: _backButton()),
                SizedBox(height: height * .02),
                Align(alignment: Alignment.center, child: _title()),
                SizedBox(height: 80),
                _emailPasswordWidget(),
                SizedBox(height: 20, width: 5),
                _submitButton(),
                Align(
                    alignment: Alignment.bottomRight,
                    child: _createAccountLabel1()),
                _divider(),
                _createAccountLabel(),
                //_showToast()
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
