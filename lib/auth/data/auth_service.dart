import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> register(
    String email,
    String password,
    String fullname,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email.trim(),
        'password': password.trim(),
        'fullname': fullname.trim(),
      });
    } catch (e) {
      if (kDebugMode) {
        print(('Error during registration: $e'));
      }
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Sign-in successful, no error message
    } catch (e) {
      return e.toString(); // Return error message on failure
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
