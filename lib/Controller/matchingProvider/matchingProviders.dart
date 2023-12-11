import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/service/utils/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:quickalert/quickalert.dart';

import '/model/matchinginfo/NEW/MatchResponseDetail.dart';

//dto 클래스 선언하고 json파싱하는 함수 만들어주세요
/*
class travelDataDTO{
  final String startDate;
  final String endDate;
  final String title;
  final String contents;
  final int travelExpenses;
  final int numOfPeoples;
  final bool isAccomodationTogether;
  final bool isDiningTogether;
  final String mainTravelSpace;
  final List<dynamic> host;
  final List<dynamic> participants;

  travelDataDTO({
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.contents,
    required this.travelExpenses,
    required this.numOfPeoples,
    required this.isAccomodationTogether,
    required this.isDiningTogether,
    required this.mainTravelSpace,
    required this.host,
    required this.participants,
  });

  factory travelDataDTO.fromTravelData(Map<String, dynamic> json) {
    final List<dynamic> hostJson = json['host'];
    final List<dynamic> participantsJson = json['participants'];
    return travelDataDTO(
      startDate: json['startDate'],
      endDate: json['endDate'],
      title: json['title'],
      contents: json['contents'],
      travelExpenses: json['travelExpenses'],
      numOfPeoples: json['numOfPeoples'],
      isAccomodationTogether: json['isAccomodationTogether'],
      isDiningTogether: json['isDiningTogether'],
      mainTravelSpace: json['mainTravelSpace'],
      host: hostJson,
      participants: participantsJson,
    );
  }
}
*/


// 이부분은 provider(리버팟) 컨트롤러 입니다. 여기서 함수로 api 불러와서, state에 저장하면 됩니다. state는 내장이라 선언안해도 자동 생성
class travelListController extends StateNotifier<List<MatchResponseDetail>>{
  travelListController() : super([]);

  Future<void> SearchAPI(String? value) async {
    // DioServices().to()를 통해 Dio를 사용할 수 있습니다. 싱글톤이니까 임포트해서 쓰세요.
    Dio _dio = DioServices().to();

    if (value == null) {
      final response = await _dio.get('/match-posting/search',
      );
      if (response.statusCode == 200) {
        print("성공해버린1..");

        final List<dynamic> travelListJson = response.data;
        List<MatchResponseDetail> travelList = travelListJson.map((item) => MatchResponseDetail.fromJson(item)).toList();
        state = travelList;
      }
      else {
        print("실패해버린..");
      }
    }
    else {
      final response = await _dio.get('/match-posting/search/$value',
      );
      if (response.statusCode == 200) {
        print("성공해버린2..");

        final List<dynamic> travelListJson = response.data;
        List<MatchResponseDetail> travelList = travelListJson.map((item) => MatchResponseDetail.fromJson(item)).toList();
        state = travelList;
      }
      else {
        print("실패해버린..");
      }
    }


  }

  Future<void> ConditionAPI(String? startDate, String? endDate, int money,String? value, BuildContext context) async {
    Dio _dio = DioServices().to();

    final response = await _dio.get('/match-posting/search-condition',
        queryParameters: {
          'startDate': startDate=='' ? null : startDate,
          'endDate': endDate=='' ? null : endDate,
          'money': money=='' ? null : money,
          'query': value=='' ? null : value,
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> travelListJson = response.data;
      List<MatchResponseDetail> travelList = travelListJson.map((item) => MatchResponseDetail.fromJson(item)).toList();
      state = travelList;
      print('조건 검색 성공');
    }
    else {
      print("실패해버린..");
    }
  }
}

//여기 있는 프로바이더로 나중에 api를 불러오고 상태를 감시 가능합니다.
final travelListProvider = StateNotifierProvider<travelListController, List<MatchResponseDetail>>((ref) {
  return travelListController();
});


class progressListController extends StateNotifier<List<MatchResponseDetail>>{
  progressListController() : super([]);

  Future<void> ProgressAPI() async {
    Dio _dio = DioServices().to();

    final response = await _dio.get('/match-posting/progress-match',
    );
    if (response.statusCode == 200) {
      print("성공해버린3..");

      final List<dynamic> travelListJson = response.data;
      List<MatchResponseDetail> travelList = travelListJson.map((item) => MatchResponseDetail.fromJson(item)).toList();
      state = travelList;
      print("state");
    }
    else {
      print("실패해버린3..");
    }
  }

}

final progressListProvider = StateNotifierProvider<progressListController, List<MatchResponseDetail>>((ref) {
  return progressListController();
});

Future<void> joinAPI(int id, BuildContext context) async {
  Dio _dio = DioServices().to();

  final response = await _dio.post('/match-posting/join/$id',
  );
  if (response.statusCode == 200) {

  }
  else {
  }
}
