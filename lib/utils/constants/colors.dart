import 'package:flutter/material.dart';

class SColors {
  static const Color lightestGrey = Color.fromARGB(255, 250, 250, 250);

  static const Color important = Colors.red;
  static const Color occasion = Colors.amber;
  static const Color holiday = Colors.indigo;

  static const Color primary = Color.fromARGB(255, 28, 180, 194);
  static const Color primaryDark = Color.fromARGB(255, 11, 133, 145);
  static const Color primaryDarker = Color.fromARGB(255, 0, 52, 66);
  static const Color primaryLight = Color.fromARGB(255, 58, 195, 207);

  static const Color absent = Color.fromARGB(255, 241, 75, 92);
  static const Color present = Color.fromARGB(255, 21, 211, 106);
  // App theme colors
  static const Color secondary = Color.fromARGB(255, 255, 139, 65);
  static const Color accent = Color(0xFFb0c7ff);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = SColors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  static const List<Map<String, Color>> listColors = [
    {
      "primary": Color.fromARGB(255, 231, 113, 113),
      "secondary": Color.fromARGB(255, 255, 234, 234)
    },
    {
      "primary": Color.fromARGB(255, 71, 150, 150),
      "secondary": Color.fromARGB(255, 224, 244, 244)
    },
    {
      "primary": Color.fromARGB(255, 244, 198, 0),
      "secondary": Color.fromARGB(255, 255, 248, 219)
    },
    {
      "primary": Color.fromARGB(255, 15, 93, 247),
      "secondary": Color.fromARGB(255, 220, 232, 255)
    },
    {
      "primary": Color.fromARGB(255, 246, 139, 1),
      "secondary": Color.fromARGB(255, 255, 238, 216),
    },
    {
      "primary": Color.fromARGB(255, 61, 50, 112),
      "secondary": Color.fromARGB(255, 235, 231, 253)
    },
    {
      "primary": Color.fromARGB(255, 74, 148, 58),
      "secondary": Color.fromARGB(255, 214, 236, 209)
    },
    {
      "primary": Color.fromARGB(255, 133, 61, 14),
      "secondary": Color.fromARGB(255, 255, 223, 202)
    },
    {
      "primary": Color.fromARGB(255, 138, 26, 113),
      "secondary": Color.fromARGB(255, 243, 220, 238)
    },
    {
      "primary": Color.fromARGB(255, 166, 0, 0),
      "secondary": Color.fromARGB(255, 255, 211, 211)
    }
  ];
  static const List<Color> accentListColors = [
    Color.fromARGB(255, 255, 216, 191),
    Color.fromARGB(255, 159, 245, 206),
    Color.fromARGB(255, 218, 187, 255),
    Color.fromARGB(255, 164, 226, 251),
    Color.fromARGB(255, 255, 187, 188),
    Color.fromARGB(255, 248, 176, 234),
    Color.fromARGB(255, 255, 187, 188),
    Color.fromARGB(255, 255, 187, 188),
  ];
}
