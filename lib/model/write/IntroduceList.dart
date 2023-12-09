import 'package:tripmating/model/write/IntroduceWirte.dart';

class IntroduceList {
  List<IntroduceWrite> introduceList;

  IntroduceList({required this.introduceList});

  factory IntroduceList.fromJson(Map<String, dynamic> json) {
    var list = json['introduce_list'] as List;
    List<IntroduceWrite> introduceItemList = list.map((i) => IntroduceWrite.fromJson(i)).toList();
    return IntroduceList(introduceList: introduceItemList);
  }

  @override
  String toString() {
    return 'IntroduceList{introduceList: $introduceList}';
  }
}