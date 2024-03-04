import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/features/pages/models/time_table_model.dart';
import 'package:schoolmate/features/pages/screens/timetable/subject_period_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';

import 'package:timeline_tile/timeline_tile.dart';

class TimeTableBuilder extends StatelessWidget {
  final TimeTablModel dayTimetableList;
  const TimeTableBuilder({super.key, required this.dayTimetableList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              physics: const BouncingScrollPhysics(),
              itemCount: dayTimetableList.periodsList.length,
              itemBuilder: (context, index) {
                String periodType =
                    dayTimetableList.periodsList[index].periodType;
                String startTime =
                    dayTimetableList.periodsList[index].startTime;
                String endTime = dayTimetableList.periodsList[index].endTime;
                String subjectCode =
                    dayTimetableList.periodsList[index].subjectCode;
                String subjectName =
                    dayTimetableList.periodsList[index].subjectName;
                String subjectTeacher =
                    dayTimetableList.periodsList[index].subjectTeacher;
                int subjectCount =
                    dayTimetableList.periodsList[index].subjectCount;

                bool isBreak = false;
                String breakStatus = "";
                if (periodType != "period") {
                  isBreak = true;
                  switch (periodType) {
                    case "break":
                      breakStatus = "Snacks Break";
                      break;
                    case "lunch":
                      breakStatus = "Lunch Break";
                      break;
                    case "finish":
                      breakStatus = "School Concludes";
                      break;
                    default:
                      break;
                  }
                }
                //Check the period state
                String periodStatus = "";
                //Start Time
                DateTime startDateTime = DateFormat("h:mm a").parse(startTime);
                double start = startDateTime.hour + startDateTime.minute / 60.0;
                //End Time
                DateTime endDateTime = DateFormat("h:mm a").parse(endTime);
                double end = endDateTime.hour + endDateTime.minute / 60.0;
                //current time
                DateTime currentDate = DateTime.now();
                double current = currentDate.hour + currentDate.minute / 60.0;

                if (current > end) {
                  periodStatus = "past";
                } else if (current >= start && current <= end) {
                  periodStatus = "present";
                } else if (current < start) {
                  periodStatus = "future";
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.25,
                      isFirst: (index == 0) ? true : false,
                      isLast: (index == dayTimetableList.periodsList.length - 1)
                          ? true
                          : false,
                      hasIndicator: true,
                      beforeLineStyle: LineStyle(
                          color: (periodStatus == "future")
                              ? SColors.lightGrey
                              : SColors.darkGrey,
                          thickness: 1.5),
                      afterLineStyle: LineStyle(
                          color: !(periodStatus == "past")
                              ? SColors.lightGrey
                              : SColors.darkGrey,
                          thickness: 1.5),
                      indicatorStyle: IndicatorStyle(
                        height: 25.0,
                        width: 25.0,
                        //Show indicator styleaccording to periodsatus past present and future
                        indicator: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: const BoxDecoration(
                                color: SColors.lightGrey,
                                shape: BoxShape.circle),
                            child: Icon(
                              (periodStatus == "past")
                                  ? MdiIcons.checkDecagram
                                  : (periodStatus == "present")
                                      ? MdiIcons.checkDecagramOutline
                                      : MdiIcons.decagramOutline,
                              size: 18.0,
                              color: SColors.grey,
                            )),
                      ),
                      //Start child
                      startChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: (!isBreak) ? 10.0 : 0.0),
                            child: Text(
                              startTime.substring(0, startTime.length - 3),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //forbrak alignment
                          if (!isBreak) const Spacer()
                        ],
                      ),
                      endChild: (isBreak)
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              child: Text(
                                breakStatus,
                                style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : SubjectPeriodCard(
                              subjectCode: subjectCode,
                              subjectName: subjectName,
                              subjectTeacher: subjectTeacher,
                              subjectCount: subjectCount)),
                );
              }),
        ),
      ],
    );
  }
}
