import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:tripmating/model/matchinginfo/NEW/MatchResponseDetail.dart';

import '/Controller/matchingProvider/matchingProviders.dart';


class CreatedList extends ConsumerStatefulWidget {
  const CreatedList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatedListState();
}
class _CreatedListState extends ConsumerState<CreatedList> {
  @override
  void initState() {
    super.initState();
    ref.read(progressListProvider.notifier).ProgressAPI();
  }

  @override
  Widget build(BuildContext context) {
    final progressListState = ref.watch(progressListProvider);
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
                      itemCount: progressListState.length,
                      itemBuilder: (content, index) {
                        MatchResponseDetail travelData = progressListState[index];
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

class TravelCard extends ConsumerStatefulWidget {
  final MatchResponseDetail data;

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
                    Text('여행 제목 : ${widget.data.title!}'),
                    Text('여행 장소 : ${widget.data.mainTravelSpace!}'),
                    Text('여행 날짜 : ${widget.data.startDate!} ~ ${widget.data.endDate!}'),
                    Text('여행 참여자 : ${widget.data.participants!}'),
                    ElevatedButton(
                        onPressed: (){
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
                '${widget.data.mainTravelSpace!}',
                style: TextStyle(fontSize: 18,color: Colors.pink, fontWeight: FontWeight.w600),
              ),
              Text(
                '${widget.data.startDate!}',
                style: TextStyle(fontSize: 16),
              ),

              Text(
                '${widget.data.participants!}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
