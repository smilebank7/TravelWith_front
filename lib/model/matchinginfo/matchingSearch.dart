import 'dart:convert';

import 'MatchingInfo.dart';

class MatchingSearch {
  DateTime? startDate;
  DateTime? endDate;
  String? query;
  int? money;

  MatchingSearch({
    this.startDate,
    this.endDate,
    this.query,
    this.money,
  });


  factory MatchingSearch.fromUri(Uri uri) {
    final Map<String, dynamic> queryParameters = uri.queryParameters;
    return MatchingSearch(
      startDate: queryParameters['startDate'] != null
          ? DateTime.parse(queryParameters['startDate']!)
          : null,
      endDate: queryParameters['endDate'] != null
          ? DateTime.parse(queryParameters['endDate']!)
          : null,
      query: queryParameters['query'],
      money: queryParameters['money'] != null
          ? int.tryParse(queryParameters['money']!)
          : null,
    );
  }

  String toQueryString() {
    final Map<String, dynamic> params = {};

    if (startDate != null) {
      // DateTime을 'yyyy-MM-dd' 형식의 문자열로 변환
      final startDateString =
          "${startDate!.year}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}";

      params['startDate'] = startDateString;
    }

    if (endDate != null) {
      // DateTime을 'yyyy-MM-dd' 형식의 문자열로 변환
      final endDateString =
          "${endDate!.year}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}";

      params['endDate'] = endDateString;
    }

    if (query != null) {

// 문자열을 UTF-8로 인코딩
      params['query'] = query!;
    }

    if (money != null) {
      params['money'] = money.toString();
    }

    // Map을 URL 쿼리 문자열로 변환
    final queryString = Uri(queryParameters: params).query;

    return queryString;
  }

  @override
  String toString() {
    return 'MatchingSearch{startDate: $startDate, endDate: $endDate, query: $query, money: $money}';
  }
}