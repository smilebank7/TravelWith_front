import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripmating/pages/mypage/memberassessment.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children:  [
          const InfoPanel(),
          const SizedBox(height: 20),
          const AssessmentPanel(),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.go("/login");
              },
              child: const Text("Log out")
          )
        ],
      ),
    );
  }
}

class InfoPanel extends StatefulWidget {
  const InfoPanel({super.key});

  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  String gender = "male"; // 임시값

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = RandomAvatar(
      "000000000000",
      width: 150,
      height: 150,
    );

    Widget genderIcon = setGenderIcon(gender);



    return Container(
      color: Color(0xFFF8F8F8),
      child: Center(
        child: Container(
          width: 385,
          margin: const EdgeInsets.only(top: 15.0, bottom: 20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  avatar,
                  const SizedBox(height: 10),
                  const Text("name", style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  )
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, size: 18),
                        SizedBox(width: 10),
                        Text("4.5/5", style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w300,
                        )
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.phone, size: 18),
                        SizedBox(width: 10),
                        Text("010-1234-5678", style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w300,
                        )
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.cake, size: 18),
                        const SizedBox(width: 10),
                        const Text("birthday", style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w300,
                        )
                        ),
                        const SizedBox(width: 15),
                        genderIcon,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setGenderIcon(String gender) {
    switch (gender) {
      case "male":
        return const Icon(Icons.male, size: 18, color: Colors.blue);
      case "female":
        return const Icon(Icons.female, size: 18, color: Colors.red);
      default:
        return const SizedBox();
    }
  }
}

class AssessmentPanel extends StatefulWidget {
  const AssessmentPanel({super.key});

  @override
  State<AssessmentPanel> createState() => _AssessmentPanelState();
}

class _AssessmentPanelState extends State<AssessmentPanel> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF8F8F8),
      child: Column(
        children: [
          const Text("지난 여행 멤버 평가", style: TextStyle(
            fontSize: 30,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w300,

          ), textAlign: TextAlign.center),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              context.go("/mypage/assessment");
            },
            child: Container(
              width: 330,
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: PageView.builder(
                controller: pageController,
                itemCount: 3, // 값 필요
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("파티장 이름", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        ),
                        SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("여행 제목  ", style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                fontSize: 24
                            ),
                            ),
                            Icon(Icons.arrow_circle_right, color: Colors.pink, size: 25),
                          ],
                        ),
                        SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("xxxx.xx.xx ~ xxxx.xx.xx", style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                            Text("총 인원 n", style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3, // 값 필요
              effect: const SlideEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.pink
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

