import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_website_demo/archive/repositories/providers_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'abstract_authentication_repository.dart';

class UserAuthenticationRepository implements AbstractAuthenticationRepository {
  final Reader _read;

  UserAuthenticationRepository(this._read);

  @override
  Stream<User?> get authenticationStateChanges {
    return _read(authenticationProvider).authStateChanges();
  }

  @override
  User? get currentUser {
    return _read(authenticationProvider).currentUser;
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _read(authenticationProvider).signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    return await _read(authenticationProvider).signOut();
  }

  @override
  Future<UserCredential?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return _read(authenticationProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
