import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/providers/auth_provider.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';
import 'package:habit_app/services/auth.dart';
import 'package:habit_app/shared/functions.dart';

class PersonalDetailsScreen extends ConsumerWidget {
  static const routeName = '/personal-details';
  final su = ScreenUtil();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsMap = ref.watch(personalDetails);
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
                            style: TextStyle(color: Colors.white),
                            onChanged: (val) {
                              addDetails(detailsMap, firstName, val);
                            },
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
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            onChanged: (val) {
                              addDetails(detailsMap, lastName, val);
                            },
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
                            style: TextStyle(color: Colors.white),
                            onChanged: (val) {
                              addDetails(detailsMap, age, val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: su.setHeight(300),
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      await DBService().addNewUser(
                          detailsMap, Authentication().currentUser!.uid);
                      Navigator.pushReplacementNamed(
                        context,
                        DashboardScreen.routeName,
                      );
                    } catch (_) {
                      print(_);
                    }
                  },
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
                          fontSize: 16 * su.textScaleFactor,
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
