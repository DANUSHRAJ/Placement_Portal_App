import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../JSON/Account.dart';

class AccountsApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io'  'http://127.0.0.1:8081'  'https://sppdemo.herokuapp.com';
//  https://sjit-placement-portal.herokuapp.com
  static String apiUrl = 'https://sjit-placement-portal.herokuapp.com';

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
    if (res != "") {
      return Account.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<Account> createAccount(String name, String regno, String username,
      String password, String batch, String tokenId) async {
    final response = await _dio.post('/createaccount', data: {
      'name': name,
      'regno': regno,
      'username': username,
      'password': password,
      'batch': batch,
      'tokenId': tokenId
    });
//    log('$name-$regno-$username-$password');
    return Account.fromJson(response.data);
  }

  Future<Account> addTokenId(
      String regno, String password, String tokenId) async {
    final response = await _dio.post('/addtokenid',
        data: {'regno': regno, 'password': password, 'tokenId': tokenId});
//    log('$name-$regno-$username-$password');
    return Account.fromJson(response.data);
  }

  Future<Account> removeTokenId(String regno) async {
    final response = await _dio.post('/addtokenid', data: {'regno': regno});
//    log('$name-$regno-$username-$password');
    return Account.fromJson(response.data);
  }
}
