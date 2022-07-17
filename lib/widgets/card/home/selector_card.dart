import 'package:flutter/material.dart';
import 'package:naurs/screens/home/home.dart';
import 'package:naurs/utils/colors.dart';

Widget selectorCard(dWidth, SelectorFilter selectorItem) {
  return Container(
    width: (dWidth / 100) * 45.0,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Center(
      child: Text(
        selectorItem.title,
        style: TextStyle(
            fontSize: 14.0, color: selectorItem.isSelected ? pink : secondary),
      ),
    ),
  );
}
