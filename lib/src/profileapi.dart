import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:SJIT_PLACEMENT_PORTAL/src/ProfileData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'Account.dart';
import 'GenealDJSON.dart';

class ProfileApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io';http://127.0.0.1:8081
  static String apiUrl ='http://127.0.0.1:8';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<GenealDJSON> getGenealD(String regno) async {
    final response = await _dio.post('/getgenealD', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != null) {
      return GenealDJSON.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<GenealDJSON> uploadgenealD(
      String uregno,String rollno,String name,String fname,String lname,
  String dob1,String dob2,String dob3,String yoa,String title,String gender,String college,
      String dept,String sec,String hd
      ) async {
        final response = await _dio.post('/uploadgenealD', data: {
        'regno':uregno,
        'ROLL NO':rollno,
        'NAME OF THE CANDIDATE':name,
        'FIRST NAME':fname,
        'LAST NAME':lname,
        'DATE OF BIRTH (DD/MM/YY)':dob1,
        'DATE OF BIRTH (MM/DD/YY)':dob2,
        'DATE OF BIRTH (YYYY-MM-DD)':dob3,
        'YEAR OF ADMISSION':yoa,
        'TITILE':title,
        'GENDER':gender,
        'COLLEGE':college,
        'DEPARTMENT':dept,
        'SECTION':sec,
        'HD':hd
        });
      //    log('$name-$regno-$username-$password');
//        var result = response.data;
//        log('$result');
        return GenealDJSON.fromJson(response.data);
  }

//  Future<ProfileData> uploadppdata(List inputkey, List inputval) async {
//    ProfileApi api = ProfileApi();
//    final rescheck = await api.getOneProfile(inputval[0].toString());
////      log('$rescheck');
//    if (rescheck == null) {
////        log('Success');
//      await _dio.post('/uploadppdata', data: {'regno': inputval[0].toString()});
//    }
//
//    for (int i = 1; i < inputkey.length; i++) {
//      var tkey = inputkey[i].toString();
//      var tvalue = inputval[i].toString();
//      await _dio.post('/uploadppdataex',
//          data: {'regno': inputval[0].toString(), '$tkey': '$tvalue'});
//    }
//  }
}
