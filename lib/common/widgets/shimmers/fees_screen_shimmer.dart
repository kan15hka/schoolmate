import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class FeesScreenShimmer extends StatelessWidget {
  const FeesScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = SDeviceUtils.getScreenWidth(context);
    return Container(
      width: width,
      color: SColors.softGrey,
      padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SShimmerEffect(
            width: width * 0.4,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          SShimmerEffect(
            width: width * 0.8,
            height: 175.0,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          SShimmerEffect(
            width: width * 0.4,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          SShimmerEffect(
            width: width * 0.8,
            height: 175.0,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          SShimmerEffect(
            width: width * 0.8,
            height: 175.0,
          ),
        ],
      ),
    );
  }
}
