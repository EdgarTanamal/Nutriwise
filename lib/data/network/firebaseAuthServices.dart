import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('Email not Found');
      } else if (e.code == 'wrong-password') {
        throw ('Password is incorrect');
      } else if (e.code == 'invalid-credential') {
        throw ('Email or Password is Incorrect');
      } else {
        throw ('Login failed: ${e.message}');
      }
    } catch (e) {
      throw ('Login failed: $e');
    }
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Menangani exception spesifik dari FirebaseAuth
      if (e.code == 'weak-password') {
        throw ('Password too Weak, use number and letter');
      } else if (e.code == 'email-already-in-use') {
        throw ('Email is Already in Use');
      } else if (e.code == 'invalid-email') {
        throw ('Email is Invalid');
      } else {
        throw ('Sign Up Failed: ${e.message}');
      }
    } catch (e) {
      // Menangani exception lainnya yang mungkin terjadi
      throw ('Sign Up Failed: $e');
    }
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Mendapatkan pengguna yang sedang login
  User? get currentUser => _auth.currentUser;
}
