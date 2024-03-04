import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class MessageNotifScreenShimmer extends StatelessWidget {
  const MessageNotifScreenShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          SShimmerEffect(width: SDeviceUtils.getScreenWidth(context) * 0.3),
          const SizedBox(
            height: 25.0,
          ),
          const CircularCardWidget(),
          const SizedBox(
            height: 15.0,
          ),
          const CircularCardWidget(),
          const SizedBox(
            height: 25.0,
          ),
          SShimmerEffect(width: SDeviceUtils.getScreenWidth(context) * 0.3),
          const SizedBox(
            height: 25.0,
          ),
          const CircularCardWidget(),
          const SizedBox(
            height: 15.0,
          ),
          const CircularCardWidget()
        ],
      ),
    );
  }
}

class CircularCardWidget extends StatelessWidget {
  const CircularCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: SShimmerEffect(
            width: 40.0,
            height: 40.0,
            radius: 50.0,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SShimmerEffect(width: SDeviceUtils.getScreenWidth(context) * 0.45),
            const SizedBox(
              height: 10.0,
            ),
            SShimmerEffect(
              width: SDeviceUtils.getScreenWidth(context) * 0.725,
              height: 75,
            ),
            const SizedBox(
              height: 10.0,
            ),
            SShimmerEffect(width: SDeviceUtils.getScreenWidth(context) * 0.25),
          ],
        ),
      ],
    );
  }
}
