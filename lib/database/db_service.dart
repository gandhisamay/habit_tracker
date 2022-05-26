import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/models/user.dart';
import 'package:intl/intl.dart';

class DBService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _habits =
      FirebaseFirestore.instance.collection('habits');

  Future<void> addNewUser(CUser user) async {
    await _users.doc(user.uid).set(user.toMap());
    await _habits.doc(user.uid);
  }

  Future<void> addNewHabit(Habit habit, CUser user) async {
    habit.uid = user.uid;
    await _habits.add(habit.toMap()).then((value) {
      habit.hid = value.id;
    });

    await _habits.doc(habit.hid).set(habit.toMap());
  }

  Future<void> updateHabitCompletionStatus(Habit habit) async {
    DateTime today = DateTime.now();
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(today);

    if (habit.completedDays.contains(formatted)) {
      habit.completedDays.remove(formatted);
    } else {
      habit.completedDays.add(formatted);
    }

    print(habit.toMap());

    await _habits.doc(habit.hid).update({'completedDays': habit.completedDays});
  }

  Stream<List<Habit>> getUserHabits(CUser user) {
    return _habits
        .where('uid', isEqualTo: user.uid)
        .where('days', arrayContains: DateTime.now().weekday)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Habit.fromMap(e.data()! as Map<String, dynamic>),
              )
              .toList(),
        );
  }
}
