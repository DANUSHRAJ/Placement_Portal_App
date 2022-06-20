import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/button_widget.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/api/fileUploadapi.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/api/wsapi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'FileUpload.dart';
import 'Interships.dart';

import '../GENERAL/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../api/internapi.dart';
import 'Workshops.dart';

class WorkshopUpload extends StatefulWidget {
  final String regnovar;
  final String usernamevar;
  // String tf_link;

  WorkshopUpload({Key key, this.regnovar, this.usernamevar}) : super(key: key);

//  final AccountsApi api = AccountsApi();
  final WSApi api = WSApi();

  @override
  _WorkshopUploadState createState() =>
      _WorkshopUploadState(regnovar: regnovar, usernamevar: usernamevar);
}

class _WorkshopUploadState extends State<WorkshopUpload> {
  final String regnovar;
  final String usernamevar;
  String tflink;
  File file;
  var fileName = 'No file selected yet';

  _WorkshopUploadState({this.regnovar, this.usernamevar});

  int _selectedIndex = 0;
// variable names = i_title  i_name  i_sd i_ed  i_clink i_plink i_flink
  final i_title = new TextEditingController();
  final i_name = new TextEditingController();
  final i_sd = new TextEditingController();
  final i_ed = new TextEditingController();
  final i_clink = new TextEditingController();
  final i_plink = new TextEditingController();
  final i_flink = new TextEditingController();

  void _addWorkshopDetails(String if_title, String if_name, String if_sd,
      String if_ed, String if_clink, String if_plink, String if_flink) async {
    await EasyLoading.show(
      status: 'Uploading Data...',
      maskType: EasyLoadingMaskType.black,
    );
    await uploadFile();
    if_flink = tflink;
//    log('$name-$regno-$un-$pwd');
//    log('$regnovar-$usernamevar');
    int check = 1;
    if (if_title.isEmpty || if_name.isEmpty || if_sd.isEmpty || if_ed.isEmpty) {
//      log('Please Fill all the fields');
      check = 0;
      EasyLoading.dismiss();
      EasyLoading.showError(
        'Incorrect Details',
      );
    }
    DateTime startDate = DateTime.parse(if_sd);
    DateTime endDate = DateTime.parse(if_ed);
    if (startDate.isBefore(endDate)) {
//      log('Correct Date');
    } else {
      check = 0;
      EasyLoading.dismiss();
      EasyLoading.showError(
        'Incorrect Date format',
      );
//      log('Wrong Date');
    }
    if (check == 1) {
      String batch = (int.parse(regnovar.substring(4, 6)) + 2004).toString();
      final upload_Workshop = await widget.api.uploadws(regnovar, usernamevar,
          batch, if_title, if_name, if_sd, if_ed, if_clink, if_plink, if_flink);
      int check = 1;
      setState(() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(
                    regnovar: regnovar,
                    usernamevar: usernamevar,
                  )),
          (route) => false,
        );

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => WorkshopUpload(
        //               regnovar: regnovar,
        //               usernamevar: usernamevar,
        //             )));
        check = 0;
      });
      EasyLoading.showSuccess('Great Success!');
      EasyLoading.dismiss();
    }
  }

  Timer _timer;

  FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
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
    var display1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "WORKSHOP UPLOAD",
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
                    _entryFieldalphabets("TITLE OF THE WORKSHOP",
                        "eg: ML,Cyber Security,Full Stack"),
                    _entryFieldalphabets2(
                        "ORGANIZATION NAME", "eg:Amazon,Microsoft,Zoho"),
                    _entryFieldDob("START DATE", "YYYY-MM-DD"),
                    _entryFieldDob2("END DATE", "YYYY-MM-DD"),
                    _entryFieldalphabets3("CERTIFICATE VERIFICATION",
                        "Enter link Or Certificate Id"),
                    _entryFieldalphabets4("PROJECT RELATED LINKS",
                        "Github links or website links or Docker Links"),
                    SizedBox(height: height * .04),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: GoogleFonts.adventPro(
                                          fontSize: 25,
                                          color: Colors.orangeAccent,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        WidgetSpan(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .7,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 4),
                                            ),
                                            child: Text(
                                              'Click To Upload Certificate',
                                              style: GoogleFonts.portLligatSans(
                                                  //textStyle: Theme.of(context).textTheme.display1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.orangeAccent),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                ],
                              ),
                            ),
                            onTap: () {
                              selectFile();
                            },
                          ),
                          Text(
                            fileName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(height: height * .02),
                        ],
                      ),
                    ),
                    // Align(
                    //   child: Text(
                    //     "\n*FILE SIZE MUST BE LESS THAN 2 mb.\n",
                    //     style: GoogleFonts.adventPro(
                    //         fontSize: 15,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(height: height * .01),
                    InkWell(
                      child: Card(
                        shadowColor: Colors.orange,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '\n       SUBMIT       \n',
                              style: GoogleFonts.adventPro(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        _addWorkshopDetails(
                            i_title.text,
                            i_name.text,
                            i_sd.text,
                            i_ed.text,
                            i_clink.text,
                            i_plink.text,
                            i_flink.text);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeScreen(
                        //               regnovar: regnovar,
                        //               usernamevar: usernamevar,
                        //             )));
                      },
                    ),
                    SizedBox(height: height * .1),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
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
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 0) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: WorkshopUpload(
                      regnovar: regnovar, usernamevar: usernamevar)));
        } else if (value == 1) {
          _showtoast("NO UPCOMING WORKSHOPS");
        } else {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  child: Workshops(
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

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;
    fileName = result.files.single.name;
    final bytes = result.files.single.bytes;
    print("Bytes $bytes");

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;
    FileUploadApi fuapi = FileUploadApi();
    // print(file);
    var urlDownload = await fuapi.uploadFileFB(file);
    print("FU: $urlDownload");
    tflink = urlDownload.toString();
  }
}
