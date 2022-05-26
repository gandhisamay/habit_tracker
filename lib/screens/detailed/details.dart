import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/screens/detailed/widgets/beizer_curve.dart';
import 'package:habit_app/screens/edit%20form%20/edit_form_screen.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final su = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    final habit = ModalRoute.of(context)!.settings.arguments as Habit;
    // HabitsController details = new HabitsController(habit: habit);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: su.setWidth(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: su.setHeight(35),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            habit.title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 31 * su.scaleText,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                EditHabitFormScreen.routeName,
                                arguments: habit);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey[700]!,
                              ),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey[600],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: su.setHeight(10),
                    ),
                    Text(
                      habit.moreDetails!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16 * su.scaleText,
                      ),
                    ),
                    SizedBox(
                      height: su.setHeight(11.0),
                    ),
                    Text(
                      "Progress",
                      style: TextStyle(
                        fontSize: 21 * su.scaleText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: su.setHeight(15),
                    ),
                    LinearProgressIndicator(
                      value: .71,
                      backgroundColor: Color(0xff1c232d),
                      valueColor: AlwaysStoppedAnimation(
                        Color(0xff701bff),
                      ),
                    ),
                    SizedBox(
                      height: su.setHeight(35),
                    ),
                    Text(
                      "Repeat",
                      style: TextStyle(
                        fontSize: 21 * su.scaleText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: su.setHeight(15),
                    ),
                    Text(
                      habit.whichDays,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16 * su.scaleText,
                      ),
                    ),
                    // Divider(
                    //   color: Colors.grey[500],
                    //   height: 1.0,
                    // ),
                    // SizedBox(height: 35),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Transform.rotate(
                angle: 3.14,
                child: CustomPaint(
                  child: MyBezierCurve(),
                  painter: CurvePath(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
