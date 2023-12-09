import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tripmating/model/write/IntroduceWirte.dart';

import 'package:tripmating/model/write/WriteDTO.dart';

import '../Controller/LoginMemberController.dart';
import 'package:get/get.dart';

import '../model/write/IntroduceList.dart';

class IntroduceWriteService {

  static Future<void> introduceWrite(WriteDTO writeDTO) async {
    final url = Uri.parse('http://10.0.2.2:8080/introduce/write');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}"
    };

    final body = json.encode(writeDTO.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 201) {
        //정상 생성 Created
        print('자기소개글 작성 성공: ${response.statusCode}');
      } else {
        print('자기소개글 작성 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }


  static Future<IntroduceWrite> findIntroduce(int memberId) async {
    final url = Uri.parse('http://10.0.2.2:8080/introduce/${memberId}');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}"
    };
    var introduceWrite;


    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        introduceWrite = IntroduceWrite.fromJson(json.decode(response.body));
        //정상 생성 Created
        print('자기소개글 조회 성공: ${response.statusCode}');
        print(introduceWrite);
      } else {

        print('자기소개글 조회 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
    return introduceWrite;
  }

  static Future<IntroduceList> findIntroduceList() async {
    final url = Uri.parse('http://10.0.2.2:8080/introduce/list');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}"
    };


    var introduceList;
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response.body);
        introduceList = IntroduceList.fromJson(jsonMap);
        for (var o in introduceList) {
          print(o);
        }
        //정상 생성 Created
        print('자기소개글 리스트조회 성공: ${response.statusCode}');
      } else {
        print('자기소개글 리스트 조회 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
    return introduceList;

  }

}