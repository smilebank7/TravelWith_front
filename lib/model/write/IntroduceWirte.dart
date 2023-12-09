class IntroduceWrite {
  int? id;
  String name;
  String profileImg;
  String gender;
  String title;
  String contents;

  IntroduceWrite({
    this.id,
    required this.name,
    required this.profileImg,
    required this.gender,
    required this.title,
    required this.contents,
  });

  factory IntroduceWrite.fromJson(Map<String, dynamic> json) {
    return IntroduceWrite(
      id: json['id'],
      name: json['name'],
      profileImg: json['profileImg'],
      gender: json['gender'],
      title: json['title'],
      contents: json['contents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profileImg': profileImg,
      'gender': gender,
      'title': title,
      'contents': contents,
    };
  }

  @override
  String toString() {
    return 'IntroduceWrite{id: $id, name: $name, profileImg: $profileImg, gender: $gender, title: $title, contents: $contents}';
  }


}