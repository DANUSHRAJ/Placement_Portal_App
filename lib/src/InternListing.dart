import 'package:SJIT_PLACEMENT_PORTAL/src/IWCDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InternListing extends StatelessWidget {
  final List<IWCDetails> internDet;

  InternListing({this.internDet});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...internDet
          .map<Widget>(
            (intern) =>
            Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            40)),
                    elevation: 50,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' \n ' + intern.name +'.\n  NAME OF THE INTERN: '+intern.title+'\n\n  ORGANIZATION NAME: '+intern.name+'\n\n  DURATION(in months):             \n',
                          style:
                          GoogleFonts.adventPro(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight:
                              FontWeight
                                  .bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ).toList(),
      SizedBox(height: 70),
    ]);
  }
}