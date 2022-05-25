import 'package:flutter/material.dart';
import 'package:habit_app/screens/dashboard/dashboard.dart';

class HabitCard extends StatelessWidget {
  final int id;

  HabitCard({required this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        // height: 150,
        margin: EdgeInsets.symmetric(vertical: 21.0),
        padding: EdgeInsets.only(right: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: id == 0 ? habits2[id]['color'] : Colors.transparent,
                    border: id == 0
                        ? Border()
                        : Border.all(
                            color: Colors.grey[500]!,
                          ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: id == 0 ? Colors.white : Colors.grey[500],
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      habits2[id]['objectif'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      habits2[id]['progress'],
                      style: TextStyle(color: Colors.grey[500], fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
            LinearProgressIndicator(
              value: .71,
              backgroundColor: Color(0xff1c232d),
              valueColor: AlwaysStoppedAnimation(
                habits2[id]['color'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}