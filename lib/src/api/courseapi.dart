// import 'dart:developer';

// import 'package:dio/dio.dart';

// import 'IWCDetails.dart';

// class CourseApi {
//   static String apiUrl = 'https://1d05-42-110-178-204.ngrok.io';
//   final _dio = Dio(BaseOptions(baseUrl: apiUrl));

// //  Future<List<IWCDetails>> getAccounts() async {
// //    final response = await _dio.get('');
// //    return (response.data['accounts'] as List)
// //        .map<Account>((json) => Account.fromJson(json))
// //        .toList();
// //  }

//   Future<IWCDetails> uploadCourse(String title, String name, String sd,
//       String ed, String clink, String plink, String flink) async {
//     final response = await _dio.post('', data: {
//       'title': title,
//       'name': name,
//       'sd': sd,
//       'ed': ed,
//       'clink': clink,
//       'plink': plink,
//       'flink': flink
//     });
// //    log('$name-$regno-$username-$password');
//     return IWCDetails.fromJson(response.data);
//   }
// }