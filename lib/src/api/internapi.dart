import 'dart:developer';

import 'package:dio/dio.dart';

import '../JSON/IWCDetails.dart';

class InternsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081';

  static String apiUrl = 'https://sjit-placement-portal.herokuapp.com';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<IWCDetails>> getinterns() async {
    final response = await _dio.get('/getintern');
    return (response.data['interns'] as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<List<IWCDetails>> getinternsDet(String regno) async {
    final response = await _dio.post('/getinterndet', data: {'regno': regno});
//    log('$response');
    return (response.data as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<IWCDetails> uploadIntern(
      String regno,
      String username,
      String batch,
      String title,
      String name,
      String sd,
      String ed,
      String clink,
      String plink,
      String flink) async {
    final response = await _dio.post('/uploadintern', data: {
      'regno': regno,
      'username': username,
      'batch': batch,
      'title': title,
      'name': name,
      'sd': sd,
      'ed': ed,
      'clink': clink,
      'plink': plink,
      'flink': flink
    });
//    log('$name-$regno-$username-$password');
    return IWCDetails.fromJson(response.data);
  }
}
