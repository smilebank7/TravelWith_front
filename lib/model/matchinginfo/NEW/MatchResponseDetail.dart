import 'MemberInfo.dart'; // Assuming MemberInfoDTO is in a separate file

class MatchResponseDetail {
  final MemberInfoDTO host;
  final List<MemberInfoDTO> participants;
  final int matchId;
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String contents;
  final int travelExpenses;
  final int numOfPeoples;
  final bool isAccommodationTogether;
  final bool isDiningTogether;
  final String mainTravelSpace;

  MatchResponseDetail({
    required this.host,
    required this.participants,
    required this.matchId,
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

  factory MatchResponseDetail.fromJson(Map<String, dynamic> json) {
    return MatchResponseDetail(
      host: MemberInfoDTO.fromJson(json['host']),
      participants: List<MemberInfoDTO>.from(
          json['participants'].map((x) => MemberInfoDTO.fromJson(x))
      ),
      matchId: json['matchId'],
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

  // Add a toJson method if you need to convert MatchResponseDetail instances back to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'host': host.toJson(),
      'participants': participants.map((x) => x.toJson()).toList(),
      'matchId': matchId,
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
    return 'MatchResponseDetail(host: $host, participants: $participants, matchId: $matchId, startDate: $startDate, endDate: $endDate, title: $title, contents: $contents, travelExpenses: $travelExpenses, numOfPeoples: $numOfPeoples, isAccommodationTogether: $isAccommodationTogether, isDiningTogether: $isDiningTogether, mainTravelSpace: $mainTravelSpace)';
  }
}
