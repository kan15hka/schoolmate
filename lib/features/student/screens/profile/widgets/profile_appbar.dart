import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/buttons/circle_icon_button.dart';
import 'package:schoolmate/features/pages/screens/school/school.dart';
import 'package:schoolmate/features/pages/screens/settings/settings.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:unicons/unicons.dart';

class SProfileAppBar extends StatelessWidget {
  const SProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SAppBar(
      leadingWidth: 65.0,
      title: "Profile",
      backgroundColor: SColors.primary,
      leading: CircleIconButton(
        margin: const EdgeInsets.only(left: 25.0),
        onPressed: () {
          Get.to(() => const SchoolPage());
        },
        icon: UniconsLine.university,
      ),
      actions: [
        CircleIconButton(
          onPressed: () {
            Get.to(() => const SettingsPage());
          },
          margin: const EdgeInsets.only(right: 25.0),
          icon: UniconsLine.cog,
        ),
      ],
    );
  }
}
