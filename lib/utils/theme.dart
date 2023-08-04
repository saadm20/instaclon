import 'package:flutter/material.dart';

// *Colors
@immutable
class AppColors {
  static final textfieldColor = Colors.grey[150];
  static final backGroundGreyColor = Colors.grey[200];
  const AppColors._();
}

// * Values
const String defaultFontFamily = "FreightSansPro";
const String titleFontFamily = "ProximaNova";

// *ThemeData

ThemeData lightTheme = ThemeData(fontFamily: defaultFontFamily);
ThemeData darkTheme = ThemeData(fontFamily: defaultFontFamily);
