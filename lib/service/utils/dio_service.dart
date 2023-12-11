import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/Controller/authController/LoginController.dart';

class DioServices {
  static final DioServices _dioServices = DioServices._internal();
  static String _email = '';

  factory DioServices() => _dioServices;
  Map<String, dynamic> dioInformation= {};

  static Dio _dio = Dio();

  static void setEmail(String email) {
    _email = email;
  }

  static String getEmail() {
    return _email;
  }

  DioServices._internal() {
    _initializeDio(); // 비동기 메서드 호출을 위한 초기화 메서드 호출
  }

  Future<void> _initializeDio() async {

    BaseOptions _options = BaseOptions(
      baseUrl: 'http://111.118.50.208:12345',
      headers: {
        'email': _email,
      },
    );

    _dio = Dio(_options);
    print('dio실행이 끝났습니다\n');
    // _dio.interceptors.add(DioInterceptor()); --> 인터셉터 추가 (추후 구현)
  }

  Dio to() => _dio;
}
