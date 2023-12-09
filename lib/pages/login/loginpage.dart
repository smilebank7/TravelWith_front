import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmating/model/login-model/LoginDTO.dart';
import 'package:tripmating/service/LoginService.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginPanel();
  }
}

class LoginPanel extends StatefulWidget {
  const LoginPanel({super.key});

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final _iDController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _iDController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    context.go("/login/signup");
  }

  void signIn() async {
    int statusCode = await LoginService.login(LoginDTO(
      email: _iDController.text,
      password: _passwordController.text,
    ));

    if (statusCode == 200) {
      context.go("/");
    }

    print("sing In");
    print(_iDController.text);
    print(_passwordController.text);
  }

  //자판 열면 위로 밀려나게 구현, 참고: https://cishome.tistory.com/114
  //preferred size size:에 뭐 넣어야 되는지 찾아보기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Travel With",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Image(
                image: AssetImage("assets/loginPageImage0.jpg"),
                width: 250,
                height: 250,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input ID',
                      ),
                      controller: _iDController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'InputPassword',
                      ),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: signUp, child: const Text("sign up")),
                  ElevatedButton(
                      onPressed: signIn, child: const Text("sign in"))
                ],
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
