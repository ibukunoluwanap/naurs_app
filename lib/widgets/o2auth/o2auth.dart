import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naurs/utils/colors.dart';

Widget o2auth(dWidth, dHeight) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: (dHeight / 100) * 5),
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            width: dWidth,
            height: (dHeight / 100) * 9,
            margin: EdgeInsets.only(right: (dHeight / 100) * .5),
            decoration: BoxDecoration(
                color: secondary.withOpacity(.15),
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(width: 1.0, color: secondary.withOpacity(.5))),
            child: const Icon(
              FontAwesomeIcons.google,
              size: 28,
              color: secondary,
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            width: dWidth,
            height: (dHeight / 100) * 9,
            margin: EdgeInsets.only(left: (dHeight / 100) * .5),
            decoration: BoxDecoration(
                color: secondary.withOpacity(.15),
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(width: 1.0, color: secondary.withOpacity(.5))),
            child: const Icon(
              FontAwesomeIcons.apple,
              size: 28,
              color: secondary,
            ),
          ),
        ))
      ],
    )),
  );
}
