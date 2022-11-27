import 'package:flutter/material.dart';
import 'package:grocery_user/Utils/font_style.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xffF8D247),
    fontFamily: "Inter",
    primaryColorLight: const Color(0xff555555),
    textTheme: TextTheme(
      titleLarge: interBold.copyWith(fontSize: 34),
      titleMedium: interSemiBold.copyWith(fontSize: 15, height: 1.3),
      titleSmall: interRegular.copyWith(fontSize: 15),
      labelLarge: interBold.copyWith(
        fontSize: 34,
      ),
      labelMedium: interSemiBold.copyWith(
        fontSize: 16,
        letterSpacing: 0,
      ),
      labelSmall: interSemiBold.copyWith(fontSize: 10, letterSpacing: 0, height: 1.2),
    ),
    hintColor: const Color(0xff555555),
    highlightColor: const Color(0xFF6482FF),
    scaffoldBackgroundColor: const Color(0xffEDEEF1));
