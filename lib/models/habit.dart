class Habit {
  String? hid;
  String? uid;
  String? title;
  String? moreDetails;
  List<dynamic> days = [];

  Habit();

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'hid': hid,
      'title': title,
      'moreDetails': moreDetails,
      'days': days
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    Habit habit = Habit();

    habit.uid = map["uid"] as String;
    habit.hid = map["hid"] as String ;
    habit.title = map["title"] as String;
    habit.days = map["days"];
    habit.moreDetails = map["moreDetails"] as String;

    return habit;
  }
}
