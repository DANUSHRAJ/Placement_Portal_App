import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'Account.dart';

class AccountsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081';

  static String apiUrl = 'https://1d05-42-110-178-204.ngrok.io';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<Account>> getAccounts() async {
    final response = await _dio.get('/getaccounts');
    return (response.data['accounts'] as List)
        .map<Account>((json) => Account.fromJson(json))
        .toList();
  }

  Future<Account> getOneAccount(String regno) async {
    final response = await _dio.post('/getoneaccount', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != null) {
      return Account.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Account> createAccount(String name, String regno, String username,
      String password, String batch) async {
    final response = await _dio.post('/createaccount', data: {
      'name': name,
      'regno': regno,
      'username': username,
      'password': password,
      'batch': batch
    });
//    log('$name-$regno-$username-$password');
    return Account.fromJson(response.data);
  }
}
