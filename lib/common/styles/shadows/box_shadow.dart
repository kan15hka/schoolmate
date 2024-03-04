import 'package:flutter/material.dart';

class SBoxShadows {
  static List<BoxShadow> getBoxShadow(
      {required double opacity,
      required double offset,
      bool isNeomorph = false,
      required double blurRadius,
      required double spreadRadius}) {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(
            opacity,
          ),
          offset: Offset(offset, offset),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius),
      BoxShadow(
          color: (isNeomorph)
              ? Colors.white.withOpacity(
                  opacity,
                )
              : Colors.black.withOpacity(
                  opacity,
                ),
          offset: Offset(-offset, -offset),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius),
    ];
  }
}
