import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/buttons/circle_icon_button.dart';
import 'package:schoolmate/common/widgets/card/profile_container_card.dart';
import 'package:schoolmate/common/widgets/image/circular_image.dart';
import 'package:schoolmate/features/student/screens/profile/widgets/user_info_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

import 'package:unicons/unicons.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = SDeviceUtils.getScreenWidth(context);
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
            title: "<school.name>",
            backgroundColor: SColors.primary,
          ),
          //Profile View
          SProfileContainerCard(
            child: Column(
              children: [
                const SizedBox(
                  height: SSizes.sm,
                ),
                SCircularImage(
                  height: 150.0,
                  width: width * 0.75,
                  radius: 15.0,
                  isNetworkImage: true,
                  image:
                      'https://img.pikbest.com/background/20180829/blue-cartoon-school-season-classroom-background-design_2745940.jpg!bw700',
                  // isNetworkImage: (studentController.user.value.image == "")
                  //     ? false
                  //     : true,
                  // image: (studentController.user.value.image == "")
                  //     ? "assets/images/user.png"
                  //     : studentController.user.value.image,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                UserInfoCard(
                  icon: MdiIcons.phone,
                  iconSize: 25.0,
                  title: "Email",
                  content: "<schoolModel.email>",
                ),
                UserInfoCard(
                  icon: MdiIcons.phone,
                  iconSize: 25.0,
                  title: "Phone",
                  content: "894561237\n789456136",
                  isCardSizeVariable: true,
                ),
                UserInfoCard(
                  icon: MdiIcons.mapMarker,
                  iconSize: 25.0,
                  title: "Address",
                  content: "<schoolModel.address>",
                  isCardSizeVariable: true,
                ),
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
