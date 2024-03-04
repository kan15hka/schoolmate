import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/buttons/circle_icon_button.dart';
import 'package:schoolmate/common/widgets/card/profile_container_card.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/screens/settings/settings_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/image_strings.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

import 'package:unicons/unicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //App Bar
          SAppBar(
            leading: CircleIconButton(
              margin: const EdgeInsets.only(left: 25.0),
              onPressed: () {
                Get.back();
              },
              icon: UniconsLine.arrow_left,
            ),
            leadingWidth: 65.0,
            title: "Settings",
            backgroundColor: SColors.primary,
          ),
          //Profile View
          SProfileContainerCard(
            child: Column(
              children: [
                //Settings Lottie
                Lottie.asset(SImages.settings),

                SettingsCard(
                    icon: MdiIcons.accountConvertOutline,
                    iconSize: 25.0,
                    title: "Swicth Account"),
                SettingsCard(
                    icon: MdiIcons.accountArrowRightOutline,
                    iconSize: 25.0,
                    title: "Logout"),
                //Play Store
                const SSectionHeading(
                  title: "Play Store",
                  padding: EdgeInsets.all(SSizes.sm),
                ),
                SettingsCard(
                    icon: MdiIcons.update,
                    iconSize: 25.0,
                    title: "Check Updates"),
                SettingsCard(
                    icon: MdiIcons.starHalfFull,
                    iconSize: 25.0,
                    title: "Rate and Review"),
                const SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100.0,
          )
        ]),
      ),
    );
  }
}
