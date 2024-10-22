import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SComboButtons extends StatelessWidget {
  const SComboButtons({
    super.key,
    required this.onButtonLeftTapped,
    required this.onButtonRightTapped,
    this.isLeftButton = true,
    this.isRightButton = true,
    this.buttonColor = const Color.fromARGB(64, 255, 255, 255),
    this.buttonIconColor = Colors.black,
    this.isButtonText = false,
  });

  final VoidCallback? onButtonLeftTapped;
  final VoidCallback? onButtonRightTapped;
  final bool isLeftButton, isRightButton, isButtonText;
  final Color buttonColor, buttonIconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (isLeftButton)
          buttonWidget(
              onTap: onButtonLeftTapped,
              buttonText: "Syllabus",
              icon: Iconsax.book),
        if (isLeftButton && isRightButton)
          const SizedBox(
            width: 10,
          ),
        if (isRightButton)
          buttonWidget(
              onTap: onButtonRightTapped,
              buttonText: "Performance",
              icon: Iconsax.presention_chart)
      ],
    );
  }

  Expanded buttonWidget(
      {required VoidCallback? onTap,
      required String buttonText,
      required IconData icon}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5), color: buttonColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: buttonIconColor,
                ),
                if (isButtonText) ...[
                  const SizedBox(
                    width: 7.5,
                  ),
                  SizedBox(
                    width: 80.0,
                    child: Text(
                      buttonText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]
              ],
            )),
      ),
    );
  }
}
