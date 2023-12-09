import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tripmating/model/login-model/LoginDTO.dart';
import 'package:tripmating/model/login-model/SignupDTO.dart';
import 'package:get/get.dart';
import '../Controller/LoginMemberController.dart';

class LoginService {
  //회원가입
//return값은 signupUser
  static Future<SignupDTO> signUp(SignupDTO signUpUser) async {
    final url = Uri.parse('http://10.0.2.2:8080/members/signup');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode(signUpUser.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        //정상 생성 Created
        print('회원가입성공: ${response.statusCode}');
      } else {
        print('회원가입실패: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
    return signUpUser;
  }

//추후에 세션아이디
  static Future<int> login(LoginDTO loginDTO) async {
    final url = Uri.parse('http://10.0.2.2:8080/auth/login');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode(loginDTO.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print(response.body);
        final loginMemberController = Get.put(LoginMemberController());
        loginMemberController.change_Email(response.body);
        print('로그인성공: ${response.statusCode}');
        return response.statusCode;
      } else {
        print('로그인실패: ${response.statusCode} ${response.body}');
        return response.statusCode;
      }
    } catch (e) {
      print('오류 발생: $e');
    }

    return -1;
  }

  static Future<void> logout() async {
    final url = Uri.parse('http://10.0.2.2:8080/auth/logout');
    final headers = {
      'Content-Type': 'application/json',
    };
    final loginMemberController = Get.find<LoginMemberController>();
    if (loginMemberController.email.isEmpty){
      print("not login");
      return;
    }

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        print('로그아웃 성공: ${response.statusCode}');
      } else {
        print('로그아웃 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }
}
