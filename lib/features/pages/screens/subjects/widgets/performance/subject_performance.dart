import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/app_bar/performance_tab_bar.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/controller/subjects_controller.dart';
import 'package:schoolmate/features/pages/screens/subjects/widgets/performance/performance.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SSubjectPerformance extends StatelessWidget {
  const SSubjectPerformance({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    final width = SDeviceUtils.getScreenWidth(context);
    final controller = SubjectsController.instance;

    return Scaffold(
      backgroundColor: SColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            //Headingand Back button
            Padding(
              padding: const EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: name,
                textColor: SColors.white,
                isHeadline: true,
                backButton: true,
              ),
            ),
            //Tab Bar
            SPerfrmanceTabBar(
                tabController: controller.tabController,
                tabs: controller.tabTexts
                    .map((tabText) => tabBarTab(tabText, width * 0.25))
                    .toList()),
            //TabBarView
            Flexible(
              fit: FlexFit.tight,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  SPerformance(
                    subjectName: name,
                  ),
                  SPerformance(
                    subjectName: name,
                  ),
                  SPerformance(
                    subjectName: name,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tabBarTab(String text, double width) {
  return Tab(
      child: SizedBox(
    width: width,
    child: Center(
      child: Text(
        text,
      ),
    ),
  ));
}
