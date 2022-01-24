import 'dart:developer';

import 'package:dio/dio.dart';

import '../JSON/IWCDetails.dart';

class WSApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081';

  static String apiUrl = 'https://a7f6-122-164-185-122.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<IWCDetails>> getws() async {
    final response = await _dio.get('/getws');
    return (response.data['workshops'] as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<List<IWCDetails>> getwsDet(String regno) async {
    final response = await _dio.post('/getwsdet', data: {'regno': regno});
//    log('$response');
    return (response.data as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<IWCDetails> uploadws(
      String regno,
      String username,
      String title,
      String name,
      String sd,
      String ed,
      String clink,
      String plink,
      String flink) async {
    final response = await _dio.post('/uploadws', data: {
      'regno': regno,
      'username': username,
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
