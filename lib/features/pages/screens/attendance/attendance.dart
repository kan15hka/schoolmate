import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/styles/calender/calender_styles.dart';
import 'package:schoolmate/common/widgets/shimmers/calender_screen_shimmer.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/controller/attendance_controller.dart';
import 'package:schoolmate/features/pages/screens/attendance/pie_information.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AttendanceController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: "Attendance",
                isHeadline: true,
                backButton: true,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const CalenderScreenShimmer();
              } else {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: SColors.white,
                          border: Border.all(
                              color: SColors.primaryDark, width: 1.5),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TableCalendar(
                          eventLoader: controller.getEventsDay,
                          focusedDay: controller.focusedDay.value,
                          firstDay: SCalenderStyles().firstDay,
                          lastDay: SCalenderStyles().lastDay,
                          calendarFormat: CalendarFormat.month,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          selectedDayPredicate: (day) {
                            return isSameDay(controller.selectedDay.value, day);
                          },
                          holidayPredicate: (day) {
                            return day.weekday >= 7;
                          },
                          onDaySelected: controller.onDaySelected,
                          calendarBuilders: CalendarBuilders(
                              markerBuilder: controller.markerBuilder),
                          daysOfWeekStyle: SCalenderStyles.getDaysOfWeekStyle(
                              isPrimary: false),
                          calendarStyle: SCalenderStyles.getCalenderStyle(
                              isPrimary: false,
                              selectedColor: controller.selectedColor.value),
                          headerStyle:
                              SCalenderStyles.getHeaderStyle(isPrimary: false)),
                    ),
                    SPieInformation(
                      workingDays: controller.overallWorkingDays.value,
                      presentDays: controller.overallPresentDays.value,
                    )
                  ],
                );
              }
            }),
          ],
        ),
      )),
    );
  }
}
