import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';
import 'package:table_calendar/table_calendar.dart';

class SCalenderStyles {
  DateTime firstDay = DateTime.now().subtract(const Duration(days: 365));
  DateTime lastDay = DateTime.now().add(const Duration(days: 365));

  static Widget? eventsCalenderMarkerBuilder(
      BuildContext context, date, events) {
    if (events.isEmpty) return const SizedBox();
    Color markerColor = Colors.black;
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> event = events[index] as Map<String, dynamic>;
          String eventStatus = event["status"];

          markerColor =
              SHelperFunctions.getEventStatusColor(status: eventStatus);
          return Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(1),
            child: Container(
              width: 6,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: markerColor),
            ),
          );
        });
  }

  static CalendarStyle getCalenderStyle(
      {bool isPrimary = true, Color selectedColor = Colors.white}) {
    final textcolor = isPrimary ? Colors.white : Colors.black;
    return CalendarStyle(
      defaultTextStyle: TextStyle(color: textcolor),
      outsideDaysVisible: false,
      weekendTextStyle: TextStyle(color: textcolor),
      markersAlignment: Alignment.center,
      holidayTextStyle: TextStyle(color: textcolor),
      selectedTextStyle:
          TextStyle(color: isPrimary ? SColors.primaryDark : Colors.white),
      selectedDecoration:
          BoxDecoration(color: selectedColor, shape: BoxShape.circle),
      holidayDecoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: SColors.primaryDark, width: 1.4)),
          shape: BoxShape.circle),
      todayDecoration: BoxDecoration(
        color: SColors.primaryDark,
        shape: BoxShape.circle,
      ),
    );
  }

  static HeaderStyle getHeaderStyle({bool isPrimary = true}) {
    return HeaderStyle(
        titleTextFormatter: (date, locale) {
          return "${DateFormat.LLLL().format(date)} ${DateFormat.y().format(date).toUpperCase()}";
        },
        titleTextStyle: TextStyle(
            color: isPrimary ? Colors.white : Colors.black,
            fontSize: 17.5,
            fontWeight: FontWeight.bold),
        headerPadding: const EdgeInsets.symmetric(vertical: 5.0),
        leftChevronIcon: chevronWidget(Icons.chevron_left_rounded, isPrimary),
        rightChevronIcon: chevronWidget(Icons.chevron_right_rounded, isPrimary),
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronMargin: const EdgeInsets.all(0.0),
        rightChevronMargin: const EdgeInsets.all(0.0));
  }

  static DaysOfWeekStyle getDaysOfWeekStyle({bool isPrimary = true}) =>
      DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            DateFormat.E().format(date).toUpperCase(),
        weekdayStyle: TextStyle(
            color: isPrimary ? SColors.primaryDarker : Colors.black,
            fontWeight: FontWeight.bold),
        weekendStyle: TextStyle(
            color: isPrimary ? SColors.primaryDark : SColors.darkGrey,
            fontWeight: FontWeight.bold),
      );
}

Widget chevronWidget(IconData icon, bool isPrimary) {
  return Container(
    height: 30.0,
    width: 30.0,
    decoration: BoxDecoration(
        color: isPrimary ? SColors.primaryLight : SColors.white,
        borderRadius: BorderRadius.circular(5)),
    child: Icon(
      icon,
      color: isPrimary ? SColors.white : SColors.black,
    ),
  );
}
