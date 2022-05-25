import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/providers/habit_provider.dart';
import 'package:habit_app/screens/dashboard/widgets/habit_card.dart';
import 'package:habit_app/screens/form%20screen/form_screen.dart';
import 'package:habit_app/shared/widgets/loading.dart';
import 'package:intl/intl.dart';

List<Map<String, dynamic>> habits1 = [
  {
    'color': Colors.blue,
    'title': 'YP',
    'fulltext': 'Yoga Practice',
  },
  {
    'color': Colors.red,
    'title': 'GE',
    'fulltext': 'Get Up Early',
  },
  {
    'color': Colors.cyan,
    'title': 'NS',
    'fulltext': 'No Sugar',
  },
];
List<Map<String, dynamic>> habits2 = [
  {
    'color': Color(0xff7524ff),
    'objectif': 'Learn 5 new words',
    'progress': '5 from 7 this week'
  },
  {
    'color': Color(0xfff03244),
    'objectif': 'Get Up Early',
    'progress': '5 from 7 this week'
  },
  {
    'color': Color(0xff00d5e2),
    'objectif': 'Create an App a day',
    'progress': '6 from 7 this week'
  },
];

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  final su = ScreenUtil();

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
                height: su.setHeight(35),
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
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, f) {
                    int day = DateTime.now().day + f;
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
                              "${DateTime.now().day + f}",
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
                      return HabitCard(habit: habits[index]);
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
