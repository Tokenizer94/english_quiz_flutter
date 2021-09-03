import 'package:flutter/material.dart';
import 'package:tokenizer/tokenizer.dart' as tokenizer;
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.cyan,
      accentColor: Colors.indigo,
      splashColor: Colors.transparent,
      fontFamily: tokenizer.wyekanFontName,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.grey.shade700,
      primaryColor: Colors.deepPurpleAccent,
      accentColor: Colors.lightGreen.shade800,
      splashColor: Colors.transparent,
      fontFamily: tokenizer.wyekanFontName,
    );
  }
}