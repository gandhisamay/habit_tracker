import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/providers/habit_provider.dart';
import 'package:habit_app/screens/dashboard/widgets/habit_card.dart';
import 'package:habit_app/screens/form%20screen/form_screen.dart';
import 'package:habit_app/shared/widgets/loading.dart';
import 'package:intl/intl.dart';
import 'package:quiver/time.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  final su = ScreenUtil();
  final DateTime today = DateTime.now();
  final int maxDays = daysInMonth(DateTime.now().year, DateTime.now().month) -
      DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: su.setWidth(30),
            vertical: su.setHeight(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Today's Habits",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, NewHabitFormScreen.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff6f1bff),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff6f1bff),
                                offset: Offset(0, 3),
                                blurRadius: 5.0),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: su.setHeight(5),
              ),
              Text(
                "This Week",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16 * su.scaleText,
                ),
              ),
              SizedBox(
                height: su.setHeight(15),
              ),
              Container(
                height: su.setHeight(90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1b232e),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: maxDays,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, f) {
                    int day = today.day + f;
                    return FittedBox(
                      child: Container(
                        width: su.setWidth(90),
                        height: su.setHeight(90),
                        margin: EdgeInsets.only(right: su.setWidth(15)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: day == DateTime.now().day
                              ? Color(0xff727be8)
                              : Color(0xff131b26),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(su.setWidth(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${day}",
                              style: TextStyle(
                                fontSize: 20 * su.scaleText,
                                fontWeight: day == DateTime.now().day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: day == DateTime.now().day
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              DateFormat('EE').format(
                                DateTime.now().add(
                                  Duration(days: f),
                                ),
                              ),
                              style: TextStyle(
                                  color: day == DateTime.now().day
                                      ? Colors.white
                                      : Colors.grey[700],
                                  fontWeight: day == DateTime.now().day
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // HabitCard(id: 1,)
              Expanded(child: Consumer(builder: (context, ref, ch) {
                final _habitStream = ref.watch(habitsStreamProvider);
                return _habitStream.when(data: (habits) {
                  return ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (ctx, index) {
                      return HabitCard(
                        habit: habits[index],
                      );
                    },
                  );
                }, loading: () {
                  return Loader();
                }, error: (_, st) {
                  print(_);
                  print(st);
                  return Container();
                });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
