import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tripmating/pages/home/home.dart';


import 'package:tripmating/pages/login/signup.dart';
import 'package:tripmating/pages/naverMap/naver-api.dart';
import 'pages/login/loginpage.dart';
import 'pages/matching/create/postingpage.dart';


import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';

import 'pages/matching/matching.dart';
import 'pages/mypage/mypage.dart';
import 'pages/mypage/memberassessment.dart';
import 'pages/chat/chat.dart';
import 'pages/home/home2.dart';

import '/model/messages/MessagePreview.dart';
import '/model/messages/Message.dart';



import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:tripmating/model/login-model/LoginDTO.dart';
import 'package:tripmating/model/login-model/SignupDTO.dart';
import 'package:tripmating/model/write/WriteDTO.dart';
import 'package:tripmating/service/IntroduceWriteService.dart';
import 'package:tripmating/service/LoginService.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initialize();
  runApp(ProviderScope(child: MyApp()));
}
  // String email = "test1@naver.com";
  // String password ="thisispassword";
  // String name ="이용현";
  // String phoneNumber = "010-1234-5678";
  // String profileImg= "profile_img.png";
  // String birthDate = "2000-12-19";
  // String gender = "MALE";
  // Map<String, dynamic> signupMap = {
  //   'email': email,
  //   'password': password,
  //   'name': name,
  //   'phoneNumber': phoneNumber,
  //   'profileImg': profileImg,
  //   'birthDate': birthDate,
  //   'gender': gender,
  // };
  // var signUpUser = SignupDTO.fromJson(signupMap);
  // //await LoginService.signUp(signUpUser);
  //
  // Map<String, dynamic> loginMap = {
  //   'email': email,
  //   'password': password,
  // };
  // var loginDTO = LoginDTO.fromJson(loginMap);
  // //await LoginService.login(loginDTO);
  //
  // //await LoginService.logout();

final GoRouter _router = GoRouter(initialLocation: '/login', routes: <RouteBase>[
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return const LoginPage();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'signup',
        builder: (context, state) {
          return const SignUp();
        },
      ),
    ],
  ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return SafeArea(
            child: Scaffold(
                body: navigationShell,
                bottomNavigationBar: BottomNavigationBar(
                    items: const<BottomNavigationBarItem>[
                      BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill), label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: 'Matching'),
                      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_alt), label: 'MyPage'),
                      BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: 'Chatting'),
                    ],
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.pink,
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: navigationShell.currentIndex,
                    onTap: (int index) {
                      navigationShell.goBranch(index);
                    }
                )
            ),
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/',
                  builder: (context, state) {
                    return const Home2();
                  },
                ),
              ]
          ),
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/matching',
                  builder: (context, state) {
                    return Matching();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'posting',
                      builder: (context, state) {
                        return const PostingPage();
                      },
                    ),
                  ],
                ),
              ]
          ),
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/mypage',
                  builder: (context, state) {
                    return const Mypage();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'assessment',
                      builder: (context, stage){
                        return const MemberAssessment();
                      }
                    )
                  ]
                ),
              ]
          ),
          StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/chat',
                  builder: (context, state){
                    return const Chat();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'chatroom',
                      builder: (context, state) {
                        return ChatRoom(data: state.extra as MessagePreview);
                      },
                    ),
                  ],
                )
              ])
        ],
      )
    ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      routerConfig: _router,
      title: 'Travel With',
    );
  }
}
