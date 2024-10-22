import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:schoolmate/common/widgets/buttons/circle_icon_button.dart';
import 'package:schoolmate/common/widgets/image/circular_image.dart';
import 'package:schoolmate/common/widgets/shimmers/shimmer.dart';
import 'package:schoolmate/features/student/controllers/student_controller.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/image_strings.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:unicons/unicons.dart';

class SHomeAppBarCard extends StatelessWidget {
  const SHomeAppBarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final studentController = StudentController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () {
                if (studentController.isLoading.value) {
                  return const SShimmerEffect(
                    width: 50.0,
                    height: 50.0,
                    radius: 60.0,
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: SColors.white.withOpacity(0.5)),
                    child: SCircularImage(
                        image: (studentController.student.value.image == "")
                            ? SImages.user
                            : studentController.student.value.image),
                  );
                }
              },
            ),
            const SizedBox(width: SSizes.sm),
            SizedBox(
              width: SDeviceUtils.getScreenWidth(context) * 0.4,
              child: Obx(
                () {
                  if (studentController.isLoading.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SShimmerEffect(
                          width: 75.0,
                        ),
                        const SizedBox(
                          height: SSizes.sm,
                        ),
                        SShimmerEffect(
                          width: SDeviceUtils.getScreenWidth(context) * 0.35,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: SColors.white),
                        ),
                        Text(
                          studentController.student.value.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: SColors.white),
                        ),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
        //Icons
        Row(
          children: [
            CircleIconButton(
              onPressed: () {},
              icon: UniconsLine.bell,
            ),
            CircleIconButton(
              onPressed: () {},
              icon: UniconsLine.user_plus,
            ),
          ],
        ),
      ],
    );
  }
}
