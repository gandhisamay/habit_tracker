import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  User? get currentUser => _auth.currentUser;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<bool> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        user = userCredential.user;
        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          return false;
        } else if (e.code == 'invalid-credential') {
          return false;
        }
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
    return false;
  }

  Future<void> logout() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<bool> isUserDocExists() async {
    print("@auth ${currentUser!.uid}");
    final DocumentSnapshot userDoc = await _users.doc(currentUser!.uid).get();
    print("@ ${userDoc.id}");
    if (userDoc.exists) {
      return true;
    } else {
      return false;
    }
  }
}
