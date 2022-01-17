import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:SJIT_PLACEMENT_PORTAL/src/signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';
import 'Size_congfig.dart';
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
        Navigator.push(
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
  Widget _entryField(String title, {bool isPassword = false}) {
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
                hintText: 'Enter Username',
                hintStyle: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xFFECD5C5),
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
        filter: new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: new Container(
          //you can change opacity with color here(I used black) for background.
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

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
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xFFECD5C5),
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
        width: MediaQuery.of(context).size.width * .3,
        //padding: EdgeInsets.symmetric(vertical: 9),
        alignment: Alignment.bottomRight,

        child: Text(
          "Let's Go \u2192",
          style: GoogleFonts.adventPro(
              fontSize: 25,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold),
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

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: SignUpPage()));
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
              'Sign up',
              style: TextStyle(
                  color: Colors.deepOrangeAccent,
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
      },
      child: Container(
        //margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.bottomRight,
              child: Text('Forgot Password ?',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
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
              _entryField("  Username"),
              SizedBox(
                height: height * .025,
              ),
              _entryField1("  Password", isPassword: true),
              _createAccountLabel1(),
              SizedBox(
                height: height * .01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              "SJIT PLACEMENT PORTAL",
              style: GoogleFonts.adventPro(
                  fontSize: 25,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: _backButton(),
            backgroundColor: Colors.black,
            elevation: 10,
          ),
          body: Container(
              height: SizeConfig.blockSizeVertical * 100,
              width: SizeConfig.blockSizeHorizontal * 150,
              // padding: EdgeInsets.all(20.0),
              child: connected
                  ? Container(
                      child: Stack(
                      children: <Widget>[
                        generateBluredImage(),
                        SingleChildScrollView(
                          child: Container(
                            //height: SizeConfig.blockSizeVertical * 120,
                            // width: SizeConfig.blockSizeHorizontal * 150,
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: height * .15),
                                Image.asset('assets/images/joseph.png',
                                    width: 300, height: 150),
                                SizedBox(height: height * .05),
                                buildBlurryWidget(),

                                SizedBox(height: 20, width: 5),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: _submitButton()),
                                SizedBox(height: height * .04),
                                _divider(),
                                _createAccountLabel(),
                                //_showToast()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                  : Container(
                      color: Colors.black,
                      height: 1000,
                      width: 1000,
                      child: Lottie.asset("assets/images/nointernet.json"),
                    )),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'There are no bottons to push :)',
          ),
          new Text(
            'Just turn off your internet.',
          ),
        ],
      ),
    );
  }
}
