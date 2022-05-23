import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/screens/detailed/details.dart';
import 'package:habit_app/screens/login/login.dart';
import 'package:habit_app/screens/onboarding/personal_details.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (ctx, ch) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Habit Tracker App',
            theme: ThemeData(
              fontFamily: 'Poppins',
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(
                  color: Colors.white,
                ),
              ),
              primaryColor: Colors.white,
              scaffoldBackgroundColor: scaffoldColor,
            ),
            home: LoginScreen(),
            routes: {
              PersonalDetailsScreen.routeName: (context) =>
                  PersonalDetailsScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
            },
          );
        });
  }
}
