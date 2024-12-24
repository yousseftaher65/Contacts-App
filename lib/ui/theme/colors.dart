import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color(0xff29384D);
  static const Color secondaryColor = Color(0xffFFFFFF);
  static const Color accentColor = Color(0xffE2F4F6);
  static const Color goldColor = Color(0xffFFF1D4);
  static const Color redColor = Color(0xffF93E3E);
}

class TxtStyle {
  static const TextStyle titleLarge = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: MyColors.goldColor);
  static const TextStyle titleMedium = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: MyColors.goldColor);
  static const TextStyle bodySmall = TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: MyColors.primaryColor);
  static const TextStyle hintText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.accentColor ,);
  static const TextStyle btnText = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: MyColors.primaryColor);
}

class MyIcon {
  static const Icon deleteIcon = Icon(
    Icons.delete,
    size: 24,
    color: MyColors.secondaryColor,
  );
  static const Icon addIcon = Icon(
    Icons.add,
    size: 28,
    color: MyColors.primaryColor,
  );
}
