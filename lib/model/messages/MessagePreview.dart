import '../matchinginfo/NEW/MemberInfo.dart';

class MessagePreview {
  final MemberInfoDTO memberInfoDTO;
  final String contents;
  final String title;
  final DateTime recentDate;

  MessagePreview({
    required this.memberInfoDTO,
    required this.contents,
    required this.title,
    required this.recentDate,
  });

  factory MessagePreview.fromJson(Map<String, dynamic> json) {
    return MessagePreview(
      memberInfoDTO: MemberInfoDTO.fromJson(json['memberInfoDTO']),
      contents: json['contents'],
      title: json['title'],
      recentDate: DateTime.parse(json['rencentDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberInfoDTO': memberInfoDTO.toJson(),
      'contents': contents,
      'title': title,
      'rencentDate': recentDate.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'MessagePreview{memberInfoDTO: $memberInfoDTO, contents: $contents, title: $title, recentDate: $recentDate}';
  }
}