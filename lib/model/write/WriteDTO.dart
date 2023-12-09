class WriteDTO {
  String title;
  String contents;


  WriteDTO({
    required this.title,
    required this.contents,

  });

  // JSON 데이터를 User 객체로 변환
  factory WriteDTO.fromJson(Map<String, dynamic> json) {
    return WriteDTO(
      title: json['title'],
      contents: json['contents'],
    );
  }

  // User 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'contents': contents,
    };
  }

  @override
  String toString() {
    return 'WriteDTO{title: $title, contents: $contents}';
  }
}