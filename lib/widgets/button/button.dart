import 'package:flutter/material.dart';

Widget button(
    {required double dWidth,
    required dynamic onPressed,
    required String title,
    required Color color,
    required Color background,
    Color borderColor = Colors.transparent,
    double fontSize = 20.0,
    double padding = 6.0,
    double borderRadius = 10.0,
    Widget? preWidget,
    Widget? subWidget}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        primary: color,
        backgroundColor: background,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)))),
    child: Container(
      width: (dWidth / 100) * 100,
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (preWidget == null) const SizedBox.shrink() else preWidget,
          Text(
            title,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w200),
          ),
          if (subWidget == null) const SizedBox.shrink() else subWidget,
        ],
      ),
    ),
  );
}
