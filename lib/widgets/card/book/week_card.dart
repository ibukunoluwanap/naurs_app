import 'package:flutter/material.dart';
import 'package:naurs/models/week.dart';
import 'package:naurs/utils/colors.dart';

Widget weekCard(double dWidth, WeekFilter weekItem) {
  return Container(
    width: (dWidth / 100) * 20.0,
    decoration: BoxDecoration(
      color: grey,
      border:
          Border.all(color: weekItem.isSelected ? pink : Colors.transparent),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Center(
      child: Text(
        weekItem.title,
        style: TextStyle(
            fontSize: 14.0, color: weekItem.isSelected ? pink : darkGrey),
      ),
    ),
  );
}
