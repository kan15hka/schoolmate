import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/styles/calender/calender_styles.dart';
import 'package:schoolmate/common/widgets/app_bar/app_bar.dart';
import 'package:schoolmate/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:schoolmate/common/widgets/shimmers/calender_screen_shimmer.dart';
import 'package:schoolmate/features/student/controllers/calender_controller.dart';
import 'package:schoolmate/features/student/screens/calendar/widgets/color_meaning.dart';
import 'package:schoolmate/features/student/screens/calendar/widgets/selected_event.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CalenderController.instance;
    return Scaffold(
      backgroundColor: SColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //App Bar
            const SAppBar(
              title: "Calender",
              toolbarHeight: 60.0,
              showBackArrow: false,
              backgroundColor: SColors.primary,
            ),

            //Calender
            Column(
              children: [
                TCurvedEdgesWidget(
                  child: Container(
                    decoration: const BoxDecoration(color: SColors.primary),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const CalenderScreenShimmer(
                          isSub: false,
                        );
                      } else {
                        return Column(
                          children: [
                            TableCalendar(
                                eventLoader: controller.getEventsDay,
                                focusedDay: controller.focusedDay.value,
                                firstDay: SCalenderStyles().firstDay,
                                lastDay: SCalenderStyles().lastDay,
                                calendarFormat: CalendarFormat.month,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                selectedDayPredicate: (day) {
                                  return isSameDay(
                                      controller.selectedDay.value, day);
                                },
                                holidayPredicate: (day) {
                                  return day.weekday >= 7;
                                },
                                onDaySelected: controller.onDaySelected,
                                calendarBuilders: const CalendarBuilders(
                                  //MARKER BUILDER
                                  markerBuilder: SCalenderStyles
                                      .eventsCalenderMarkerBuilder,
                                ),
                                daysOfWeekStyle:
                                    SCalenderStyles.getDaysOfWeekStyle(),
                                calendarStyle:
                                    SCalenderStyles.getCalenderStyle(),
                                headerStyle: SCalenderStyles.getHeaderStyle()),
                            const SizedBox(
                              height: 30.0,
                            )
                          ],
                        );
                      }
                    }),
                  ),
                ),
                //COLOR REPRESENTAIONS
                Obx(() {
                  if (controller.isLoading.value) {
                    return const CalenderScreenShimmer(
                      isCalender: false,
                    );
                  } else {
                    return Column(
                      children: [
                        const ColorMeaning(),
                        SelectedEvents(
                            selectedEventsList: controller.selectedDayEvents,
                            selectedDay: controller.selectedDay.value,
                            onEventSelected: controller.onEventSelected.value),
                      ],
                    );
                  }
                })
              ],
            )

            //SELECTED DAY EVENTS
          ],
        ),
      ),
    );
  }
}
