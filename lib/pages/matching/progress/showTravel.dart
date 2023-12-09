import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import  'package:intl/intl.dart';

import '/model/matchinginfo/NEW/MatchResponseDetail.dart';
import '/model/matchinginfo/NEW/MemberInfo.dart';
import '/Controller/matchingProvider/matchingProviders.dart';

import 'package:quickalert/quickalert.dart';


class ShowTravel extends ConsumerStatefulWidget{
  final MatchResponseDetail data;

  ShowTravel({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowTravelState();
}

class _ShowTravelState extends ConsumerState<ShowTravel>{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //border radius only top

        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),


      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // 둥근 모서리를 없앰
                          ),
                          elevation: 0, // 그림자를 없앰
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0), // 내용의 패딩을 없앰
                            visualDensity: VisualDensity(horizontal: 0, vertical: -4), // 아이콘과 텍스트 간격을 조절

                            // leading을 직접 정의
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.data.participants.length.toString(),
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' / ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.data.numOfPeoples.toString(),
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 30)
                              ],
                            ),
                            title: Container(
                              width: 100,
                              height: 40,
                              child: Text(
                                widget.data.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            subtitle: //add two text widget
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: Text(
                                    widget.data.host.name,
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  " 호스트",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                  children: [
                                    Text(
                                      '여행지 ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.data.mainTravelSpace,
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                  children: [
                                    Text(
                                      '예상 비용 ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.data.travelExpenses.toString(),
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                              ),
                              Row(
                                children: [
                                  Text(
                                    '공동 숙박 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    widget.data.isAccommodationTogether == true ? Icons.circle_outlined : Icons.clear,
                                    color: widget.data.isAccommodationTogether == true ? Colors.pink : Colors.grey,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '식사 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    widget.data.isDiningTogether == true ? Icons.circle_outlined : Icons.clear,
                                    color: widget.data.isDiningTogether == true ? Colors.pink : Colors.grey,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  color: Color(0xffEFEFEF),
                  width: double.infinity,
                  height: 70,
                  child: Text(
                    widget.data.contents,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //make row align center
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.data.startDate.toString().substring(0,10),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '~ ${widget.data.endDate.toString().substring(0,10)}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ]
                      ),
                      Container(
                        width: 120,
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.data.participants.length,
                          itemBuilder: (context, index) {
                            MemberInfoDTO memberData = widget.data.participants[index];
                            return Text(
                              memberData.name,
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }

}
