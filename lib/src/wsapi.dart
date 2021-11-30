import 'dart:developer';

import 'package:dio/dio.dart';

import 'IWCDetails.dart';

class WorkshopApi {
  static String apiUrl = 'http://127.0.0.1:8083';
  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

//  Future<List<IWCDetails>> getAccounts() async {
//    final response = await _dio.get('');
//    return (response.data['accounts'] as List)
//        .map<Account>((json) => Account.fromJson(json))
//        .toList();
//  }

  Future<IWCDetails> uploadWorkshop(
      String regno, String username, String title, String name, String sd, String ed, String clink, String plink, String flink) async {
    final response = await _dio.post('', data: {
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
