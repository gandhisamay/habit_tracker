import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/constants/constants.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/screens/detailed/details.dart';
import 'package:habit_app/shared/linear_progress_indicator.dart';

class HabitCard extends StatefulWidget {
  final Habit habit;

  HabitCard({required this.habit});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  final su = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.habit.hid!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await DBService().deleteHabit(widget.habit);
      },
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("DELETE")),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Container(
        // height: 150,
        margin: EdgeInsets.symmetric(vertical: 21.0),
        padding: EdgeInsets.only(right: 25.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    // Navigator.of(context).pop();
                    setState(() {});
                    await DBService().updateHabitCompletionStatus(widget.habit);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.habit.isCompleted
                          ? darkPurple
                          : Colors.transparent,
                      border: widget.habit.isCompleted
                          ? Border.all(
                              color: darkPurple,
                            )
                          : Border.all(
                              color: Colors.grey[500]!,
                            ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: widget.habit.isCompleted
                          ? Colors.white
                          : Colors.grey[500],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailsScreen.routeName,
                        arguments: widget.habit);
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
                      LimitedBox(
                        maxWidth: su.setWidth(230),
                        child: Text(
                          widget.habit.moreDetails!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12 * su.scaleText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
            AnimatedLinearProgressIndicator(
              progress: widget.habit.progress,
              color: cyan,
            )
          ],
        ),
      ),
    );
  }
}
