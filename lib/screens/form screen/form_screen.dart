import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/providers/auth_provider.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';
import 'package:habit_app/screens/loading%20/loading_screen.dart';

class NewHabitFormScreen extends StatefulWidget {
  static const routeName = '/new-habit-form';
  const NewHabitFormScreen({Key? key}) : super(key: key);

  @override
  State<NewHabitFormScreen> createState() => _NewHabitFormScreenState();
}

class _NewHabitFormScreenState extends State<NewHabitFormScreen> {
  final su = ScreenUtil();
  bool isLoading = false;
  Habit habit = Habit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? LoadingScreen()
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: su.setWidth(30),
                    vertical: su.setHeight(50),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Add a new habit",
                        style: TextStyle(
                          fontSize: 24 * su.scaleText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: su.setHeight(30),
                        ),
                        child: Consumer(builder: (context, ref, ch) {
                          return Form(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: TextFormField(
                                    decoration: inputDecoration.copyWith(
                                        labelText: "Title"),
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (val) {
                                      habit.title = val;
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
                                        labelText: "Num of days"),
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (val) {
                                      habit.numOfDays = int.parse(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: su.setHeight(400),
                      ),
                      Consumer(builder: (context, ref, ch) {
                        final user = ref.watch(userProvider);
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await DBService().addNewHabit(habit, user);
                            Navigator.pushReplacementNamed(
                              context,
                              DashboardScreen.routeName,
                            );
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
                                "Add Habit",
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
