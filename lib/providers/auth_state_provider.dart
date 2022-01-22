import 'package:flutter/foundation.dart';

class AuthStateProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get authState => _isLoggedIn;

  set authState(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
