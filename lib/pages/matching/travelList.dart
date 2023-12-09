import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';




class TravelList extends ConsumerStatefulWidget {
  const TravelList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TravelListState();
}
class _TravelListState extends ConsumerState<TravelList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 14, 14, 0),
            alignment: Alignment.centerLeft,
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: TextField(
                      focusNode: FocusNode(),
                      onChanged: (text) {
                      },
                      decoration: InputDecoration(
                        hintText: '검색',
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none, // 테두리 선 없음
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: Icon(Icons.add_box, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: travelDataList.length,
                      itemBuilder: (content, index) {
                        TravelData travelData = travelDataList[index];
                        return TravelCard(
                          data: travelData,
                        );
                      },
                    ),
                  ),
                ]
            ),
          ),
        ]
    );
  }
}

class TravelData {
  String title;
  String date;
  String place;
  String user;

  TravelData({
    required this.title,
    required this.date,
    required this.place,
    required this.user,
  });
}

final List<TravelData> travelDataList = [
  TravelData(
    title: 'Trip to Paris',
    date: '2023-05-15',
    place: 'Paris, France',
    user: '홍길동',
  ),
  TravelData(
    title: 'Beach Vacation',
    date: '2023-07-20',
    place: 'Maldives',
    user: '윤석열',
  ),
  TravelData(
    title: '중앙대 청룡탕 가실 분',
    date: '2023-07-20',
    place: '중앙대학교',
    user: '이재명',
  ),
  // Add more TravelData objects here
];

class TravelCard extends ConsumerStatefulWidget {
  final TravelData data;

  TravelCard({required this.data});

  @override
  ConsumerState<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends ConsumerState<TravelCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Container(
                height: 300,
                child: Column(
                  children: [
                    Text('여행 제목 : ${widget.data.title}'),
                    Text('여행 장소 : ${widget.data.place}'),
                    Text('여행 날짜 : ${widget.data.date}'),
                    Text('여행 참여자 : ${widget.data.user}'),
                    ElevatedButton(
                      onPressed: (){
                        context.go('/matching');
                      },
                      child: Text('매칭하기')
                    )
                  ],
                ),
              );
            });
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${widget.data.place}',
                style: TextStyle(fontSize: 18,color: Colors.pink, fontWeight: FontWeight.w600),
              ),
              Text(
                '${widget.data.date}',
                style: TextStyle(fontSize: 16),
              ),
      
              Text(
                '${widget.data.user}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
