import 'dart:developer';

import 'package:dio/dio.dart';

import 'IWCDetails.dart';

class WorkshopApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io';
  static String apiUrl =
      'https://1f30-2402-3a80-19a0-53c2-a1d3-989d-e5f6-5d57.ngrok.io';
  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<IWCDetails>> getAccounts() async {
    final response = await _dio.get('/getworkshop');
    return (response.data['workshop'] as List)
        .map<IWCDetails>((json) => IWCDetails.fromJson(json))
        .toList();
  }

  Future<IWCDetails> uploadWorkshop(
      String regno,
      String username,
      String title,
      String name,
      String sd,
      String ed,
      String clink,
      String plink,
      String flink) async {
    final response = await _dio.post('/uploadworkshop', data: {
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
