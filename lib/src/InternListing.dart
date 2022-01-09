import 'dart:ui';

import 'package:SJIT_PLACEMENT_PORTAL/src/IWCDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternListing extends StatelessWidget {
  final List<IWCDetails> internDet;

  InternListing({this.internDet});

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
      ...internDet
          .map<Widget>(
            (intern) => Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 150,
                  child: buildBlurryWidget(
                    Text(
                      '\n 🥳\n\t\t\t\tNAME OF THE INTERN: ' +
                          intern.title +
                          '\t\n\t\t\t ORGANIZATION NAME: ' +
                          intern.name +
                          '\t\n\t\t\t START DATE : ' +
                          intern.sd +
                          '\t\n',
                      style: GoogleFonts.adventPro(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
      //
    ]);
  }
}
