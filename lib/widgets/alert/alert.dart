import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:naurs/utils/colors.dart';

void alert(BuildContext context,
    {required String type, required String message}) {
  Flushbar(
    message: message,
    messageColor: type == "error"
        ? redText
        : type == "success"
            ? greenText
            : type == "warning"
                ? yellowText
                : lightBlueText,
    backgroundColor: type == "error"
        ? red
        : type == "success"
            ? green
            : type == "warning"
                ? yellow
                : lightBlue,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 4),
        blurRadius: 6,
        spreadRadius: -3,
      )
    ],
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    borderRadius: BorderRadius.circular(5.0),
    duration: const Duration(seconds: 4),
  ).show(context);
}
