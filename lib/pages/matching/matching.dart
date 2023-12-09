import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'travelList.dart';
import 'createdList.dart';
import 'joinnedList.dart';

class Matching extends ConsumerStatefulWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchingState();
}
class _MatchingState extends ConsumerState<Matching>
    with SingleTickerProviderStateMixin {

  late final Provider<TabController> recentTabStateProvider;

  @override
  void initState() {
    super.initState();
    recentTabStateProvider = Provider<TabController>((ref) {
      return TabController(length: 3, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(recentTabStateProvider);
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: Text(
          '여행 목록',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          '참여한 여행',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          '생성한 여행',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // 새로운 높이
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: controller,
            tabs: myTabs,
            //
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Color(0xff707070),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          TravelList(),
          JoinnedList(),
          JoinnedList(),
        ],
      ),
    );
  }
}



class JoinnedList extends ConsumerStatefulWidget {
  const JoinnedList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JoinnedListState();
}
class _JoinnedListState extends ConsumerState<JoinnedList> {
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
                children: [ /*
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: projectList.length,
                      itemBuilder: (content, index) {
                        ProjectCardData cardData = projectList[index];
                        return CustomCard(
                          courseName: cardData.courseName,
                          teamName: cardData.teamName,
                        );
                      },
                    ),
                  ),
*/
                ]
            ),
          ),
        ]
    );
  }
}


