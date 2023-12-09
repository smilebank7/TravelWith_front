import 'package:flutter/material.dart';

class MemberReview extends StatefulWidget {
  const MemberReview({super.key});

  @override
  State<MemberReview> createState() => _MemberReviewState();
}

class _MemberReviewState extends State<MemberReview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 500,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index){
          return MemberList(name: index.toString());
        }
      ),
    );
  }
}

class MemberList extends StatefulWidget {
  const MemberList({required name, super.key});

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  List<Icon> starIcons = [
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
    const Icon(Icons.star),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("여행 이름"),
                  Text(' - '),
                  Text("멤버 이름"),
                ],
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: starIcons[0],
                    iconSize: 15,
                    onPressed: (){
                      setState(() {
                        starIcons[0] = const Icon(Icons.star);
                        for(int i=1;i<5;i++){
                          starIcons[i] = const Icon(Icons.star_border_outlined);
                        }
                      });

                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: starIcons[1],
                    iconSize: 15,
                    onPressed: (){
                      setState(() {
                        for(int i=0;i<2;i++){
                          starIcons[i] = const Icon(Icons.star);
                        }
                        for(int i=2;i<5;i++){
                          starIcons[i] = const Icon(Icons.star_border_outlined);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: starIcons[2],
                    iconSize: 15,
                    onPressed: (){
                      setState(() {
                        for(int i=0;i<3;i++){
                          starIcons[i] = const Icon(Icons.star);
                        }
                        for(int i=3;i<5;i++){
                          starIcons[i] = const Icon(Icons.star_border_outlined);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: starIcons[3],
                    iconSize: 15,
                    onPressed: (){
                      setState(() {
                        for(int i=0;i<4;i++){
                          starIcons[i] = const Icon(Icons.star);
                        }
                        starIcons[4] = const Icon(Icons.star_border_outlined);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: starIcons[4],
                    iconSize: 15,
                    onPressed: (){
                      setState(() {
                        for(int i=0;i<5;i++){
                          starIcons[i] = const Icon(Icons.star);
                        }
                      });
                    },
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Container(
                color: Colors.pink[300],
                width: 180,
                height: 35,
                child: IconButton(
                  icon: const Icon(Icons.check),
                  iconSize: 20,
                  onPressed: (){
                    print("전송");
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}

