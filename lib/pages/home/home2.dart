import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:go_router/go_router.dart';
import 'package:tripmating/pages/naverMap/naver-api.dart';
import '/Controller/matchingProvider/matchingProviders.dart';

class Home2 extends ConsumerStatefulWidget {
  const Home2({super.key});

  @override
  ConsumerState createState() => _Home2State();
}

class _Home2State extends ConsumerState<Home2> {
  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      // 필요한 이미지 경로들을 추가합니다.
    ];

    return DraggableHome(
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('TravelWith',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      headerWidget: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          'TravelWith',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 50,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      headerBottomBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: TextField(
            onTap: () {
              context.go('/matching');
            },
            decoration: InputDecoration(
              hintText: '검색',
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none, // 테두리 선 없음
              ),
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      headerExpandedHeight: 0.25,
      backgroundColor: Color(0xffffffff),
      appBarColor: Colors.white,
      body: [
        Container(
            height: 130,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Find a companion",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "to make memories together!",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        Container(
          height: 250,
          width: double.infinity,
          child: Swiper(
            itemCount: imagePaths.length,
            autoplay: true,
            autoplayDelay: 5000,
            //5초
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // 테두리 라운드 처리
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 그림자 색상
                      spreadRadius: 2, // 그림자 확산 범위
                      blurRadius: 5, // 그림자 흐림 정도
                      offset: Offset(0, 3), // 그림자 위치 (x, y)
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    imagePaths[index], // 이미지 경로
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemWidth: 400,
            itemHeight: 200,
            layout: SwiperLayout.TINDER,
          ),
        ),
        SizedBox(height: 50),
        Text(
          "Explore your desired destinations!",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 30,),
        Center(
          child: GestureDetector(
            onTap: () {
              // 여기에 이미지를 탭할 때 실행할 함수를 넣으세요.
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NaverMapApiPage()));
            },
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [

                      Color(0xFF98f078),
                      Color(0xFF86ed61), // top color of the gradient
                      Color(0xFF98f078), // middle color of the gradient
                      Color(0xFFb2f09c), // additional color of the gradient
                      Color(0xFFd0f2c4), // bottom color of the gradient
                    ],
                  )
              ),
              width: 200,
              height: 100,
              child: Image.asset(
                  'assets/map.png',
                  width:200,
                  height:100
              ),
            ), // 'your_image.png'를 이미지 경로로 변경하세요.
          ),
        ),
        SizedBox(
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // 테두리 라운드 처리
              border: Border.all(
                color: Colors.pink, // 테두리 색상
                width: 2, // 테두리 두께
              ),


            ),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomCard();
              },
            ),
          ),
        )
      ],
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
        contentPadding: EdgeInsets.all(0),
        // 내용의 패딩을 없앰
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        // 아이콘과 텍스트 간격을 조절

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
