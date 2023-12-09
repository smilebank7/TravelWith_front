// import 'dart:math';
//
// import 'package:get/get.dart';
// import 'package:tripmating/service/LoginService.dart';
// import 'package:tripmating/model/login-model/LoginDTO.dart';
//
// class SignupController extends GetxController {
//   final LoginService _loginService = LoginService();
//
//   RxBool isLoading = false.obs;
//
//   Future<void> login(LoginDTO loginDTO) async {
//     try {
//       isLoading(true);
//       final statusCode = await LoginService.login(loginDTO);
//
//       if (statusCode == 200) {
//         print('로그인 성공');
//       } else {
//         print('로그인 실패');
//       }
//
//     } catch (error) {
//       print("로그인 오류 : $error");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
