

import 'package:get/get.dart';

class LoginMemberController extends GetxController {
  late int id;//로그인한 회원의 PK
  late String email;//로그인한 회원의 PK
  late String name;

  void change_Email(String email) {
    this.email = email;
    update();
  }

  void logout(){
    this.email  = "";
    update();

  }
  // 이메일을 이용하여 친구 검색 메서드

  }
