import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/Controller/matchingProvider/matchingProviders.dart';

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
              decoration: InputDecoration(labelText: 'Start date'),
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
              decoration: InputDecoration(labelText: 'End Date'),
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
              decoration: InputDecoration(labelText: 'Search Keyword'),
            ),
            SizedBox(height: 16.0),
            Text('Expenses: ${minAmount.toStringAsFixed(0)}Won - ${maxAmount.toStringAsFixed(0)}Won'),
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
                ref.read(travelListProvider.notifier).ConditionAPI(
                  startDateController.text,
                  endDateController.text,
                  maxAmount.toInt(),
                  keywordController.text,
                  context,
                );
                context.pop();

              },
              child: Text('검색'),
            ),
          ],
        ),
      ),
    );
  }
}
