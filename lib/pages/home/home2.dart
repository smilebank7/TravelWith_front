import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class Home2 extends ConsumerStatefulWidget {
  const Home2({super.key});

  @override
  ConsumerState createState() => _Home2State();
}

class _Home2State extends ConsumerState<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 14, 14, 0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        'Recommendation',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)
                        )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    height: 300,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: CustomCard()
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],

        )
      )
    );
  }
}


class CustomCard extends ConsumerStatefulWidget {
  const CustomCard({super.key});

  @override
  ConsumerState<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends ConsumerState<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // 둥근 모서리를 없앰
      ),
      elevation: 0, // 그림자를 없앰
      child: ListTile(
        contentPadding: EdgeInsets.all(0), // 내용의 패딩을 없앰
        visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 아이콘과 텍스트 간격을 조절

        // leading을 직접 정의
        leading: Icon(
          CupertinoIcons.circle_fill,
          color: Colors.pink,
          size: 30,
        ),

        title: Text(
          '중앙대학교 풀파티',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          '이주형 최민준',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}