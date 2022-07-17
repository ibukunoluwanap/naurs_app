import 'package:flutter/material.dart';
import 'package:naurs/screens/home/home.dart';
import 'package:naurs/utils/colors.dart';

Widget categoryCard(dWidth, CategoryFilter categoryItem, int index) {
  return Container(
    width: (dWidth / 100) * 40,
    margin: EdgeInsets.only(left: index != 0 ? 5.0 : 10.0, right: 5.0),
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(
      child: Text(
        categoryItem.title,
        style: TextStyle(
            fontSize: 16.0, color: categoryItem.isSelected ? pink : secondary),
      ),
    ),
  );
}
