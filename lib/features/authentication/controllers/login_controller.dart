import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signIn(UserModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email.trim(),
        password: user.password.trim(),
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Return Firebase error message
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }
}
