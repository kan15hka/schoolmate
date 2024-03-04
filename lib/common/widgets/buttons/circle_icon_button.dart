import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key,
      this.boxHieght = 40.0,
      this.boxWidth = 40.0,
      this.borderColor = const Color.fromARGB(87, 255, 255, 255),
      this.margin = const EdgeInsets.symmetric(horizontal: 5.0),
      required this.icon,
      required this.onPressed,
      this.color = const Color.fromARGB(255, 58, 195, 207),
      this.borderRadius = 7.5});

  final double boxWidth;
  final double boxHieght;
  final double borderRadius;
  final IconData icon;
  final Color borderColor;
  final EdgeInsets margin;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: boxHieght,
          width: boxWidth,
          margin: margin,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Center(
              child: Icon(
            icon,
            color: SColors.white,
          ))),
    );
  }
}
