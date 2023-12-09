import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

class DioServices {
  static final DioServices _dioServices = DioServices._internal();
  factory DioServices() => _dioServices;
  Map<String, dynamic> dioInformation= {};

  static Dio _dio = Dio();

  DioServices._internal() {
    _initializeDio(); // 비동기 메서드 호출을 위한 초기화 메서드 호출
  }

  Future<void> _initializeDio() async {
    /*print('\ndio실행이 시작됐습니다\n');
    storedToken = await _keyBox.getToken();
    print('토큰 저장이 성공했습니다: $storedToken');*/
    BaseOptions _options = BaseOptions(
      baseUrl: 'http://111.118.50.208:12345',
      headers: {
        'email': 'abc1234@test1.com',
      },
    );

    _dio = Dio(_options);
    print('dio실행이 끝났습니다\n');
    // _dio.interceptors.add(DioInterceptor()); --> 인터셉터 추가 (추후 구현)
  }

  Dio to() => _dio;
}
