import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dio/dio.dart';
import '/service/utils/dio_service.dart';

import '/model/matchinginfo/NEW/MatchResponseDetail.dart';
import '/model/messages/Message.dart';
import '/model/messages/MessagePreview.dart';

class messageController extends StateNotifier<List<MessagePreview>> {
  messageController() : super([]);

  Future<void> getMessageList() async {
    Dio _dio = DioServices().to();
    final response = await _dio.get('/message/list',);

    if (response.statusCode == 200) {
      print("성공해버린..");
      final List<dynamic> messageJson = response.data;
      List<MessagePreview> messageList =
          messageJson.map((item) => MessagePreview.fromJson(item)).toList();
      state = messageList;
    }
    else {
      print("실패해버린..");
    }
  }
}

final messageProvider = StateNotifierProvider<messageController, List<MessagePreview>>((ref) => messageController());

class messageDetailController extends StateNotifier<List<Message>> {
  messageDetailController() : super([]);

  Future<void> getMessageDetail(String messageId) async {
    Dio _dio = DioServices().to();
    final response = await _dio.get('/message/$messageId',);

    if (response.statusCode == 200) {
      print("성공해버린..");
      final List<dynamic> messageJson = response.data;
      List<Message> messageList =
      messageJson.map((item) => Message.fromJson(item)).toList();
      state = messageList;
    }
    else {
      print("실패해버린..");
    }
  }
}

final messageDetailProvider = StateNotifierProvider<messageDetailController, List<Message>>((ref) => messageDetailController());