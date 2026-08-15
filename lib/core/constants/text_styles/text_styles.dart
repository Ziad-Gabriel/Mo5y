import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle titleStyle = GoogleFonts.barlowCondensed();
  static TextStyle bodyStyle = GoogleFonts.inter();

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
