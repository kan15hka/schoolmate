import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SProfileScreenSimmer extends StatelessWidget {
  const SProfileScreenSimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SShimmerEffect(
          width: 80.0,
          height: 80.0,
          radius: 80.0,
        ),
        SizedBox(
          height: SSizes.sm,
        ),
        SShimmerEffect(width: 100.0),
        SizedBox(
          height: SSizes.sm,
        ),
        SShimmerEffect(width: 50.0),
        SizedBox(
          height: SSizes.sm,
        ),
        Divider(
          thickness: 1.5,
          indent: 15.0,
          endIndent: 15.0,
          color: Color.fromARGB(14, 0, 0, 0),
        ),
        SizedBox(
          height: SSizes.sm,
        ),
        ShimmerUserInfoCard(),
        ShimmerUserInfoCard(),
        ShimmerUserInfoCard(),
        ShimmerUserInfoCard(),
        ShimmerUserInfoCard()
      ],
    );
  }
}

class ShimmerUserInfoCard extends StatelessWidget {
  const ShimmerUserInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.md),
      child: Row(
        children: [
          const SShimmerEffect(
            width: 50.0,
            height: 50.0,
            radius: 50.0,
            horizontalPadding: 10.0,
          ),
          const SizedBox(
            height: SSizes.sm,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SShimmerEffect(width: 75.0),
              const SizedBox(
                height: SSizes.sm,
              ),
              SShimmerEffect(
                  width: SDeviceUtils.getScreenWidth(context) * 0.45),
            ],
          )
        ],
      ),
    );
  }
}
