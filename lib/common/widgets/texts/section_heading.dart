import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/buttons/circle_icon_button.dart';
import 'package:unicons/unicons.dart';

class SSectionHeading extends StatelessWidget {
  const SSectionHeading({
    this.backButton = false,
    super.key,
    this.textColor,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.isHeadline = false,
  });
  final bool backButton;
  final Color? textColor;
  final bool isHeadline;
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (backButton)
          CircleIconButton(
            onPressed: () {
              Get.back();
            },
            borderColor: Colors.transparent,
            icon: UniconsLine.arrow_left,
          ),
        const SizedBox(
          width: 10.0,
        ),
        Padding(
          padding: padding,
          child: Text(
            title,
            style: isHeadline
                ? Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: textColor)
                : Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
