import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class ColorMeaning extends StatelessWidget {
  const ColorMeaning({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          colorText(SColors.important, "Important", context),
          colorText(SColors.holiday, "Holiday", context),
          colorText(SColors.occasion, "Occasion", context)
        ],
      ),
    );
  }
}

Widget colorText(Color color, String text, BuildContext context) {
  return Row(
    children: [
      Container(
        height: 10.0,
        width: 10.0,
        margin: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Text(text, style: Theme.of(context).textTheme.labelMedium)
    ],
  );
}
