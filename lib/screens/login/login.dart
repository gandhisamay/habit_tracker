import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/screens/login/widgets/sign_in_button.dart';
import 'package:habit_app/screens/onboarding/personal_details.dart';
import 'package:habit_app/services/auth.dart';
import 'package:habit_app/shared/widgets/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil();

    return SafeArea(
      child: isLoading
          ? Loader()
          : Scaffold(
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
                        fontSize: 40 * su.scaleText,
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
                  SizedBox(height: su.setHeight(100)),
                  SignInButton(
                    signInType: "Sign In with Google",
                    imageLocation: "assets/images/google.png",
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        await Authentication()
                            .signInWithGoogle(context: context);
                      } catch (_) {
                        setState(() {
                          isLoading = false;
                        });
                        print(_);
                      }
                    },
                  )
                ],
              ),
            ),
    );
  }
}
