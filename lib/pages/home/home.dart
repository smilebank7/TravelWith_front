import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripmating/pages/home/matchingresponse.dart';
import 'package:tripmating/pages/mypage/memberassessment.dart';
import 'memberreview.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    //make a test button name "login page test" and text Home
    return SafeArea(
      child: ListView(
        //item spacing 해주기
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                MyPageView(mode: PageViewMode.applied),
                const SizedBox(height: 20),
                MyPageView(mode: PageViewMode.response),
                const SizedBox(height: 20),
                MyPageView(mode: PageViewMode.review),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {
// context.go('/login');
// },
// child: const Text('login page test'),

enum PageViewMode {applied, response, review}

class MyPageView extends StatefulWidget {
  PageViewMode mode;
  MyPageView({required this.mode, super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState(mode: mode);
}

class _MyPageViewState extends State<MyPageView> {
  final mode;
  _MyPageViewState({required this.mode});

  Widget getPageName(){
    if(mode == PageViewMode.applied){
      return const Text("Applied Matching", style: TextStyle(fontSize: 30));
    }
    else if(mode == PageViewMode.response){
      return const Text("Matching Response", style: TextStyle(fontSize: 30));
    }
    else if(mode == PageViewMode.review){
      return const Text("Member Review", style: TextStyle(fontSize: 30));
    }
    return const SizedBox(height: 0);
  }

  Widget getDialog(){
    if(mode == PageViewMode.applied){
      return SizedBox(width: 0);
    }
    else if(mode == PageViewMode.response){
      return const MatchingResponse();
    }
    else if(mode == PageViewMode.review){
      return const MemberAssessment();
    }
    return const SizedBox(width: 0);
  }

  Widget getPageView(){
    if(mode == PageViewMode.applied){
      return const AppliedMatchingPageView();
    }
    else if(mode == PageViewMode.response){
      return const PostingMatchingPageView();
    }
    else if(mode == PageViewMode.review){
      return const MemberReviewPageView();
    }
    return const SizedBox(height: 0);
  }

  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getPageName(),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            shadowColor: const Color.fromRGBO(0, 0, 0, 0)
          ),
          onPressed: (){
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context){
                return AlertDialog(
                  content: getDialog()
                );
              }
            );
          },
          child: SizedBox(
            width: 350,
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3, // 값 필요
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink[300],
                  ),
                  child: getPageView(),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3, //값 필요
          effect: const SlideEffect(
            activeDotColor: Colors.pink
          ),
        )
      ],
    );
  }
}


class AppliedMatchingPageView extends StatefulWidget {
  const AppliedMatchingPageView({super.key});

  @override
  State<AppliedMatchingPageView> createState() => _AppliedMatchingPageViewState();
}

class _AppliedMatchingPageViewState extends State<AppliedMatchingPageView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("파티장 이름"),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("여행 제목  ", style: TextStyle(fontSize: 40)),
                Icon(Icons.arrow_circle_right),
              ]
          ),
          SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("남은 시간"),
              Text("현재 인원 n/n"),
              Text("승인 여부"),
            ],
          ),
        ]
    );
  }
}

class PostingMatchingPageView extends StatefulWidget {
  const PostingMatchingPageView({super.key});

  @override
  State<PostingMatchingPageView> createState() => _PostingMatchingPageViewState();
}

class _PostingMatchingPageViewState extends State<PostingMatchingPageView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("여행 제목  ", style: TextStyle(fontSize: 40)),
                Icon(Icons.arrow_circle_right),
              ]
          ),
          SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("남은 시간"),
              Text("현재 인원 n/n"),
              Text("요청 수"),
            ],
          ),
        ]
    );
  }
}

class MemberReviewPageView extends StatefulWidget {
  const MemberReviewPageView({super.key});

  @override
  State<MemberReviewPageView> createState() => _MemberReviewPageViewState();
}

class _MemberReviewPageViewState extends State<MemberReviewPageView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("여행 이름"),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("멤버 이름  ", style: TextStyle(fontSize: 40)),
                Icon(Icons.arrow_circle_right),
              ]
          ),
          Text("평점: 4.5/5.0"),
        ]
    );
  }
}
