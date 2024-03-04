import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class CalenderScreenShimmer extends StatelessWidget {
  const CalenderScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace, vertical: 20.0),
      child: Column(
        children: [
          SShimmerEffect(
            width:
                SDeviceUtils.getScreenWidth(context) - 2 * SSizes.defaultSpace,
            height: 300.0,
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SShimmerEffect(
                  width: 200.0,
                ),
                SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                Row(
                  children: [
                    SShimmerEffect(
                      width: 20.0,
                      height: 20.0,
                      radius: 5,
                    ),
                    SizedBox(
                      width: SSizes.spaceBtwItems,
                    ),
                    SShimmerEffect(
                      width: 100.0,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
