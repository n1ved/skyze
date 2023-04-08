import 'package:flutter/material.dart';
import 'color.dart';

BoxDecoration weatherBoxDecoration() {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(15.0),
  );
}

const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(15.0);
TextStyle pollutionTextStyle = TextStyle(fontSize: 14.0, color: textColor);
