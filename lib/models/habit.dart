import 'package:habit_app/constants/constants.dart';
import 'package:intl/intl.dart';

class Habit {
  String? hid;
  String? uid;
  String? title;
  String? moreDetails;
  List<dynamic> days = [];
  List<dynamic> completedDays = [];

  Habit();

  String get whichDays {
    String res = "";
    for (int i = 0; i < days.length; i++) {
      if (i == days.length - 1) {
        res += daysInWeek[days[i] - 1];
      } else {
        res += daysInWeek[days[i] - 1] + ", ";
      }
    }
    return res;
  }

  bool get isCompleted {
    DateTime today = DateTime.now();
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(today);
    return completedDays.contains(formatted);
  }

  double get progress {
    double progress = 0.0;
    int totalDaysCompleted = 0;

    DateTime today = DateTime.now();
    // DateTime afterOneWeek

    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(today);

    //Day number of today
    int day = today.weekday;

    for (int i = 0; i < day; i++) {
      String day = formatted.substring(0, 2);
      int dayInt = int.parse(day) - i;

      String remaining = formatted.substring(2);
      String check = dayInt.toString() + remaining;
      print(check);

      if (completedDays.contains(check)) {
        totalDaysCompleted++;
      }
    }

    print(totalDaysCompleted);

    progress = (totalDaysCompleted) / days.length;
    return progress;
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'hid': hid,
      'title': title,
      'moreDetails': moreDetails,
      'days': days,
      'completedDays': completedDays
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    Habit habit = Habit();

    habit.uid = map["uid"] as String?;
    habit.hid = map["hid"] as String?;
    habit.title = map["title"] as String?;
    habit.days = map["days"];
    habit.moreDetails = map["moreDetails"] as String?;
    habit.completedDays = map["completedDays"];

    return habit;
  }
}
