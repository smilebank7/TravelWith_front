import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tripmating/model/MyPage/MyPageDTO.dart';

import '../../service/utils/dio_service.dart';

import 'package:dio/dio.dart';

class myPageController extends StateNotifier<MyPageDTO> {
  myPageController() : super(MyPageDTO.empty());

  Future<void> getMyPageDetail() async {
    Dio _dio = DioServices().to();
    final response = await _dio.get(
      '/members/my-page',
    );

    if (response.statusCode == 200) {
      print("성공해버린..");
      print(response.data);
      Map<String, dynamic> data = response.data;
      MyPageDTO myPageDTO = MyPageDTO.fromJson(data);

      state = myPageDTO;
      print(myPageDTO);
      print("----------------");
    } else {
      print("실패해버린..");
    }
  }
}

final myPageProvider = StateNotifierProvider<myPageController, MyPageDTO>(
    (ref) => myPageController());
