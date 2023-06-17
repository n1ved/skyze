import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../color.dart';

SnackBar roundedSnackBar(
    {required String contentString, required bool loading}) {
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: backgroundColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loading
              ? LoadingAnimationWidget.halfTriangleDot(
                  color: textColor,
                  size: 16,
                )
              : const SizedBox(),
          loading ? const SizedBox(width: 5) : const SizedBox(),
          Text(
            contentString,
            style: TextStyle(color: textColor),
          ),
        ],
      ));
}
