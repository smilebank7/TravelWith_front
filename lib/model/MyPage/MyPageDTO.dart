import '../matchinginfo/NEW/MemberInfo.dart';

class MyPageDTO {
  final MemberInfoDTO memberInfoDTO;
  final String myIntroduceTitle;
  final String myIntroduceContents;

  MyPageDTO({
    required this.memberInfoDTO,
    required this.myIntroduceTitle,
    required this.myIntroduceContents,
  });

  factory MyPageDTO.fromJson(Map<String, dynamic> json) {
    return MyPageDTO(
      memberInfoDTO: MemberInfoDTO.fromJson(json['memberInfoDTO']),
      myIntroduceTitle: json['myIntroduceTitle'],
      myIntroduceContents: json['myIntroduceContents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberInfoDTO': memberInfoDTO.toJson(),
      'myIntroduceTitle': myIntroduceTitle,
      'myIntroduceContents': myIntroduceContents,
    };
  }

  factory MyPageDTO.empty() {
    return MyPageDTO(
      memberInfoDTO: MemberInfoDTO.empty(), // Assuming MemberInfoDTO also has an empty constructor
      myIntroduceTitle: '',
      myIntroduceContents: '',
    );
  }
  @override
  String toString() {
    return 'MyPageDTO{memberInfoDTO: $memberInfoDTO, myIntroduceTitle: $myIntroduceTitle, myIntroduceContents: $myIntroduceContents}';
  }
}
