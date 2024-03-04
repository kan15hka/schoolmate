import 'package:flutter/widgets.dart';
import 'package:schoolmate/common/styles/shadows/box_shadow.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SProfileContainerCard extends StatelessWidget {
  const SProfileContainerCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.white,
      width: SDeviceUtils.getScreenWidth(context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // //Space for elevation
          Container(
            height: 150.0,
            color: SColors.primary,
          ),
          Container(
            width: SDeviceUtils.getScreenWidth(context) * 0.9,
            margin: const EdgeInsets.only(top: SSizes.sm),
            padding: const EdgeInsets.symmetric(
                horizontal: SSizes.spaceBtwItems,
                vertical: SSizes.spaceBtwItems),
            decoration: BoxDecoration(
                color: SColors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: SBoxShadows.getBoxShadow(
                    opacity: 0.05, offset: 4, blurRadius: 5, spreadRadius: 5)),
            child: child,
          ),
        ],
      ),
    );
  }
}
