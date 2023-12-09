import "dart:math";

import "package:flutter/material.dart";
import 'package:random_avatar/random_avatar.dart';

// import "package:get/get.dart";
import "package:go_router/go_router.dart";

// import 'package:tripmating/Controller/SignupController.dart';
import "package:tripmating/model/login-model/SignupDTO.dart";
import "package:tripmating/service/LoginService.dart";


enum Gender { male, female }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final SignupController _signupController = Get.put(SignupController());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _genderController = TextEditingController();

  Gender gender = Gender.male;

  String avatarKey = "000000000000";
  Widget avatar = RandomAvatar("000000000000", width: 100, height: 100);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    makeRandomAvatar();
    super.initState();
  }

  Widget makeRandomAvatar(){
    String avatarKey = "";
    for(int i = 0; i < 6; i++){
      avatarKey += Random().nextInt(48).toString();
    }
    avatar = RandomAvatar(avatarKey, width: 100, height: 100);

    return avatar;
  }

  void remakeRandomAvatar(){
    String avatarKey = "";
    for(int i = 0; i < 6; i++){
      avatarKey += Random().nextInt(48).toString();
    }
    setState(() {
      avatar = RandomAvatar(avatarKey, width: 100, height: 100);
    });
    print(avatarKey);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(50), child: AppBar(
        title: const Text("Sign Up"),
      ),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              //email, password, name, phoneNumber, profileImg, birthDate, gender
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    avatar,
                    IconButton(onPressed: (){ remakeRandomAvatar(); }, icon: const Icon(Icons.refresh))
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "email",
                    ),
                    controller: _emailController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password",
                    ),
                    controller: _passwordController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "name",
                    ),
                    controller: _nameController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "phone number",
                    ),
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "birthDate(ex.2000-01-01})",
                    ),
                    controller: _birthDateController,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 30,
                      child: RadioListTile(
                        title: const Text("Male"),
                        value: Gender.male,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 30,
                      child: RadioListTile(
                        title: const Text("Female"),
                        value: Gender.female,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          LoginService.signUp(SignupDTO(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                            phoneNumber: _phoneNumberController.text,
                            profileImg: avatarKey,
                            birthDate: DateTime.parse(_birthDateController.text),
                            gender: gender == Gender.male ? "MALE" : "FEMALE",
                          ));
                          //post
                          context.go("/login");
                        },
                        child: Text("sign up")),
                    ElevatedButton(
                        onPressed: () {
                          context.go("/login");
                        },
                        child: Text("cancel")),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
