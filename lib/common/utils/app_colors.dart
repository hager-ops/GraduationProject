import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color appBackgroundColor = Color(0xFF57C3FF);

  static const Color primaryColor = Color(0xFF57C3FF);
  static const Color forthColor = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF707070);

  static const Color textPrimaryColor = Color(0xFF414E4E);
  static const Color textSecondaryColor = Color(0xFF656767);

  static const Color buttonPrimaryColor = Color(0xFF4A97C4);
  static const Color buttonTertiaryColor = Color(0x24000000);
  static const Color buttonForthColor = Color(0xFFFFFFFF);

  static const Color borderPrimaryColor = Color(0xFF414E4E);
  static const Color borderSecondaryColor = Color(0xFFE3443B);
  static const Color borderCheckboxColor = Color(0xFFD0DDF4);

  static const Color warning = Color(0xFFE88888);
  static const Color warningLight = Color(0xFFFFF0E8);

  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFFE6E6E6);
  static const Color borderColor = Color(0xFFA9CBD2);

  static List<Color> primaryGradiantColors = [
    const Color(0xFF57C3FF),
    const Color(0xFF57C3FF).withOpacity(.9),
    const Color(0xFF57C3FF).withOpacity(.8),
    const Color(0xFF89DFE6).withOpacity(.6),
  ];
}
