import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_app/database/db_service.dart';
import 'package:habit_app/models/habit.dart';
import 'package:habit_app/providers/auth_provider.dart';

final habitsStreamProvider = StreamProvider<List<Habit>>((ref) {
  final user = ref.watch(userProvider);
  return DBService().getUserHabits(user);
});
