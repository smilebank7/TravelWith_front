class MessageWrite {
  final String receiverEmail;
  final String title;
  final String contents;

  MessageWrite({
    required this.receiverEmail,
    required this.title,
    required this.contents,
  });

  factory MessageWrite.fromJson(Map<String, dynamic> json) {
    return MessageWrite(
      receiverEmail: json['receiverEmail'],
      title: json['title'],
      contents: json['contents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiverEmail': receiverEmail,
      'title': title,
      'contents': contents,
    };
  }
  @override
  String toString() {
    return 'MessageWrite{receiverEmail: $receiverEmail, title: $title, contents: $contents}';
  }
}