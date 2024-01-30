import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/auth/pages/login_page.dart';
import 'package:healthapp/main.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _userDb = FirebaseFirestore.instance.collection('users');

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> register(
    String email,
    String password,
    String address,
    String fullName,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await _userDb.add({
        'email': email.trim(),
        'fullName': fullName.trim(),
        'address': address.trim(),
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
    globalNavigator.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
      (route) => false,
    );
  }
}
