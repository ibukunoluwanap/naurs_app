import 'package:flutter/material.dart';
import 'package:naurs/models/category.dart';
import 'package:naurs/utils/colors.dart';

Widget categoryCard(double dWidth, CategoryFilter category, int index) {
  return Container(
    width: (dWidth / 100) * 40,
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Text(
        category.title,
        style: TextStyle(
            fontSize: 16.0, color: category.isSelected ? pink : secondary),
      ),
    ),
  );
}
