import 'package:habit_app/models/habit.dart';

class CUser {
  String? uid;
  String? firstName;
  String? lastName;
  int? age;
  List<Habit> habits = [];

  CUser();

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'habits': habits
    };
  }

  factory CUser.fromMap(Map<String, dynamic> map) {
    CUser user = CUser();

    user.uid = map["uid"];
    user.firstName = map["firstName"];
    user.lastName = map["lastName"];
    user.age = map["age"];
    user.habits = map["habits"];

    return user;
  }
}
