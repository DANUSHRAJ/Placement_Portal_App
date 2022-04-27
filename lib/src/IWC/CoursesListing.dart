import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/JSON/IWCDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesListing extends StatelessWidget {
  final List<IWCDetails> CoursesDet;

  CoursesListing({this.CoursesDet});

  Widget buildBlurryWidget(Widget _child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: _child,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(height: 80),
      ...CoursesDet.map<Widget>(
        (intern) => Align(
          alignment: Alignment.center,
          child: InkWell(
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 150,
              child: buildBlurryWidget(
                Text(
                  '\n 🥳\n    NAME OF THE COURSE: ' +
                      intern.title.toUpperCase() +
                      '\n\n    ORGANIZATION NAME: ' +
                      intern.name.toUpperCase() +
                      '\n\n    START DATE : ' +
                      intern.sd +
                      '\n\n    END DATE : ' +
                      intern.ed +
                      '\n',
                  style: GoogleFonts.adventPro(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ),
      ).toList(),
      //
      SizedBox(height: 100),
    ]);
  }
}
