class Assessment {
  int memberId;
  int assessedMemberId;
  int matchId;
  int points;

  Assessment({
    required this.memberId,
    required this.assessedMemberId,
    required this.matchId,
    required this.points
  });

  // JSON 데이터를 MatchingInfo 객체로 변환
  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      memberId: json['memberId'],
      assessedMemberId: json['assessedMemberId'],
      matchId: json['matchId'],
      points: json['points'],
    );
  }

  // MatchingInfo 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'memberId': memberId.toString(),
      'assessedMemberId': assessedMemberId.toString(),
      'matchId': matchId.toString(),
      'points': points.toString()
    };
  }

  @override
  String toString() {
    return 'Assessment{memberId: $memberId, assessedMemberId: $assessedMemberId, matchId: $matchId, points: $points}';
  }
}