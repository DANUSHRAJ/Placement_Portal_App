import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menatwork.dart';
import 'signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../../main.dart';
import '../GENERAL/Size_congfig.dart';
import '../api/api.dart';
import 'home_screen.dart';

String tokenId;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  final AccountsApi api = AccountsApi();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    super.initState();
    fToast = FToast();
    fToast.init(context);
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    configOneSignal();
    // EasyLoading.removeCallbacks();
  }

  void configOneSignal()
  {
    OneSignal.shared.setAppId('777c9b28-93c5-4aa4-bd2a-25c4e5515460');
  }

  Future<void> sendNotification(List<String> tokenIdList, String heading, String contents) async{

    await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>
      {
        "app_id": '777c9b28-93c5-4aa4-bd2a-25c4e5515460',
          
        "include_player_ids": tokenIdList,
          
          // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color":"FF9976D2",
          
        // "small_icon":"ic_stat_onesignal_default",
        
        "large_icon":"https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi",
          
        "headings": {"en": heading},
          
        "contents": {"en": contents},
          
        
      }),
    );
  }

  bool loading = false;

  final etPassword = new TextEditingController();
  final etRegisterNo = new TextEditingController();
  final account = new AccountsApi();

  Future<void> _findAccount(String regnovar, String passvar) async {
    if (regnovar.isEmpty) {
      _showtoast("* Username field is empty");
    } else if (passvar.isEmpty) {
      _showtoast("* Password field is empty");
    } else {
      _timer?.cancel();
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      final result = await widget.api.getOneAccount(regnovar);
      if (result == null) {
        EasyLoading.dismiss();
        EasyLoading.showError(
          'Account not found',
        );

        EasyLoading.dismiss();
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      } else if (result.regno == regnovar && result.password == passvar) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("RegNo", result.regno);
        sharedPreferences.setString("Uname", result.name);
        OSDeviceState status = await OneSignal.shared.getDeviceState();
        // print(status.userId);
        tokenId = status.userId;
        await widget.api.addTokenId(regnovar, passvar, tokenId);
        await sendNotification([tokenId],"Alert!","Login Successfull!");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      regnovar: result.regno,
                      usernamevar: result.name,
                    )));
        // Get.to(HomeScreen(
        //   regnovar: result.regno,
        //   usernamevar: result.name,
        // ));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => HomeScreen(
        //               regnovar: result.regno,
        //               usernamevar: result.name,
        //             )));
        EasyLoading.showSuccess('Great Success!');
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
          'LOGIN FAILED',
        );
      }
      // }
    }
  }

  FToast fToast;
  void _findAccountforFP(String regnovar) async {
    int check = 1;
    if (regnovar.isEmpty) {
      log('Please fill the Register Number');
      _showtoast("* Please enter your register number");
      check = 0;
      return;
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
                'origin': 'http://localhost',
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
          _showtoast("Kindly Check your E-mail inbox/spam box");
        }
      }
    }
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
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

  void _redirect() {
    // Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.leftToRightWithFade, child: LoginPage()));
  }

  void _redirect1() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.bottomToTop, child: SignUpPage()));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      // child: CustomPaint(
      //   painter:,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              shape: StadiumBorder(),
              onPressed: _redirect,
              color: Colors.orangeAccent,
              child: Text(
                " Existing ",
                style: GoogleFonts.adventPro(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: _redirect1,
              child: Text(
                "New",
                style: GoogleFonts.adventPro(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
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
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
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
          width: MediaQuery.of(context).size.width * .4,
          // height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.adventPro(
                  fontSize: 25,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Let's Go "),
                WidgetSpan(
                  child: Icon(Icons.arrow_right_alt_rounded,
                      size: 30, color: Colors.white),
                ),
                //),
              ],
            ),
          )),
    );
  }

  Widget _createAccountLabel1() {
    return InkWell(
      onTap: () {
        if ((etRegisterNo.toString().isNotEmpty)) {
          _findAccountforFP(etRegisterNo.text);
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
    // final height = MediaQuery.of(context).size.height;
    builder:
    EasyLoading.init();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height >= 775.0
        ? MediaQuery.of(context).size.height
        : 775.0;
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
              // height: SizeConfig.blockSizeVertical * 100,
              // width: SizeConfig.blockSizeHorizontal * 150,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: connected
                  ? Container(
                      child: Stack(
                      children: <Widget>[
                        generateBluredImage(),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(height: height * .1),
                                Image.asset('assets/images/joseph.png',
                                    width: 300, height: 150),
                                SizedBox(height: height * .05),
                                _buildMenuBar(context),
                                SizedBox(height: height * .05),
                                buildBlurryWidget(),
                                SizedBox(height: 20, width: 5),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: _submitButton()),
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
