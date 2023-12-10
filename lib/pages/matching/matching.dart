import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search/travelList.dart';
import 'create/createdList.dart';
import 'progress/joinnedList.dart';
import 'create/postingpage.dart';



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
          'Trip List',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          'Trip Progress',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          'Create Trip',
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
          ProgressList(),
          PostingPage()
        ],
      ),
    );
  }
}



