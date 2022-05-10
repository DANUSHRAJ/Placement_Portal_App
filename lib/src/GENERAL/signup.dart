import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../IWC/Interships.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:page_transition/page_transition.dart';
import '../JSON/Account.dart';
import '../GENERAL/Size_congfig.dart';
import '../api/api.dart';
import 'home_screen.dart';
import 'dart:ui' as ui;

import 'package:onesignal_flutter/onesignal_flutter.dart';

String tokenId;

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
  Timer _timer;
  double _progress;
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    if (!kIsWeb) {
      configOneSignel();
    }
  }

  void configOneSignel() {
    OneSignal.shared.setAppId('777c9b28-93c5-4aa4-bd2a-25c4e5515460');
  }

  Future<Response> sendNotification(
      List<String> tokenIdList, String heading, String contents) async {
    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "app_id": '777c9b28-93c5-4aa4-bd2a-25c4e5515460',

        "include_player_ids": tokenIdList,

        // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color": "FF9976D2",

        // "small_icon":"ic_stat_onesignal_default",

        "large_icon":
            "https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi",

        "headings": {"en": heading},

        "contents": {"en": contents},
      }),
    );
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
      _timer?.cancel();
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      final result = await widget.api.getOneAccount(regno);

      if (result == null) {
        var batch = int.parse(regno.substring(4, 6));
        batch += 2004;
        var batchstr = batch.toString();
        if (!kIsWeb) {
          OSDeviceState status = await OneSignal.shared.getDeviceState();
          // print(status.userId);
          tokenId = status.userId;
        }
        final createdAccount = await widget.api
            .createAccount(name, regno, un, pwd, batchstr, tokenId);
        check = 1;
        if (!kIsWeb) {
          await sendNotification([tokenId], "Alert!", "SignUp Successfull!");
        }
        setState(() {
          EasyLoading.showSuccess('Signup Success!');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          EasyLoading.dismiss();
          check = 0;
        });
      } else if (result.regno == regno) {
        EasyLoading.showError(
          'Account already exits!',
        );
        EasyLoading.dismiss();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        check = 2;
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
                  borderRadius: BorderRadius.circular(25),
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
                  borderRadius: BorderRadius.circular(25),
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
                    borderRadius: BorderRadius.circular(25),
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
                    borderRadius: BorderRadius.circular(25),
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
              _entryField11("Name"),
              SizedBox(
                height: height * .01,
              ),
              _entryField1("Register Number"),
              SizedBox(
                height: height * .01,
              ),
              _entryField2("Email id"),
              SizedBox(
                height: height * .01,
              ),
              _entryField3("Password", isPassword: true),
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
          width: MediaQuery.of(context).size.width * .4,
          height: 50.0,
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
                TextSpan(text: 'Join Now '),
                WidgetSpan(
                  child: Icon(Icons.arrow_right_alt_rounded,
                      size: 30, color: Colors.white),
                ),
                //),
              ],
            ),
          )
          // child: Text(
          //   "Join now —> ",
          //   style: GoogleFonts.adventPro(
          //       fontSize: 25,
          //       color: Colors.deepOrangeAccent,
          //       fontWeight: FontWeight.bold),
          // ),
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

  void _redirect() {
    Navigator.pop(
        context,
        PageTransition(
            type: PageTransitionType.topToBottom, child: LoginPage()));
  }

  void _redirect1() {
    // Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.rightToLeftWithFade, child: SignUpPage()));
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
              color: Colors.orangeAccent,
              shape: StadiumBorder(),
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              // padding: EdgeInsets.all(20.0),
              child: connected
                  ? Container(
                      height: height,
                      child: Stack(
                        children: <Widget>[
                          generateBluredImage(),
                          Container(
                            padding: EdgeInsets.all(25.0),
                            child: SingleChildScrollView(
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: height * .2),
                                  _buildMenuBar(context),
                                  SizedBox(height: height * .05),
                                  buildBlurryWidget(),
                                  SizedBox(height: height * .05),
                                  Container(
                                      alignment: Alignment.bottomRight,
                                      child: _submitButton()),
                                  SizedBox(height: height * .03),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(top: 40, left: 0, child: _backButton()),
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
