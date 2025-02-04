import 'package:flutter/material.dart';

class Kios_colorsColors {
  Kios_colorsColors._();

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{50: Color(_greenPrimaryValue)},
  );
  static const int _greenPrimaryValue = 0xFF88d049;

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{50: Color(_redPrimaryValue)},
  );
  static const int _redPrimaryValue = 0xFF4A1010;

  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{50: Color(_yellowPrimaryValue), 100: Color(0XFFFFC72C)},
  );
  static const int _yellowPrimaryValue = 0xFFFFF2CC;

  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{50: Color(_blackPrimaryValue)},
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static const MaterialColor white = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{50: Color(_whitePrimaryValue)},
  );
  static const int _whitePrimaryValue = 0xFFFFFFFF;
}
