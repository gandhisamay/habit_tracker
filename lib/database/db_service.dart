import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/models/user.dart';

class DBService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addNewUser(CUser user) async {
    await _users.doc(user.uid).set(user.toMap());
  }

  Future<void> addNewHabit(Habit habit, CUser user) async {
    await _users
        .doc(user.uid)
        .update({"habits": FieldValue.arrayUnion([habit.toMap()])});
  }
}
