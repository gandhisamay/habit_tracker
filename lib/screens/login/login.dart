import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/screens/login/widgets/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff131b26),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Habit Tracker\nApp",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40 * su.textScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/habit.jpg",
                height: su.setWidth(250),
                width: su.setWidth(250),
              ),
            ),
            SizedBox(
              height: su.setHeight(100)
            ),
            SignInButton(
              signInType: "Sign In with Google",
              imageLocation: "assets/images/google.png",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
