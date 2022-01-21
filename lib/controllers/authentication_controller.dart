import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_website_demo/repositories/providers_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authenticationChangesSubscription;

  AuthenticationController(this._read) : super(null) {
    _authenticationChangesSubscription?.cancel();
    _authenticationChangesSubscription = _read(authenticationProvider)
        .authStateChanges()
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authenticationChangesSubscription?.cancel();
    super.dispose();
  }

  void signOut() {
    _read(authenticationProvider).signOut();
  }

  appStarted() {}
}
