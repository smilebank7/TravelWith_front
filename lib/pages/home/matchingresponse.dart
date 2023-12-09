import 'package:flutter/material.dart';

class MatchingResponse extends StatefulWidget {
  const MatchingResponse({super.key});

  @override
  State<MatchingResponse> createState() => _MatchingResponseState();
}

class _MatchingResponseState extends State<MatchingResponse> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Column(
        children: [
          const Text("여행 제목",
            style: TextStyle(
              fontSize: 30
            )
          ),
          const SizedBox(height: 10),
          const Text("신청 인원: "),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: 5, //값 필요
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 270,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                            width: 50,
                            height: 100,
                            child: Text("사진")),
                        const Text("이름"),
                        const Text("평점"),
                        ElevatedButton(onPressed: (){}, child: const Text("상세 보기")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: (){}, child: const Icon(Icons.check)),
                            ElevatedButton(onPressed: (){}, child: const Icon(Icons.close))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}