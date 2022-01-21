import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

CurrentTheme currentTheme = CurrentTheme();

class CurrentTheme with ChangeNotifier {
  static bool _isLightTheme = true;

  ThemeMode get currentTheme =>
      _isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: GoogleFonts.mPlusRounded1c(
        fontWeight: FontWeight.w600,
      ).fontFamily,
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.mPlusRounded1c(
        fontWeight: FontWeight.w600,
      ).fontFamily,
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
