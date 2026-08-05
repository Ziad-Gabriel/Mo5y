import 'package:flutter/material.dart';
import 'package:mo5y/core/constants/colors/const_colors.dart';

class AppColorScheme{

  static ColorScheme get darkColorScheme=>ColorScheme.dark(
    brightness: Brightness.dark,
    surface: background,
    primary: primaryColor,
    secondary: secondaryColor,
    primaryContainer: primaryContainer,
    onSurface: textColor,
    shadow: shadow,
  );
}