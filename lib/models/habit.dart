class Habit {
  String? title;
  int? numOfDays;

  Habit();

  Map<String, dynamic> toMap() {
    return {'title': title, 'numOfDays': numOfDays};
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    Habit habit = Habit();

    habit.title = map["title"];
    habit.numOfDays = map["numOfDays"];

    return habit;
  }
}
