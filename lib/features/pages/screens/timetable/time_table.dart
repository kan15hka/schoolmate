import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/app_bar/tab_bar.dart';
import 'package:schoolmate/features/pages/controller/timetable_controller.dart';
import 'package:schoolmate/features/pages/models/time_table_model.dart';
import 'package:schoolmate/features/pages/screens/timetable/tt_builder.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetableController = Get.put(TimeTableController());
    return Scaffold(
      backgroundColor: SColors.primary,
      body: Column(
        children: [
          //App Bar
          const SAppBar(
            toolbarHeight: 50,
            title: "Time Table",
            showBackArrow: false,
            backgroundColor: SColors.primary,
          ),

          STabBar(
            tabController: timetableController.tabController,
            tabs: timetableController.tabs,
          ),

          //TAB BAR VIEW
          Expanded(
            child: Container(
              width: SDeviceUtils.getScreenWidth(context),
              color: SColors.white,
              child: TabBarView(
                controller: timetableController.tabController,
                children: timetableList.map(
                  (dayTimeTable) {
                    return TimeTableBuilder(dayTimetableList: dayTimeTable);
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
