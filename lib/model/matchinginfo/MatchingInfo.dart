class MatchingWrite {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String title = "";
  String contents = "";
  int travelExpenses = 0;
  int numOfPeoples = 0;
  bool isAccommodationTogether = true;
  bool isDiningTogether = true;
  String mainTravelSpace = "";


  MatchingWrite({
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.contents,
    required this.travelExpenses,
    required this.numOfPeoples,
    required this.isAccommodationTogether,
    required this.isDiningTogether,
    required this.mainTravelSpace,
  });

  // JSON 데이터를 MatchingInfo 객체로 변환
  factory MatchingWrite.fromJson(Map<String, dynamic> json) {
    return MatchingWrite(
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      title: json['title'],
      contents: json['contents'],
      travelExpenses: json['travelExpenses'],
      numOfPeoples: json['numOfPeoples'],
      isAccommodationTogether: json['isAccommodationTogether'],
      isDiningTogether: json['isDiningTogether'],
      mainTravelSpace: json['mainTravelSpace'],
    );
  }

  // MatchingInfo 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'title': title,
      'contents': contents,
      'travelExpenses': travelExpenses,
      'numOfPeoples': numOfPeoples,
      'isAccommodationTogether': isAccommodationTogether,
      'isDiningTogether': isDiningTogether,
      'mainTravelSpace': mainTravelSpace,
    };
  }

  @override
  String toString() {
    return 'MatchingWrite{startDate: $startDate, endDate: $endDate, title: $title, contents: $contents, travelExpenses: $travelExpenses, numOfPeoples: $numOfPeoples, isAccommodationTogether: $isAccommodationTogether, isDiningTogether: $isDiningTogether, mainTravelSpace: $mainTravelSpace}';
  }
}
