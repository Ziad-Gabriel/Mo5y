import 'package:flutter/material.dart';
import 'package:mo5y/core/constants/colors/color_scheme.dart';
import 'package:mo5y/core/constants/colors/const_colors.dart';
import 'package:mo5y/core/constants/text_styles/text_styles.dart';

class AppThemes {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: AppColorScheme.darkColorScheme,
    textTheme: TextStyles.appTextTheme,
  );
}
