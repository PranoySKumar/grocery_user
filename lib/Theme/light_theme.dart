import 'package:flutter/material.dart';
import 'package:grocery_user/Utils/font_style.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xffF8D247),
  fontFamily: "Inter",
  textTheme: TextTheme(
      titleLarge: interBold.copyWith(fontSize: 34),
      titleSmall: interRegular.copyWith(fontSize: 15),
      labelSmall: interSemiBold.copyWith(fontSize: 16)),
);
