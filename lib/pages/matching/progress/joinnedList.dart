import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:tripmating/model/matchinginfo/NEW/MatchResponseDetail.dart';
import 'showTravel.dart';

import '/Controller/matchingProvider/matchingProviders.dart';


class ProgressList extends ConsumerStatefulWidget {
  const ProgressList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressListState();
}
class _ProgressListState extends ConsumerState<ProgressList> {
  @override
  void initState() {
    super.initState();
    ref.read(progressListProvider.notifier).ProgressAPI();
  }

  @override
  Widget build(BuildContext context) {
    final progressListState = ref.watch(progressListProvider);
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 14, 14, 0),
        alignment: Alignment.centerLeft,
        child: Column(
            children: [
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
              return ShowTravel(data: widget.data,);
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
