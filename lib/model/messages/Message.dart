class Message {
  final String senderEmail;
  final String receiverEmail;
  final String title;
  final String contents;
  final DateTime sendTime;
  final String me; // 또는 열거형으로 변경 가능

  Message({
    required this.senderEmail,
    required this.receiverEmail,
    required this.title,
    required this.contents,
    required this.sendTime,
    required this.me,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderEmail: json['senderEmail'],
      receiverEmail: json['receiverEmail'],
      title: json['title'],
      contents: json['contents'],
      sendTime: DateTime.parse(json['sendTime']),
      me: json['me'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderEmail': senderEmail,
      'receiverEmail': receiverEmail,
      'title': title,
      'contents': contents,
      'sendTime': sendTime.toIso8601String(),
      'me': me,
    };
  }

  @override
  String toString() {
    return 'Message{senderEmail: $senderEmail, receiverEmail: $receiverEmail, title: $title, contents: $contents, sendTime: $sendTime, me: $me}';
  }
}