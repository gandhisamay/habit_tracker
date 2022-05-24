import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_app/services/auth.dart';

final authStateProvider = StreamProvider<User?>((ref) => Authentication().user);
final personalDetails = StateProvider<Map<String, dynamic>>((ref) => {});
final docProvider = FutureProvider.autoDispose<bool>((ref) {
  print("@@docProvider called");
  return Authentication().isUserDocExists();
});
