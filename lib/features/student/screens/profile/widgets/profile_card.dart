import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:schoolmate/common/widgets/card/profile_container_card.dart';
import 'package:schoolmate/common/widgets/image/circular_image.dart';
import 'package:schoolmate/common/widgets/shimmers/profile_screen_shimmer.dart';
import 'package:schoolmate/features/student/controllers/student_controller.dart';
import 'package:schoolmate/features/student/screens/profile/widgets/user_info_section.dart';
import 'package:schoolmate/utils/constants/image_strings.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/formatters/formatter.dart';

class SProfileCard extends StatelessWidget {
  const SProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final studentController = StudentController.instance;
    final user = studentController.student.value;
    return SProfileContainerCard(
      child: Obx(() {
        if (studentController.isLoading.value) {
          return const SProfileScreenSimmer();
        } else {
          return Column(
            children: [
              //Profile Image
              SCircularImage(
                  height: 80.0,
                  width: 80.0,
                  isNetworkImage: (studentController.student.value.image == "")
                      ? false
                      : true,
                  image: (studentController.student.value.image == "")
                      ? SImages.user
                      : studentController.student.value.image),
              const SizedBox(
                height: SSizes.sm,
              ),
              Text(
                user.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                  "${SFormatter.intToRoman(user.standard)}-${user.section.toUpperCase()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium),

              UserInfoSection(
                user: user,
              ),
            ],
          );
        }
      }),
    );
  }
}
