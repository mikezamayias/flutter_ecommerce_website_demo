import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // firebase auth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // firebase auth object getter
  User? get currentUser => _firebaseAuth.currentUser;

  // sign up anonymously
  Future<User?> logInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // authentication state change listener
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // sign up with email and password

  // log in with email and password

  // log out
  Future<void> logOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // get current user or create a new one
  Future<User?> getOrCreateUser() async {
    if (currentUser == null) {
      await logInAnonymously();
    }
    return currentUser;
  }

  // Future loginWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return user;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // Future registerWithEmail({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     UserCredential authResult =
  //         await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return authResult;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
