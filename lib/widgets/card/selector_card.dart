import 'package:flutter/material.dart';
import 'package:naurs/models/selector.dart';
import 'package:naurs/utils/colors.dart';

Widget selectorCard(dWidth, SelectorFilter selector) {
  return Container(
    width: (dWidth / 100) * 45.0,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Center(
      child: Text(
        selector.title,
        style: TextStyle(
            fontSize: 14.0, color: selector.isSelected ? pink : secondary),
      ),
    ),
  );
}
