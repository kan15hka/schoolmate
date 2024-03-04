import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class KCircularContainer extends StatelessWidget {
  const KCircularContainer({
    super.key,
    this.height = 400.0,
    this.width = 400.0,
    this.radius = 400.0,
    this.padding = 0.0,
    this.margin,
    this.child,
    this.backgroundColor = SColors.white,
  });
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
