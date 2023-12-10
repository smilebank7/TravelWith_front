import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dio/dio.dart';
import '/service/utils/dio_service.dart';

import '/model/matchinginfo/NEW/MatchResponseDetail.dart';
import '/model/messages/Message.dart';
import '/model/messages/MessagePreview.dart';
import '/model/messages/MessageWrite.dart';


import 'package:dash_chat_2/dash_chat_2.dart';


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

class messageDetailController extends StateNotifier<List<ChatMessage>> {
  messageDetailController() : super([]);

  Future<void> getMessageDetail(String messageId, ChatUser me, ChatUser you) async {
    Dio _dio = DioServices().to();
    final response = await _dio.get('/message/$messageId',);

    if (response.statusCode == 200) {
      print("성공해버린..");
      final List<dynamic> messageJson = response.data;
      List<Message> messageList =
      messageJson.map((item) => Message.fromJson(item)).toList();

      List<ChatMessage> chatMessageList = messageList.map((item) => ChatMessage(
        text: item.contents,
        user: item.senderEmail == me.id ? me : you,
        createdAt: item.sendTime,
      )).toList();
      state = chatMessageList;
    }
    else {
      print("실패해버린..");
    }
  }
}

final messageDetailProvider = StateNotifierProvider<messageDetailController, List<ChatMessage>>((ref) => messageDetailController());

void messageSend(MessageWrite data) async {
  Dio _dio = DioServices().to();
  final response = await _dio.post('/message/write', data: data.toJson());

  if (response.statusCode == 200) {
    print("성공해버린..");
  }
  else {
    print("실패해버린..");
  }
}