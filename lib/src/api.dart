import 'dart:developer';

import 'package:dio/dio.dart';

import 'Account.dart';

class AccountsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io';
  static String apiUrl = 'http://127.0.0.1:8081';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<List<Account>> getAccounts() async {
    final response = await _dio.get('/getaccounts');
    return (response.data['accounts'] as List)
        .map<Account>((json) => Account.fromJson(json))
        .toList();
  }

  Future<Account> createAccount(
      String name, String regno, String username, String password) async {
    final response = await _dio.post('/createaccount', data: {
      'name': name,
      'regno': regno,
      'username': username,
      'password': password
    });
    log('$name-$regno-$username-$password');
    return Account.fromJson(response.data);
  }
}
