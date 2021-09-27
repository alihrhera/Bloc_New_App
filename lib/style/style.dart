
import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  accentColor: Colors.white,
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  backgroundColor: Colors.blueGrey,
);
ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);