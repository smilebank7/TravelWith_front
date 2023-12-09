import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF758C), // top color of the gradient
                Color(0xFFFF7EB3), // middle color of the gradient
                Color(0xFFFF7EA0), // additional color of the gradient
                Color(0xFFFF7DA0), // bottom color of the gradient
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TravelWith',
                  style: TextStyle(
                    fontSize: 63,
                    fontFamily: "Playpen",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '마음에 맞는 여행자를 찾아보세요!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                        .withAlpha(200), // Gives a little transparency
                  ),
                ),
                SizedBox(height: 60),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        // Add some horizontal padding
                        child: ElevatedButton(
                          onPressed: () {

                              context.go('/login');

                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Playpen",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity, // Make the button fill the width
                      height: 50, // Set a fixed height for the button
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        // Add some horizontal padding
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle SignUp press
                          },
                          child: Text("SignUp",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Playpen",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
