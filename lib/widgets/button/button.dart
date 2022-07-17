import 'package:flutter/material.dart';

Widget button(
    {required dWidth,
    required dynamic onPressed,
    required String title,
    required Color color,
    required Color background,
    Widget? preWidget,
    Widget? subWidget}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
        primary: color,
        backgroundColor: background,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    child: Container(
      width: (dWidth / 100) * 100,
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (preWidget == null) const SizedBox.shrink() else preWidget,
          Text(
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
          ),
          if (subWidget == null) const SizedBox.shrink() else subWidget,
        ],
      ),
    ),
  );
}
