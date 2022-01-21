// import 'package:SJIT_PLACEMENT_PORTAL/src/PP_Data.dart';
// import 'package:SJIT_PLACEMENT_PORTAL/src/Widget/bezierContainer.dart';
// import 'package:SJIT_PLACEMENT_PORTAL/src/Workshops.dart';
// import 'package:SJIT_PLACEMENT_PORTAL/src/home_screen.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

// import 'Intership_upload.dart';
// import 'wsapi.dart';

// class WorkshopUpload extends StatefulWidget {
//   final String regnovar;
//   final String usernamevar;

//   WorkshopUpload({Key key, this.regnovar, this.usernamevar}) : super(key: key);
//   final WorkshopApi api = WorkshopApi();

//   @override
//   _WorkshopUploadState createState() =>
//       _WorkshopUploadState(regnovar: regnovar, usernamevar: usernamevar);
// }

// class _WorkshopUploadState extends State<WorkshopUpload> {
//   final String regnovar;
//   final String usernamevar;

//   _WorkshopUploadState({this.regnovar, this.usernamevar});

//   int _selectedIndex = 0;

// //  variable names = i_title  i_name  i_sd i_ed  i_clink i_plink i_flink
//   final w_title = new TextEditingController();
//   final w_name = new TextEditingController();
//   final w_sd = new TextEditingController();
//   final w_ed = new TextEditingController();
//   final w_clink = new TextEditingController();
//   final w_plink = new TextEditingController();
//   final w_flink = new TextEditingController();

//   void _addWorkshopDetails(String wf_title, String wf_name, String wf_sd,
//       String wf_ed, String wf_clink, String wf_plink, String wf_flink) async {
// //    log('$name-$regno-$un-$pwd');
//     wf_flink = "";
//     final upload_workshop = await widget.api.uploadWorkshop(
//         regnovar,
//         usernamevar,
//         wf_title,
//         wf_name,
//         wf_sd,
//         wf_ed,
//         wf_clink,
//         wf_plink,
//         wf_flink);
//     int check = 1;
//     setState(() {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => WorkshopUpload(
//                     regnovar: regnovar,
//                     usernamevar: usernamevar,
//                   )));
//       check = 0;
//     });
//     if (check == 1) {
//       // Navigator.push(
//       //     // context, MaterialPageRoute(builder: (context) => WelcomePage(title: "",));
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (context) => CheckData(
//       //               message: "FAILURE",
//       //             )));
//     }
//   }

//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => HomeScreen(
//                       regnovar: regnovar,
//                       usernamevar: usernamevar,
//                     )));
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
//               child: Icon(Icons.home_outlined, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryFieldalphabets(String title, String hint,
//       {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: w_title,
//             decoration: InputDecoration(
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _entryFieldalphabets2(String title, String hint,
//       {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: w_name,
//             // decoration: InputDecoration(
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _entryFieldalphabets3(String title, String hint,
//       {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: w_clink,
//             decoration: InputDecoration(
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _entryFieldalphabets4(String title, String hint,
//       {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: w_plink,
//             decoration: InputDecoration(
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _entryFieldDob(String title, String hint, {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           TextFormField(
//             controller: w_sd,
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.calendar_today),
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//             keyboardType: TextInputType.number,
//             // keyboardType: TextInputType.number,
//             // inputFormatters: <TextInputFormatter>[
//             //   FilteringTextInputFormatter.digitsOnly
//             // ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _entryFieldDob2(String title, String hint, {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       width: 500,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.portLligatSans(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.limeAccent,
//             ),
//           ),
//           TextFormField(
//             controller: w_ed,
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.calendar_today),
//                 hintText: hint,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//                 fillColor: Color(0xfff3f3f4),
//                 filled: true),
//             keyboardType: TextInputType.number,
//             // keyboardType: TextInputType.number,
//             // inputFormatters: <TextInputFormatter>[
//             //   FilteringTextInputFormatter.digitsOnly
//             // ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _submitButton(String title) {
//     return InkWell(
//       onTap: () {
//         _addWorkshopDetails(w_title.text, w_name.text, w_sd.text, w_ed.text,
//             w_clink.text, w_plink.text, w_flink.text);
//         //_findAccount(etRegisterNo.text, etPassword.text);
//         // Navigator.pop(
//         //     context, MaterialPageRoute(builder: (context) => ()));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width * .5,
//         padding: EdgeInsets.symmetric(vertical: 9),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//             // boxShadow: <BoxShadow>[
//             //   BoxShadow(
//             //       color: Colors.purple.shade200,
//             //       offset: Offset(2, 4),
//             //       blurRadius: 5,
//             //       spreadRadius: 1)
//             // ],
//             gradient: LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [Colors.black87, Colors.black87])),
//         child: Text(
//           title,
//           style: GoogleFonts.adventPro(
//               fontSize: 30,
//               color: Colors.limeAccent,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         text: 'WORK',
//         style: GoogleFonts.portLligatSans(
//           fontSize: 30,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),
//         children: [
//           TextSpan(
//             text: 'SHOP',
//             style: GoogleFonts.adventPro(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Colors.black,
//             ),
//           ),
//           TextSpan(
//             text: '\nUPL',
//             style: GoogleFonts.adventPro(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Colors.orangeAccent,
//             ),
//           ),
//           TextSpan(
//             text: 'OAD',
//             style: GoogleFonts.adventPro(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Colors.lightGreenAccent,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Image.asset(
//                 'assets/images/inner_bg.gif',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: -MediaQuery.of(context).size.height * .45,
//               right: -MediaQuery.of(context).size.width * .4,
//               child: BezierContainer(),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: height * .1),
//                     _title(),
//                     SizedBox(height: height * .05),
//                     _entryFieldalphabets("TITLE OF THE WORKSHOP",
//                         "eg:ML,Cyber Security,Full Stack"),
//                     _entryFieldalphabets2(
//                         "ORGANIZATION NAME", "eg:Amazon,Microsoft,Zoho"),
//                     _entryFieldDob("START DATE", "DD-MM-YYYY"),
//                     _entryFieldDob2("END DATE", "DD-MM-YYYY"),
//                     _entryFieldalphabets3("CERTIFICATE VERIFICATION",
//                         "Enter link Or Certificate Id"),
//                     _entryFieldalphabets4("PROJECT RELATED LINKS",
//                         "Github links or website links or Docker Links"),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           InkWell(
//                             child: Card(
//                               color: Colors.amberAccent,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10)),
//                               elevation: 8,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     '\n     UPLOAD HERE    \n',
//                                     style: GoogleFonts.adventPro(
//                                         fontSize: 15,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   PageTransition(
//                                       type: PageTransitionType.bottomToTop,
//                                       child: PpData()));
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       child: Text(
//                         "\n\n*ONLY .PDF FORMAT IS ACCEPTED.\n\n*FILE SIZE MUST BE LESS THAN 2 mb.\n\n",
//                         style: GoogleFonts.adventPro(
//                             fontSize: 15,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     _submitButton("SUBMIT"),
//                     SizedBox(height: height * .15),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(top: 40, left: 0, child: _backButton()),
//             //SizedBox(height: height * .67),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: buildBottomNavigationBar(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   BottomNavigationBar buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       backgroundColor: Colors.transparent,
//       type: BottomNavigationBarType.fixed,
//       currentIndex: _selectedIndex,
//       onTap: (value) {
//         if (value == 1) {
//           Navigator.push(
//               context,
//               PageTransition(
//                   type: PageTransitionType.fade, child: Workshops()));
//         } else {
//           Navigator.push(
//               context,
//               PageTransition(
//                   type: PageTransitionType.fade, child: WorkshopUpload()));
//         }
//         setState(() {
//           _selectedIndex = value;
//         });
//       },
//       unselectedItemColor: Colors.white,
//       selectedItemColor: Colors.limeAccent,
//       items: [
//         BottomNavigationBarItem(
//             icon: Icon(Icons.upload_file), label: "UPLOAD CERTIFICATES"),
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
//       ],
//     );
//   }
// }
