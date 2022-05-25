import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/providers/auth_provider.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';
import 'package:habit_app/screens/form%20screen/form_screen.dart';
import 'package:habit_app/shared/widgets/loading.dart';

class PersonalDetailsScreen extends StatefulWidget {
  static const routeName = '/personal-details';

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final su = ScreenUtil();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Loader()
            : SingleChildScrollView(
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
                          fontSize: 24 * su.scaleText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: su.setHeight(30),
                        ),
                        child: Consumer(builder: (context, ref, ch) {
                          final user = ref.watch(userProvider);

                          return Form(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: TextFormField(
                                    decoration: inputDecoration.copyWith(
                                        labelText: "First Name"),
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (val) {
                                      user.firstName = val;
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
                                      user.lastName = val;
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
                                        labelText: "Age"),
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (val) {
                                      user.age = int.parse(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: su.setHeight(300),
                      ),
                      Consumer(builder: (context, ref, ch) {
                        final user = ref.watch(userProvider);
                        return GestureDetector(
                          onTap: () async {
                            await DBService().addNewUser(user);
                            Navigator.of(context).pushReplacementNamed(
                                DashboardScreen.routeName);
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
                                  fontSize: 16 * su.scaleText,
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
