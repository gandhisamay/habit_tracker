import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';

class PersonalDetailsScreen extends StatelessWidget {
  static const routeName = '/personal-details';
  final su = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(30),
              vertical: su.setHeight(50),
            ),
            child: Column(
              children: [
                Text(
                  "Enter your details",
                  style: TextStyle(
                    fontSize: 24 * su.textScaleFactor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: su.setHeight(30),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: TextFormField(
                            decoration: inputDecoration,
                            cursorColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: su.setHeight(20),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: TextFormField(
                            decoration: inputDecoration.copyWith(
                              labelText: "Last Name",
                            ),
                            cursorColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: su.setHeight(20),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: TextFormField(
                            decoration:
                                inputDecoration.copyWith(labelText: "Age"),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: ScreenUtil().setWidth(273),
                    height: ScreenUtil().setHeight(56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24 * su.textScaleFactor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
