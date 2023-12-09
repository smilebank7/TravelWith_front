import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/service/utils/dio_service.dart';
import 'package:dio/dio.dart';

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



class travelListController extends StateNotifier<List<travelDataDTO>>{
  travelListController() : super([]);

  Future<void> getMainAPI() async {
    Dio _dio = DioServices().to();



    final response = await _dio.get('/match-posting/',

    );


    if (response.statusCode == 200) {
      print("성공해버린..");

      final List<dynamic> travelListJson = response.data;
      List<travelDataDTO> travelList = travelListJson.map((item) => travelDataDTO.fromTravelData(item)).toList();
      state = travelList;
      
    }
    else {
    }
  }
}

final travelListProvider = StateNotifierProvider<travelListController, List<travelDataDTO>>((ref) {
  return travelListController();
});