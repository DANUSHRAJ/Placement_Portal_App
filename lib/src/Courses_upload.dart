import 'package:SJIT_PLACEMENT_PORTAL/src/courseapi.dart';
import 'package:flutter/material.dart';

class CoursesUpload extends StatefulWidget {
  CoursesUpload({Key key}) : super(key: key);
  final CourseApi api = CourseApi();

  @override
  _CoursesUploadState createState() => _CoursesUploadState();
}

class _CoursesUploadState extends State<CoursesUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
