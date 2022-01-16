import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:SJIT_PLACEMENT_PORTAL/src/CurrentDJSON.dart';
import 'package:SJIT_PLACEMENT_PORTAL/src/ProfileData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'Account.dart';
import 'EducationDJSON1.dart';
import 'GenealDJSON.dart';
import 'PersonalDJSON.dart';

class ProfileApi {
//  static String apiUrl = 'https://6081-27-57-63-29.ngrok.io';http://127.0.0.1:8081
  static String apiUrl = 'http://127.0.0.1:8081';

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  Future<GenealDJSON> getGenealD(String regno) async {
    final response = await _dio.post('/getgenealD', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != "") {
      return GenealDJSON.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<GenealDJSON> uploadgenealD(
      String uregno,
      String rollno,
      String name,
      String fname,
      String lname,
      String dob1,
      String dob2,
      String dob3,
      String yoa,
      String title,
      String gender,
      String college,
      String dept,
      String sec,
      String hd) async {
    ProfileApi api = ProfileApi();
    final rescheck = await api.getGenealD(uregno);
//      log('$rescheck');
    if (rescheck == null) {
      final response = await _dio.post('/uploadgenealD', data: {
        'regno': uregno,
        'ROLL NO': rollno,
        'NAME OF THE CANDIDATE': name,
        'FIRST NAME': fname,
        'LAST NAME': lname,
        'DATE OF BIRTH (DD/MM/YY)': dob1,
        'DATE OF BIRTH (MM/DD/YY)': dob2,
        'DATE OF BIRTH (YYYY-MM-DD)': dob3,
        'YEAR OF ADMISSION': yoa,
        'TITLE': title,
        'GENDER': gender,
        'COLLEGE': college,
        'DEPARTMENT': dept,
        'SECTION': sec,
        'HD': hd
      });
      //    log('$name-$regno-$username-$password');
//        var result = response.data;
//        log('$result');
      return GenealDJSON.fromJson(response.data);
    } else {
      await _dio.post('/updategenealD', data: {
        'regno': uregno,
        'ROLL NO': rollno,
        'NAME OF THE CANDIDATE': name,
        'FIRST NAME': fname,
        'LAST NAME': lname,
        'DATE OF BIRTH (DD/MM/YY)': dob1,
        'DATE OF BIRTH (MM/DD/YY)': dob2,
        'DATE OF BIRTH (YYYY-MM-DD)': dob3,
        'YEAR OF ADMISSION': yoa,
        'TITLE': title,
        'GENDER': gender,
        'COLLEGE': college,
        'DEPARTMENT': dept,
        'SECTION': sec,
        'HD': hd
      });
    }
  }

  Future<EducationDJSON> getEducationD(String regno) async {
    final response = await _dio.post('/getEducationD', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != "") {
      return EducationDJSON.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<EducationDJSON> uploadEducationD(
      final String uregno,
      final String tp, //Tenth Percentage
      final String tbs, //Tenth Board of Study
      final String tms, //Tenth Medium of Study
      final String tyop, //Tenth Year of Passing
      final String tsn, //Tenth School Name
      final String tgs, //Tenth graduating State
      final String twp,
      final String twbs,
      final String twms,
      final String twyop,
      final String twsn,
      final String twgs,
      final String dspec,
      final String dp,
      final String dyop,
      final String dsn,
      final String dgs,
      final String ugdeg,
      final String ugbranch,
      final String ugp,
      final String ugcgpa,
      final String ugyop,
      final String ugclg,
      final String ugguniv,
      final String ugs) async {
    ProfileApi api = ProfileApi();
    final rescheck = await api.getEducationD(uregno);
//      log('$rescheck');
    if (rescheck == null) {
      final response = await _dio.post('/uploadEducationD', data: {
        'regno': uregno,
        '10TH PERCENTAGE': tp,
        '10TH BOARD OF STUDY': tbs,
        '10TH MEDIUM OF STUDY': tms,
        '10TH YEAR OF PASSING': tyop,
        '10TH NAME OF SCHOOL': tsn,
        '10TH GRADUATING STATE': tgs,
        '12TH PERCENTAGE': twp,
        '12TH BOARD OF STUDY': twbs,
        '12TH MEDIUM OF STUDY': twms,
        '12TH YEAR OF PASSING': twyop,
        '12TH NAME OF SCHOOL': twsn,
        '12TH GRADUATING STATE': twgs,
        'DIPLOMA - SPECIALIZATION/BRANCH': dspec,
        'DIPLOMA PERCENTAGE': dp,
        'DIPLOMA YEAR OF PASSING': dyop,
        'NAME OF THE INSTITUTE': dsn,
        'DIPLOMA GRADUATING STATE': dgs,
        'UG DEGREE (FOR PG STUDENTS)': ugdeg,
        'UG BRANCH (FOR PG STUDENTS)': ugbranch,
        'UG PERCENTAGE (FOR PG STUDENTS)': ugp,
        'UG CGPA (FOR PG STUDENTS)': ugcgpa,
        'UG YEAR OF PASSING (FOR PG STUDENTS)': ugyop,
        'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)': ugclg,
        'UG - GRADUATING UNIVERSITY': ugguniv,
        'UG - GRADUATING STATE': ugs
      });
      //    log('$name-$regno-$username-$password');
//        var result = response.data;
//        log('$result');
      return EducationDJSON.fromJson(response.data);
    } else {
      await _dio.post('/updateEducationD', data: {
        'regno': uregno,
        '10TH PERCENTAGE': tp,
        '10TH BOARD OF STUDY': tbs,
        '10TH MEDIUM OF STUDY': tms,
        '10TH YEAR OF PASSING': tyop,
        '10TH NAME OF SCHOOL': tsn,
        '10TH GRADUATING STATE': tgs,
        '12TH PERCENTAGE': twp,
        '12TH BOARD OF STUDY': twbs,
        '12TH MEDIUM OF STUDY': twms,
        '12TH YEAR OF PASSING': twyop,
        '12TH NAME OF SCHOOL': twsn,
        '12TH GRADUATING STATE': twgs,
        'DIPLOMA - SPECIALIZATION/BRANCH': dspec,
        'DIPLOMA PERCENTAGE': dp,
        'DIPLOMA YEAR OF PASSING': dyop,
        'NAME OF THE INSTITUTE': dsn,
        'DIPLOMA GRADUATING STATE': dgs,
        'UG DEGREE (FOR PG STUDENTS)': ugdeg,
        'UG BRANCH (FOR PG STUDENTS)': ugbranch,
        'UG PERCENTAGE (FOR PG STUDENTS)': ugp,
        'UG CGPA (FOR PG STUDENTS)': ugcgpa,
        'UG YEAR OF PASSING (FOR PG STUDENTS)': ugyop,
        'UG - COLLEGE OF STUDIES (FOR PG STUDENTS)': ugclg,
        'UG - GRADUATING UNIVERSITY': ugguniv,
        'UG - GRADUATING STATE': ugs
      });
    }
  }

  Future<CurrentDJSON> getCurrentD(String regno) async {
    final response = await _dio.post('/getCurrentD', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != "") {
      return CurrentDJSON.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<CurrentDJSON> uploadCurrentD(
      final String uregno,
      final String gpa1,
      final String gpa2,
      final String gpa3,
      final String gpa4,
      final String gpa5,
      final String gpa6,
      final String gpa7,
      final String gpa8,
      final String ogpa,
      final String are1,
      final String are2,
      final String are3,
      final String are4,
      final String are5,
      final String are6,
      final String are7,
      final String are8,
      final String tare,
      final String areYN,
      final String areno) async {
    ProfileApi api = ProfileApi();
    final rescheck = await api.getCurrentD(uregno);
//      log('$rescheck');
    if (rescheck == null) {
      final response = await _dio.post('/uploadCurrentD', data: {
        'regno': uregno,
        'SEM1 GPA': gpa1,
        'SEM2 GPA': gpa2,
        'SEM3 GPA': gpa3,
        'SEM4 GPA': gpa4,
        'SEM5 GPA': gpa5,
        'SEM6 GPA': gpa6,
        'SEM7 GPA': gpa7,
        'SEM8 GPA': gpa8,
        'OVERALL CGPA': ogpa,
        'NO OF ARREARS SEM 1': are1,
        'NO OF ARREARS SEM 2': are2,
        'NO OF ARREARS SEM 3': are3,
        'NO OF ARREARS SEM 4': are4,
        'NO OF ARREARS SEM 5': are5,
        'NO OF ARREARS SEM 6': are6,
        'NO OF ARREARS SEM 7': are7,
        'NO OF ARREARS SEM 8': are8,
        'TOTAL NO OF STANDING ARREARS': tare,
        'HISTORY OF ARREARS [Y/N]': areYN,
        'IF YES, HOW MANY?': areno
      });
      //    log('$name-$regno-$username-$password');
//        var result = response.data;
//        log('$result');
      return CurrentDJSON.fromJson(response.data);
    } else {
      await _dio.post('/updateCurrentD', data: {
        'regno': uregno,
        'SEM1 GPA': gpa1,
        'SEM2 GPA': gpa2,
        'SEM3 GPA': gpa3,
        'SEM4 GPA': gpa4,
        'SEM5 GPA': gpa5,
        'SEM6 GPA': gpa6,
        'SEM7 GPA': gpa7,
        'SEM8 GPA': gpa8,
        'OVERALL CGPA': ogpa,
        'NO OF ARREARS SEM 1': are1,
        'NO OF ARREARS SEM 2': are2,
        'NO OF ARREARS SEM 3': are3,
        'NO OF ARREARS SEM 4': are4,
        'NO OF ARREARS SEM 5': are5,
        'NO OF ARREARS SEM 6': are6,
        'NO OF ARREARS SEM 7': are7,
        'NO OF ARREARS SEM 8': are8,
        'TOTAL NO OF STANDING ARREARS': tare,
        'HISTORY OF ARREARS [Y/N]': areYN,
        'IF YES, HOW MANY?': areno
      });
    }
  }

  Future<PersonalDJSON> getPersonalD(String regno) async {
    final response = await _dio.post('/getPersonalD', data: {'regno': regno});
    var res = response.data;
//    log('Response: $res');
    if (res != "") {
      return PersonalDJSON.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<PersonalDJSON> uploadPersonalD(
      final String uregno,
      final String land,
      final String pmno,
      final String emno,
      final String pmail,
      final String amail,
      final String pan,
      final String natio,
      final String pass,
      final String adhr,
      final String fname,
      final String focp,
      final String fmno,
      final String fmail,
      final String mname,
      final String mocp,
      final String mmno,
      final String mmail,
      final String paddr,
      final String paddr1,
      final String paddr2,
      final String pcity,
      final String state,
      final String pco
      ) async {
    ProfileApi api = ProfileApi();
    final rescheck = await api.getPersonalD(uregno);
//      log('$rescheck');
    if (rescheck == null) {
      final response = await _dio.post('/uploadPersonalD', data: {
        'regno': uregno,
        'LAND LINE NUMBER':land,
        'PRIMARY MOBILE NO':pmno,
        'EMERGENCY CONTACT NO':emno,
        'PRIMARY EMAIL ID':pmail,
        'ALTERNATE EMAIL ID':amail,
        'PAN CARD NUMBER':pan,
        'NATIONALITY':natio,
        'INDIAN PASSPORT NUMBER':pass,
        'AADHAAR NUMBER':adhr,
        'FATHER NAME':fname,
        'DESIGNATION & ORGANISATION':focp,
        'FATHER MOBILE NUMBER':fmno,
        'FATHER EMAIL ID':fmail,
        'MOTHER NAME':mname,
        'DESIGNATION & ORGANISATION':mocp,
        'MOTHER MOBILE NUMBER':mmno,
        'MOTHER EMAIL ID':mmail,
        'PERMANENT ADDRESS WITH PIN CODE':paddr,
        'PERMANENT ADDRESS LINE 1':paddr1,
        'PERMANENT ADDRESS LINE 2':paddr2,
        'PERMANENT CITY':pcity,
        'STATE':state,
        'POSTAL CODE':pco
      });
      //    log('$name-$regno-$username-$password');
//        var result = response.data;
//        log('$result');
      return PersonalDJSON.fromJson(response.data);
    } else {
      await _dio.post('/updatePersonalD', data: {
        'regno': uregno,
        'LAND LINE NUMBER':land,
        'PRIMARY MOBILE NO':pmno,
        'EMERGENCY CONTACT NO':emno,
        'PRIMARY EMAIL ID':pmail,
        'ALTERNATE EMAIL ID':amail,
        'PAN CARD NUMBER':pan,
        'NATIONALITY':natio,
        'INDIAN PASSPORT NUMBER':pass,
        'AADHAAR NUMBER':adhr,
        'FATHER NAME':fname,
        'DESIGNATION & ORGANISATION':focp,
        'FATHER MOBILE NUMBER':fmno,
        'FATHER EMAIL ID':fmail,
        'MOTHER NAME':mname,
        'DESIGNATION & ORGANISATION':mocp,
        'MOTHER MOBILE NUMBER':mmno,
        'MOTHER EMAIL ID':mmail,
        'PERMANENT ADDRESS WITH PIN CODE':paddr,
        'PERMANENT ADDRESS LINE 1':paddr1,
        'PERMANENT ADDRESS LINE 2':paddr2,
        'PERMANENT CITY':pcity,
        'STATE':state,
        'POSTAL CODE':pco
      });
    }
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
