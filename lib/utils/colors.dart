import 'package:flutter/material.dart';

// main colors
const primary = Color(0xFF011b2b);
const secondary = Color(0xFFffffff);
const orange = Color(0xFFff8e11);
const pink = Color(0xFFf60e73);
const skyBlue = Color(0xFF07a9b0);
const purple = Color(0xFF4d2f90);
const grey = Color(0xFFEEEEEE);
const darkGrey = Color(0xFF808080);

// alert colors
const red = Color(0xFFF8D7DA);
const green = Color(0xffD4EDDA);
const yellow = Color(0xFFFFEEBA);
const lightBlue = Color(0xFFD1ECF1);
const redText = Color(0xFF721C24);
const greenText = Color(0xFF155724);
const yellowText = Color(0xFF856404);
const lightBlueText = Color(0xFF0C5460);

class CustomTheme {
  static final ThemeData theme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primary,
    );
  }
}
