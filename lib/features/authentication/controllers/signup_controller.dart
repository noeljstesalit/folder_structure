import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUp(UserModel user, String selectedRole) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: user.email.trim(),
            password: user.password.trim(),
          );

      int roleId = selectedRole == 'Content Creator' ? 1 : 2;

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': user.email.trim(),
        'role': selectedRole,
        'role_id': roleId,
        'created_at': FieldValue.serverTimestamp(),
      });

      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }
}
