import 'dart:developer';

import 'package:dio/dio.dart';

import 'IWCDetails.dart';

class WorkshopApi {
  static String apiUrl = 'http://127.0.0.1:8083';
  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<IWCDetails>> getAccounts() async {
    final response = await _dio.get('/getworkshop');
    return (response.data['workshop'] as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<IWCDetails> uploadWorkshop(
      String regno, String username, String title, String name, String sd, String ed, String clink, String plink, String flink) async {
    final response = await _dio.post('/uploadworkshop', data: {
      'regno' : regno,
      'username' : username,
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
