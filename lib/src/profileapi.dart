import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:SJIT_PLACEMENT_PORTAL/src/ProfileData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'Account.dart';

class ProfileApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io';http://127.0.0.1:8081
  static String apiUrl =
      'https://58ab-2401-4900-2329-ca1a-d9ca-9612-fcb2-c454.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<Account> getOneProfile(String regno) async {
    final response = await _dio.post('/getoneprofile', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != null) {
      return Account.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ProfileData> uploadppdata(List inputkey, List inputval) async {
    ProfileApi api = ProfileApi();
    final rescheck = await api.getOneProfile(inputval[0].toString());
//      log('$rescheck');
    if (rescheck == null) {
//        log('Success');
      await _dio.post('/uploadppdata', data: {'regno': inputval[0].toString()});
    }

    for (int i = 1; i < inputkey.length; i++) {
      var tkey = inputkey[i].toString();
      var tvalue = inputval[i].toString();
      await _dio.post('/uploadppdataex',
          data: {'regno': inputval[0].toString(), '$tkey': '$tvalue'});
    }
  }
}
