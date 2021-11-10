import 'package:flutter/material.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';


class ThemeStyles {
  static TextStyle welcomeTextStyle = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: ThemeColors.grey,
  );

  static TextStyle userNameTextStyle = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 22.0,
    foreground: Paint()..shader = ThemeColors.linearGradient,
  );

  static TextStyle availableTextStyle = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 13.0,
    fontWeight: FontWeight.w700,
    color: Colors.white.withOpacity(0.72),
  );

  static TextStyle moneyTextStyle = const TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 34.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle rechargeTextStyle = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 15.0,
    foreground: Paint()..shader = ThemeColors.linearGradient,
  );

  static TextStyle listTitleTextStyle = const TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 18.0,
    color: Colors.black,
  );

  static TextStyle listSubTitleTextStyle = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 14.0,
    color: ThemeColors.subGrey,
  );

  static TextStyle activeTab = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 15.0,
    foreground: Paint()..shader = ThemeColors.linearGradient,
  );

  static TextStyle inactiveTab = TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 15.0,
    color: ThemeColors.grey,
  );

  static TextStyle vendingButton = const TextStyle(
    fontFamily: 'Circular Std',
    fontSize: 20.0,
    color: Colors.white,
  );
}
