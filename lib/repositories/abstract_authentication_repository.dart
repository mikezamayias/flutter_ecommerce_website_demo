import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuthenticationRepository {
  Stream<User?> get authenticationStateChanges;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  User? get currentUser;
  Future<void> signOut();
}
