import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dio/dio.dart';
import '/service/utils/dio_service.dart';

import 'package:quickalert/quickalert.dart';

final _mainTravelSpaceController = TextEditingController();
final _titleController = TextEditingController();
final _contentController = TextEditingController();
final _expenseController = TextEditingController();


class MatchingInfo {
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();
  String title = "";
  String contents = "";
  int travelExpenses = 0;
  int numOfPeoples = 0;
  bool isAccommodationTogether = true;
  bool isDiningTogether = true;
  String mainTravelSpace = "";
}

MatchingInfo matchingInfo = MatchingInfo();

class PostingPage extends StatelessWidget {
  const PostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              children: [
                const DatePanel(),
                const TitlePanel(),
                const CheckPanel(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      PostingAPI(context, matchingInfo.startDate.toString().substring(0,10), matchingInfo.endDate.toString().substring(0,10), _titleController.text, _contentController.text, _expenseController.text, matchingInfo.numOfPeoples, matchingInfo.isAccommodationTogether, matchingInfo.isDiningTogether, _mainTravelSpaceController.text);
                      }, child: const Text("Posting")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DatePanel extends StatefulWidget {
  const DatePanel({super.key});

  @override
  State<DatePanel> createState() => _DatePanelState();
}

class _DatePanelState extends State<DatePanel> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on),
              SizedBox(
                width: 330,
                height: 40,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "Choose the main travel space",
                  ),
                  controller: _mainTravelSpaceController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2025))
                  .then((selectedDate) {setState(() {
                  matchingInfo.startDate = selectedDate;

                  //endDate가 startDate보다 빠르다면 수정해주기
                  if(matchingInfo.startDate!.isAfter(matchingInfo.endDate!)){
                    matchingInfo.endDate = selectedDate;
                  }
                  }); });
                },
                child: Text(matchingInfo.startDate.toString().substring(0,10))),
              Container(alignment: Alignment.center, width: 20, child: const Text("~"),),
              ElevatedButton(
                onPressed: (){
                  showDatePicker(context: context, initialDate: matchingInfo.startDate!, firstDate: matchingInfo.startDate!, lastDate: DateTime(2025))
                  .then((selectedDate) {setState(() {
                    matchingInfo.endDate = selectedDate;
                  }); });
                },
                child: Text(matchingInfo.endDate.toString().substring(0,10))
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
                child: Icon(Icons.person),
              ),
              SizedBox(
                  width: 40,
                  child:(
                      IconButton(onPressed: () {
                        setState(() {
                          if(matchingInfo.numOfPeoples > 0) {
                            matchingInfo.numOfPeoples--;
                          }
                        });
                      }, icon: const Icon(Icons.remove))
                  )
              ),
              Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 25,
                  color: Colors.blue.shade100,
                  child: Text(matchingInfo.numOfPeoples.toString())
              ),
              SizedBox(
                  width: 40,
                  child:IconButton(onPressed: (){
                    setState(() {
                      matchingInfo.numOfPeoples++;
                    });
                  }, icon: const Icon(Icons.add))
              ),
            ],
          )

        ],
      ),
    );
  }
}

class TitlePanel extends StatefulWidget {
  const TitlePanel({super.key});

  @override
  State<TitlePanel> createState() => _TitlePanelState();
}

class _TitlePanelState extends State<TitlePanel> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 350,
          height: 40,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter the trip title",
            ),
            controller: _titleController,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 350,
          height: 80,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter the main content of trip: ",
            ),
            controller: _contentController,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 350,
          height: 40,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter the max expense you want: ",
            ),
            controller: _expenseController,
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }
}

class ExpensePanel extends StatefulWidget {
  const ExpensePanel({super.key});

  @override
  State<ExpensePanel> createState() => _ExpensePanelState();
}

class _ExpensePanelState extends State<ExpensePanel> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CheckPanel extends StatefulWidget {
  const CheckPanel({super.key});

  @override
  State<CheckPanel> createState() => _CheckPanelState();
}

class _CheckPanelState extends State<CheckPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 28.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 300, child: Row(
                children:[
                  Icon(Icons.bed),
                  SizedBox(width: 10),
                  Text("Accommodation Together?")
                ]
              )),
              Checkbox(
                value: matchingInfo.isAccommodationTogether,
                onChanged: (value){
                  setState(() {
                    matchingInfo.isAccommodationTogether = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 300, child: Row(
                  children:[
                    Icon(Icons.brunch_dining),
                    SizedBox(width: 10),
                    Text("Dining Together?"),
                  ]
              )),
              Checkbox(
                value: matchingInfo.isDiningTogether,
                onChanged: (value){
                  setState(() {
                    matchingInfo.isDiningTogether = value!;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

void PostingAPI(BuildContext context, StartDate, String EndDate, String Title, String Contents, String TravelExpenses, int NumOfPeoples, bool IsAccommodationTogether, bool IsDiningTogether, String MainTravelSpace) async{

  Dio _dio = DioServices().to();

  final response = await _dio.post('/match-posting/write',
      data: {
        'startDate': StartDate,
        'endDate': EndDate,
        'title': Title,
        'contents': Contents,
        'travelExpenses': TravelExpenses,
        'numOfPeoples': NumOfPeoples,
        'isAccommodationTogether': IsAccommodationTogether,
        'isDiningTogether': IsDiningTogether,
         'mainTravelSpace': MainTravelSpace,
      }
  );

  if (response.statusCode == 200) {
    print("성공해버린..");
    print(response.data);

    QuickAlert.show(
      context: context,
      title: "Posting Success",
      type: QuickAlertType.success,
    );

  } else {
    print("실패해버린..");
    print(response.data);
  }
}
  //Posting API
  //Posting API
  //Posting API
  //Posting API
  //Posting
