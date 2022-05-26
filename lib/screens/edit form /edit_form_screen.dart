import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';

class EditHabitFormScreen extends StatefulWidget {
  static const routeName = '/edit-habit-form';
  const EditHabitFormScreen({Key? key}) : super(key: key);

  @override
  State<EditHabitFormScreen> createState() => _EditHabitFormScreen();
}

class _EditHabitFormScreen extends State<EditHabitFormScreen> {
  final su = ScreenUtil();
  Habit habit = Habit();

  @override
  Widget build(BuildContext context) {
    Habit habit = ModalRoute.of(context)!.settings.arguments as Habit;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: su.setWidth(30),
            vertical: su.setHeight(10),
          ),
          child: GestureDetector(
              onTap: () async {
                if (habit.days.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      duration: Duration(
                        milliseconds: 800,
                      ),
                      content: Text(
                        'You need to select atleast one day',
                      ),
                    ),
                  );
                } else {
                  await DBService().updateHabit(habit);
                  Navigator.pushReplacementNamed(
                    context,
                    DashboardScreen.routeName,
                  );
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
                    "Edit Habit",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16 * su.scaleText,
                    ),
                  ),
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(30),
              vertical: su.setHeight(30),
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
                              decoration:
                                  inputDecoration.copyWith(labelText: "Title"),
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              initialValue: habit.title,
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
                                  hintText: "More details",
                                  hintStyle: TextStyle(color: Colors.white)),
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              maxLines: 3,
                              initialValue: habit.moreDetails,
                              keyboardType: TextInputType.multiline,
                              onChanged: (val) {
                                habit.moreDetails = val;
                              },
                            ),
                          ),
                          SizedBox(
                            height: su.setHeight(20),
                          ),
                          Text(
                            "Repeat",
                            style: TextStyle(
                              fontSize: 16 * su.scaleText,
                            ),
                          ),
                          Container(
                            height: su.setHeight(350),
                            child: ListView.builder(
                              itemCount: daysInWeek.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (habit.days.contains(index + 1)) {
                                      habit.days.remove(index + 1);
                                    } else {
                                      habit.days.add(index + 1);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: su.setHeight(5)),
                                    width: double.infinity,
                                    height: su.setHeight(60),
                                    decoration: BoxDecoration(
                                        color: habit.days.contains(index + 1)
                                            ? opaciousGrey
                                            : weekDayColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child:
                                        Center(child: Text(daysInWeek[index])),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
