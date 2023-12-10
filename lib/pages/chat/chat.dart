import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:go_router/go_router.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 85,
            child: TextButton(
              onPressed: () {
                context.push("/chat/chatroom");
              },
              style: TextButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFF8BBD0),
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/loginPageImage0.png"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name",
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "text1111111111111111111111111111111111111",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color : Color(0xFF757575),
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "date",
                    style: TextStyle(
                      color : Color(0xFF757575),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: 'Hey!',
      user: ChatUser(
        id: '2',
        firstName: "park",
        // profileImage: AssetImage("/assets/loginPageImage0.jpg")
      ),
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50), child: AppBar(

      ),),
      body: SafeArea(
        child:
        DashChat(
          currentUser: user,
          onSend: (ChatMessage m) {
            setState(() {
              messages.insert(0, m);
            });
          },
          messages: messages,
        ),
      ),
    );
  }
}

//
// class ChatRoom extends StatefulWidget {
//   const ChatRoom({super.key});
//
//   @override
//   State<ChatRoom> createState() => _ChatRoomState();
// }
//
// class _ChatRoomState extends State<ChatRoom> {
//   final scrollController = ScrollController();
//   String text = "";
//
//   //송신자, 수신자 색깔 차이
//   Widget createMessage(isMine, text){
//     Color chatColor;
//     TextAlign textAlign;
//
//     if(isMine){
//       chatColor = Colors.yellow;
//       textAlign = TextAlign.right;
//     }
//     else{
//       chatColor = Colors.lightGreen;
//       textAlign = TextAlign.left;
//     }
//     return SizedBox(
//       width: 100,
//       height: 50,
//       child: Padding(
//         padding: const EdgeInsets.all(7.0),
//         child: Container(
//           color: chatColor,
//           child: Text(text.toString(), textAlign: textAlign)
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
//       scrollController.jumpTo(scrollController.position.maxScrollExtent);
//     });
//
//     return SafeArea(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 200,
//             height: 450,
//             child: ListView.builder(
//               controller: scrollController,
//               itemCount: 15,// 맥스 값 필요
//               itemBuilder: (context, index){
//                 if(index < 5){
//                   return createMessage(true, index);
//                 }
//                 else{
//                   return createMessage(false, index);
//                 }
//               },
//             ),
//           ),
//           const SizedBox(height: 30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                 width: 200,
//                 height: 30,
//                 child: TextField(
//                   onChanged: (value){
//                     setState(() {
//                       text = value;
//                     });
//                   },
//                 ),
//               ),
//               IconButton(onPressed: (){}, icon: const Icon(Icons.message))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
