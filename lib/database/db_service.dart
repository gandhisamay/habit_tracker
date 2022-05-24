import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addNewUser(Map<String, dynamic> details, String userId) async {
    await _users.doc(userId).set(details);
  }
}
