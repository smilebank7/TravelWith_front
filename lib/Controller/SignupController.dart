// import 'package:get/get.dart';
// import 'package:tripmating/service/LoginService.dart';
// import 'package:tripmating/model/login-model/SignupDTO.dart';
//
// class SignupController extends GetxController {
//   final LoginService _loginService = LoginService();
//
//   RxBool isLoading = false.obs;
//
//   Future<void> signUp(SignupDTO signupDTO) async {
//     try {
//       isLoading(true);
//       final statusCode = await LoginService.signUp(signupDTO);
//
//       if (statusCode == 201) {
//         print('회원가입 성공');
//       } else {
//         print('회원가입 실패 $statusCode');
//       }
//
//     } catch (error) {
//       print("회원가입 오류 : $error");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
