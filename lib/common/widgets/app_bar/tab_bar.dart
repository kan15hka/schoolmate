import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/text_strings.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class STabBar extends StatelessWidget {
  const STabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });
  final TabController tabController;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50.0,
          width: SDeviceUtils.getScreenWidth(context) * 0.95,
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            unselectedLabelColor: Colors.white.withAlpha(150),
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontFamily: STexts.fontFamily,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
                fontSize: 15.0,
                color: SColors.primary,
                fontFamily: STexts.fontFamily),
            controller: tabController,
            isScrollable: false,
            labelColor: Colors.white,
            indicatorPadding: EdgeInsets.zero,
            indicatorColor: SColors.primary,
            indicatorSize: TabBarIndicatorSize.label,
            padding: EdgeInsets.zero,
            tabs: tabs,
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: 0.75,
          width: SDeviceUtils.getScreenWidth(context),
        )
      ],
    );
  }
}
