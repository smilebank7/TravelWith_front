import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 500,
              color: Colors.blue.shade50,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DatePanel(),
                  const TitlePanel(),
                  const CheckPanel(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        //post
                        context.go("/matching");
                      }, child: const Text("Posting")),
                      ElevatedButton(onPressed: (){
                        context.go("/matching");
                      }, child: const Text("Cancel"))
                    ],
                  )
                ],
              ),
            )
          ],
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
  final _mainTravelSpaceController = TextEditingController();

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
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _expenseController = TextEditingController();

  @override
  void dispose(){
    _titleController.dispose();
    _contentController.dispose();
    _expenseController.dispose();
    super.dispose();
  }

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
                  Text("do you want accommodation together?")
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
                    Text("do you want dining together?"),
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



