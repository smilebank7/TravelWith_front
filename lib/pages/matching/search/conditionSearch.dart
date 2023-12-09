import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConditionSearch extends ConsumerStatefulWidget {
  const ConditionSearch({super.key});

  @override
  ConsumerState createState() => _ConditionSearchState();
}

class _ConditionSearchState extends ConsumerState<ConditionSearch> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController keywordController = TextEditingController();
  double minAmount = 0.0;
  double maxAmount = 1000000.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: startDateController,
              decoration: InputDecoration(labelText: '시작 날짜'),
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  startDateController.text =
                  selectedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: endDateController,
              decoration: InputDecoration(labelText: '종료 날짜'),
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  endDateController.text =
                  selectedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: keywordController,
              decoration: InputDecoration(labelText: '검색어'),
            ),
            SizedBox(height: 16.0),
            Text('금액 범위: ${minAmount.toStringAsFixed(0)}원 - ${maxAmount.toStringAsFixed(0)}원'),
            RangeSlider(
              values: RangeValues(minAmount, maxAmount),
              onChanged: (RangeValues values) {
                setState(() {
                  minAmount = values.start;
                  maxAmount = values.end;
                });
              },
              min: 0,
              max: 1000000,
              divisions: 100,
              labels: RangeLabels(
                minAmount.toStringAsFixed(2),
                maxAmount.toStringAsFixed(2),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 검색 버튼을 눌렀을 때 검색 로직을 추가하세요.
                // startDateController.text에 시작 날짜, endDateController.text에 종료 날짜,
                // keywordController.text에 검색어, minAmount와 maxAmount에 금액 범위가 저장되어 있습니다.
              },
              child: Text('검색'),
            ),
          ],
        ),
      ),
    );
  }
}
