class Habit {
  String? title;
  List<int> days = [];

  Habit();

  Map<String, dynamic> toMap() {
    return {'title': title, 'days': days};
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    Habit habit = Habit();

    habit.title = map["title"];
    habit.days = map["days"];

    return habit;
  }
}
