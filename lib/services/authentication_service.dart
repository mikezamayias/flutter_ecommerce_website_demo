import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import '../models/user/user_model.dart';
import 'firestore_service.dart';

class AuthenticationService {
  // firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // firebase auth object getter
  User? get currentUser => _auth.currentUser;

  // authentication state change listener
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // sign up with email and password
  Future<Object> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String streetAddress,
    required String city,
    required String postalCode,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;
      UserModel userModel = UserModel(
        uid: user?.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        streetAddress: streetAddress,
        city: city,
        postalCode: int.parse(postalCode),
      );
      await locator<FirestoreService>().createUser(userModel);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  // log in with email and password
  Future<Object> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  // log out
  Future<void> logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
