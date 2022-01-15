import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> getOrCreateUser() async {
    if (currentUser == null) {
      await _firebaseAuth.signInAnonymously();
    }
    return currentUser;
  }

  Future loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      return e.toString();
    }
  }

  Future registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult;
    } catch (e) {
      return e.toString();
    }
  }
}
