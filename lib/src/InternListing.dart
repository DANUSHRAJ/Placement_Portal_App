import 'package:SJIT_PLACEMENT_PORTAL/src/IWCDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternListing extends StatelessWidget {
  final List<IWCDetails> internDet;

  InternListing({this.internDet});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(height: 150),
      ...internDet
          .map<Widget>(
            (intern) => Align(
              alignment: Alignment.center,
              child: InkWell(
                child: Card(
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 50,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '🥳\n\t\tNAME OF THE INTERN: ' +
                            intern.title +
                            '\n\t\tORGANIZATION NAME: ' +
                            intern.name +
                            '\n\t\t\tSTART DATE : ' +
                            intern.sd +
                            '\n',
                        style: GoogleFonts.adventPro(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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
