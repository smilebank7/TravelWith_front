import "package:flutter/material.dart";
import "package:random_avatar/random_avatar.dart";
import "package:tripmating/pages/mypage/mypage.dart";

class MemberAssessment extends StatefulWidget {
  const MemberAssessment({super.key});

  @override
  State<MemberAssessment> createState() => _MemberAssessmentState();
}

class _MemberAssessmentState extends State<MemberAssessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(preferredSize: const Size.fromHeight(50),
          child: AppBar(
            title: const Text("Member Assessment"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 30, right: 30),
          child: ListView.builder(
            itemCount: 3,// 값 필요 여행 멤버 수
            itemBuilder: (context, index){
              return const AssessmentCard();
            },
          ),
        )
    );
  }
}

class AssessmentCard extends StatefulWidget {
  const AssessmentCard({super.key});

  @override
  State<AssessmentCard> createState() => _AssessmentCardState();
}

class _AssessmentCardState extends State<AssessmentCard> {
  Widget avatar = RandomAvatar("000000000000", width: 50, height: 50);//임시값

  List<Icon> starIcons = [
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
  ];

  changeStar(int score){
    setState(() {
      for(int i = 0; i < score; i++){
        starIcons[i] = const Icon(Icons.star);
      }
      for(int i = score; i < 5; i++){
        starIcons[i] = const Icon(Icons.star_border_outlined);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.pink[50],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                      shadowColor: const Color.fromRGBO(0, 0, 0, 0),
                  ),
                  onPressed: (){
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context){
                          return const AlertDialog(
                              content: InfoPanel()
                          );
                        }
                    );
                  }, child: avatar
              ),
              const Text("이름"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(onPressed: () { changeStar(1); }, icon: starIcons[0])
                  ),
                  SizedBox(
                      width: 40,
                      child: IconButton(onPressed: () { changeStar(2); }, icon: starIcons[1])
                  ),
                  SizedBox(
                      width: 40,
                      child: IconButton(onPressed: () { changeStar(3); }, icon: starIcons[2])
                  ),
                  SizedBox(
                      width: 40,
                      child: IconButton(onPressed: () { changeStar(4); }, icon: starIcons[3])
                  ),
                  SizedBox(
                      width: 40,
                      child: IconButton(onPressed: () { changeStar(5); }, icon: starIcons[4])
                  )
                ],
              ),
              SizedBox(
                  width: 270,
                  child: ElevatedButton(onPressed: (){}, child: const Icon(Icons.check))
              )
            ],
          ),
        ),
      ),
    );
  }
}

