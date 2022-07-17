import 'package:flutter/material.dart';
import 'package:naurs/utils/colors.dart';

InputDecoration input(
    {required String labelText,
    String? hintText,
    IconData? suffixIcon,
    suffixIconOnTap}) {
  return InputDecoration(
    prefixIconColor: secondary,
    suffixIcon: GestureDetector(
      onTap: suffixIconOnTap,
      child: Icon(
        suffixIcon,
        size: 18,
        color: secondary,
      ),
    ),
    filled: true,
    fillColor: secondary.withOpacity(.05),
    focusColor: secondary,
    hoverColor: secondary,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: secondary.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondary.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondary.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(color: secondary.withOpacity(.5), fontSize: 14),
    hintStyle: TextStyle(color: secondary.withOpacity(.5), fontSize: 14),
    contentPadding: const EdgeInsets.fromLTRB(18.0, 18.0, 0.0, 18.0),
  );
}
