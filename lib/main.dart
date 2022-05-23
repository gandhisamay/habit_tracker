import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';
import 'package:habit_app/screens/detailed/details.dart';
import 'package:habit_app/screens/login/login.dart';
import 'package:habit_app/screens/onboarding/personal_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // precacheImage()
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
              DashboardScreen.routeName: (context) => DashboardScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
            },
          );
        });
  }
}
