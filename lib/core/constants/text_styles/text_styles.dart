import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle titleStyle = TextStyle(fontFamily: 'BarlowCondensed');
  static TextStyle bodyStyle = TextStyle(fontFamily: 'Inter');

  static TextTheme get appTextTheme => TextTheme(
    titleLarge: titleStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight(600),
      letterSpacing: -0.01,
    ),
    titleMedium: titleStyle.copyWith(fontSize: 24, fontWeight: FontWeight(600)),
    titleSmall: titleStyle.copyWith(fontSize: 20, fontWeight: FontWeight(600)),
    bodyLarge: bodyStyle.copyWith(fontSize: 16, fontWeight: FontWeight(600)),
    bodyMedium: bodyStyle.copyWith(fontSize: 14, fontWeight: FontWeight(600)),
    bodySmall: bodyStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight(600),
      letterSpacing: 0.05,
    ),
  );
}
