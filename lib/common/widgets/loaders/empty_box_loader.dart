import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/image_strings.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class EmptyBoxMessageLoader extends StatelessWidget {
  const EmptyBoxMessageLoader({
    super.key,
    this.title = "Empty Box!",
    required this.content,
    this.lottieImage = SImages.emptyBox,
  });
  final String title;
  final String content;
  final String lottieImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SDeviceUtils.getScreenHeight() * 0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
        child: Column(
          children: [
            Lottie.asset(lottieImage,
                width: MediaQuery.of(context).size.width * 0.8),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: SColors.darkGrey),
            )
          ],
        ),
      ),
    );
  }
}
