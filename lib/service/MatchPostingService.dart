import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tripmating/model/matchinginfo/Assessment.dart';
import 'package:tripmating/model/matchinginfo/MatchingInfo.dart';
import 'package:tripmating/model/matchinginfo/matchingSearch.dart';
import 'package:tripmating/model/matchinginfo/matchingresponeDTO.dart';
import 'package:tripmating/model/write/IntroduceWirte.dart';

import 'package:tripmating/model/write/WriteDTO.dart';

import '../Controller/LoginMemberController.dart';
import 'package:get/get.dart';

import '../model/write/IntroduceList.dart';

class MatchPostingService {
  static Future<void> matchPostingWrite(MatchingWrite matchingWrite) async {
    final url = Uri.parse('http://10.0.2.2:8080/match-posting/write');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}"
    };

    final body = json.encode(matchingWrite);

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('matching글 작성 성공: ${response.statusCode}');
      } else {
        print('matching글 작성 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  static Future<void> matchPostingJoin(int matchPostingId) async {
    final url =
        Uri.parse('http://10.0.2.2:8080/match-posting/join/${matchPostingId}');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}"
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('matching글 참여 성공: ${response.statusCode}');
      } else {
        print('matching글 참여 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  static Future<List<MatchingResponseDTO>> matchPostingSearch(
      MatchingSearch matchingSearch) async {
    var str = 'http://10.0.2.2:8080/match-posting/search';
    var string = matchingSearch.toQueryString();

    var url = Uri.parse(str + "?" + string);

    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}",
      'charset': "UTF-8"
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('matching글 검색 성공: ${response.statusCode}');
        var matchingList = parseMatchingInfoList(response.body);
        for (var o in matchingList) {
          print(o);
        }
        return matchingList;
      } else {
        print('matching글 검색 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }

    var s = "";
    return parseMatchingInfoList(s);
  }

  static Future<List<MatchingResponseDTO>> endedMatchPostingSearch() async {
    final url = Uri.parse('http://10.0.2.2:8080/match-posting/ended-match');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}",
      'charset': "UTF-8"
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('종료된 matching글 검색 성공: ${response.statusCode}');
        var matchingList = parseMatchingInfoList(response.body);
        for (var o in matchingList) {
          print(o);
        }
      } else {
        print('종료된 matching글 검색 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }

    var s = "";
    return parseMatchingInfoList(s);
  }

  static Future<List<MatchingResponseDTO>> endedMatchPostingMemberSearch(
      int matchId) async {
    final url =
        Uri.parse('http://10.0.2.2:8080/match-posting/ended-match/${matchId}');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}",
      'charset': "UTF-8"
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('종료된 matching글의 회원들 검색 성공: ${response.statusCode}');
        var matchingList = parseMatchingInfoList(response.body);
        for (var o in matchingList) {
          print(o);
        }
      } else {
        print('종료된 matching글 회원 검색 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }

    var s = "";
    return parseMatchingInfoList(s);
  }


  static Future<void> assessment(Assessment assessment) async {
    final url =
    Uri.parse('http://10.0.2.2:8080/match-posting/ended-match/assessment');
    final loginMemberController = Get.find<LoginMemberController>();
    final headers = {
      'Content-Type': 'application/json',
      'email': "${loginMemberController.email}",
      'charset': "UTF-8"
    };
    var body = json.encode(assessment);


    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        //정상 생성 Created
        print('회원평가 성공: ${response.statusCode}');
      } else {
        print('회원평가 실패: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }

  }

  static List<MatchingResponseDTO> parseMatchingInfoList(String jsonStr) {
    try {
      if (jsonStr.isEmpty) {
        return []; // 빈 문자열인 경우 빈 리스트 반환
      }

      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList
          .map((json) => MatchingResponseDTO.fromJson(json))
          .toList();
    } catch (e) {
      print('JSON parsing error: $e');
      return []; // 예외 발생 시 빈 리스트 반환
    }
  }
}
