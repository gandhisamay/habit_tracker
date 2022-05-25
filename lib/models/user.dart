import 'package:habit_app/models/habit.dart';

class CUser {
  String? uid;
  String? firstName;
  String? lastName;
  int? age;

  CUser();

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }

  factory CUser.fromMap(Map<String, dynamic> map) {
    CUser user = CUser();

    user.uid = map["uid"];
    user.firstName = map["firstName"];
    user.lastName = map["lastName"];
    user.age = map["age"];

    return user;
  }
}
