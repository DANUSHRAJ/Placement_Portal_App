import 'dart:io';

import 'package:dio/dio.dart';

class FileUploadApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';

  static String apiUrl = 'https://bbcd-106-201-163-241.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<String> uploadFileFB(File file) async {
    var fd = FormData();
    fd.files.add(MapEntry('file', await MultipartFile.fromFile(file.path)));
    final response = await _dio.post('/uploadFileFB', data: fd);
//    log('$name-$regno-$username-$password');
    return response.data.toString();
  }
}