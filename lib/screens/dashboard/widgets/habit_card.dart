import 'package:flutter/material.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/screens/detailed/details.dart';

class HabitCard extends StatefulWidget {
  final Habit habit;

  HabitCard({required this.habit});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      margin: EdgeInsets.symmetric(vertical: 21.0),
      padding: EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  setState(() {
                    completed = !completed;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: completed ? darkPurple : Colors.transparent,
                    border: completed
                        ? Border.all(
                            color: darkPurple,
                          )
                        : Border.all(
                            color: Colors.grey[500]!,
                          ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: completed ? Colors.white : Colors.grey[500],
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailsScreen.routeName);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.habit.title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.habit.moreDetails!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
          LinearProgressIndicator(
            value: .71,
            backgroundColor: Color(0xff1c232d),
            valueColor: AlwaysStoppedAnimation(
              cyan,
            ),
          ),
        ],
      ),
    );
  }
}
