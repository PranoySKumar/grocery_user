import 'package:flutter/material.dart';
import 'package:grocery_user/Utils/font_style.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xffF8D247),
    fontFamily: "Inter",
    primaryColorLight: const Color(0xff555555),
    textTheme: TextTheme(
      titleLarge: interBold.copyWith(fontSize: 34),
      titleSmall: interRegular.copyWith(fontSize: 15),
      labelMedium: interSemiBold.copyWith(
        fontSize: 16,
        letterSpacing: 0,
      ),
      labelSmall: interSemiBold.copyWith(
        fontSize: 13,
        letterSpacing: 0,
      ),
    ),
    highlightColor: const Color(0xFF6482FF));
