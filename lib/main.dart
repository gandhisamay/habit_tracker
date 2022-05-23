import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/screens/detailed/details.dart';
import 'package:habit_app/screens/login/login.dart';
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
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
          home: LoginScreen(),
          routes: {
            Details.routeName : (context) => Details(),
          },
        );
      }
    );
  }
}

