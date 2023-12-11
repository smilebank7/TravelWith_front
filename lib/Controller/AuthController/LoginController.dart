import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '/service/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/quickalert.dart';
import 'package:go_router/go_router.dart';

import '/service/utils/dio_service.dart';

class LoginDTO {
  String email;
  String password;

  LoginDTO ({
    required this.email,
    required this.password
  });

  LoginDTO copyWith({
    String? email,
    String? password,
  }) {
    return LoginDTO(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

void login2(String email,String password, BuildContext context) async {

    Dio _dio = Dio();
    final response = await _dio.post('http://111.118.50.208:12345/auth/login', data:
    {
        "email": email,
        "password": password,
      }
    );

    if (response.statusCode == 200) {
      print("성공해버린..");
      DioServices.setEmail(email);

      context.go('/');
    }
    else {
      print("실패해버린..");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "로그인 실패",
      );
    }
  }
