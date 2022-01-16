import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // firebase auth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // firebase auth object getter
  User? get currentUser => _firebaseAuth.currentUser;

  // authentication state change listener
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // // sign up anonymously
  // Future<User?> logInAnonymously() async {
  //   try {
  //     UserCredential result = await _firebaseAuth.signInAnonymously();
  //     User? user = result.user;
  //     return user;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return null;
  //   }
  // }

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

  // // get current user or create a new one
  // Future<User?> getOrCreateUser() async {
  //   if (currentUser == null) {
  //     // await logInAnonymously();
  //   }
  //   return currentUser;
  // }
}
