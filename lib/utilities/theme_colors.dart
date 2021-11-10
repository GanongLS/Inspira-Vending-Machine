import 'package:flutter/material.dart';

class ThemeColors {
  static Color pink = const Color(0xFFFFB5A3);
  static Color lightBlue = const Color(0xFF6B73FF);
  static Color darkBlue = const Color(0xFF2B35FF);
  static Color grey = const Color(0xFFA0A3A6);
  static Color lightGrey = const Color(0xFFF2F2F3);
  static Color subGrey = const Color(0xFF84898C);
  static Shader linearGradient = LinearGradient(
    colors: <Color>[lightBlue, darkBlue],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
