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
          const AssessmentPanel(),
          ElevatedButton(onPressed: (){//옮겨야 함
            context.go("/login");
          }, child: const Text("Log out"))
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
  Icon genderIcon = const Icon(Icons.male);//임시값
  String gender = "male";//임시값
  Widget avatar = RandomAvatar("000000000000", width: 200, height: 200);

  Widget setGenderIcon(gender){
    if(gender == "Male"){
      return const Icon(Icons.male);
    }
    else if(gender == "Female"){
      return const Icon(Icons.female);
    }
    return const SizedBox();
  }

  @override
  void initState() {
    setGenderIcon(gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Center(
        child: Container(
          width: 350,
          height: 470,
          child: Column(
            children: [
              avatar,
              const SizedBox(height: 10),
              const Text("name", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
              const SizedBox(height: 10),
              const Text("4.5/5",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, size: 15),
                    SizedBox(width: 5),
                    Text("010-1234-5678",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("birthday",
                    style: TextStyle(fontSize: 20),
                  ),
                  genderIcon,
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 350,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.yellow[200],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("introduce content",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
    return Column(
      children: [
        const Text("지난 여행 멤버 평가", style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
        const SizedBox(height: 15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              shadowColor: const Color.fromRGBO(0, 0, 0, 0)
          ),
          onPressed: (){
            context.go("/mypage/assessment");
          },
          child: SizedBox(
            width: 330,
            height: 150,
            child: PageView.builder(
              controller: pageController,
              itemCount: 3, // 값 필요
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.yellow[200],
                  ),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("파티장 이름", style: TextStyle(color: Colors.black)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("여행 제목  ", style: TextStyle(color: Colors.black, fontSize: 40)),
                              Icon(Icons.arrow_circle_right, color: Colors.black,),
                            ]
                        ),
                        SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("xxxx.xx.xx ~ xxxx.xx.xx", style: TextStyle(color: Colors.black),),
                            Text("총 인원 n", style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ]
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
            count: 3, //값 필요
            effect: const SlideEffect(
                activeDotColor: Colors.yellow
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
