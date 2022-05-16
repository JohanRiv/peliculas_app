import 'package:flutter/material.dart';

class LightTheme {
  static final Color primary = Colors.blue.shade600;
  static const Color secundary = Colors.white;
  static const Color primaryText = Colors.black;
  static const Color secondaryText = Colors.white;
  static final Color thirdText = Colors.grey.shade700;
  static final Color third = Colors.grey.shade400;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      iconTheme: IconThemeData(color: primary),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryText)));
}
