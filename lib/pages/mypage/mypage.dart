import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tripmating/Controller/AuthController/LoginController.dart';
import 'package:tripmating/model/matchinginfo/Assessment.dart';

import '../../Controller/myPageProvider/myPageProvider.dart';
import '/Controller/messageProvider/messageProviders.dart';
import '/model/messages/MessagePreview.dart';
import '/model/messages/Message.dart';

import '/model/messages/MessageWrite.dart';
import "package:tripmating/service/LoginService.dart";

class Mypage extends ConsumerStatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  ConsumerState<Mypage> createState() => _MypageState();
}

class _MypageState extends ConsumerState<Mypage> {
  @override
  void initState() {
    super.initState();
    var memberInfoDTO = ref.read(myPageProvider).memberInfoDTO;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const InfoPanel(),
          const SizedBox(height: 20),
          const AssessmentPanel(),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: const Text("Log out"))
        ],
      ),
    );
  }
}

class InfoPanel extends ConsumerStatefulWidget {
  const InfoPanel({super.key});

  @override
  _InfoPanelState createState() => _InfoPanelState();
}

class _InfoPanelState extends ConsumerState<InfoPanel> {
  String gender = "male"; // 임시값

  @override
  void initState() {
    super.initState();
    ref.read(myPageProvider.notifier).getMyPageDetail();
    print("222222222");
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = RandomAvatar(
      "000000000000",
      width: 150,
      height: 150,
    );

    Widget genderIcon = setGenderIcon(gender);

    var memberInfoDTO = ref.watch(myPageProvider).memberInfoDTO;
    print(memberInfoDTO);

    return Column(
      children: [
        Container(
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
                      Text(memberInfoDTO!.name!,
                          style: TextStyle(
                            fontSize: 27,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /* const Row(
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
                        ),*/
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 18),
                            SizedBox(width: 10),
                            Text(memberInfoDTO.phoneNumber,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.cake, size: 18),
                            const SizedBox(width: 10),
                            Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(memberInfoDTO.birthDate),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w300,
                                )),
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
        ),
      ],
    );
  }

  Widget setGenderIcon(String gender) {
    switch (gender) {
      case "MALE":
        return const Icon(Icons.male, size: 18, color: Colors.blue);
      case "FEMALE":
        return const Icon(Icons.female, size: 18, color: Colors.red);
      default:
        return const SizedBox();
    }
  }
}

class AssessmentPanel extends ConsumerStatefulWidget {
  const AssessmentPanel({super.key});

  @override
  ConsumerState<AssessmentPanel> createState() => _AssessmentPanelState();
}

class _AssessmentPanelState extends ConsumerState<AssessmentPanel> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    ref.read(myPageProvider.notifier).getMyPageDetail();
    print("222222222");
  }

  @override
  Widget build(BuildContext context) {
    var memberInfoDTO = ref.watch(myPageProvider);
    return Container(
      color: Color(0xFFF8F8F8),
      child: Column(
        children: [
          const Text("MyIntroduce",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center),
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
                itemCount: 1, // 값 필요
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            memberInfoDTO.myIntroduceTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "${memberInfoDTO.myIntroduceContents}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.pink, size: 25),
                            ],
                          ),
                          SizedBox(height: 1),
                          /* Row(
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
                          ),*/
                        ],
                      ),
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
                  activeDotColor: Colors.pink),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
