import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class SPieInformation extends StatelessWidget {
  const SPieInformation({
    super.key,
    required this.workingDays,
    required this.presentDays,
  });

  final int workingDays, presentDays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Row(
              children: [
                Text(
                  "Attendence Information",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 120.0,
                width: 120.0,
                child: PieChart(
                    swapAnimationDuration: const Duration(milliseconds: 500),
                    swapAnimationCurve: Curves.easeInOutQuint,
                    PieChartData(sections: [
                      PieChartSectionData(
                        radius: 45,
                        badgeWidget: Text(
                          "${(workingDays - presentDays) / workingDays}%",
                          style: const TextStyle(
                              color: SColors.absent,
                              fontWeight: FontWeight.bold),
                        ),
                        showTitle: false,
                        value: (workingDays - presentDays).toDouble(),
                        color: const Color.fromARGB(255, 255, 174, 182),
                      ),
                      PieChartSectionData(
                        radius: 45,
                        badgeWidget: Text(
                          "${presentDays / workingDays}%",
                          style: const TextStyle(
                              color: SColors.present,
                              fontWeight: FontWeight.bold),
                        ),
                        showTitle: false,
                        value: presentDays.toDouble(),
                        color: const Color.fromARGB(255, 129, 252, 184),
                      ),
                    ])),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  attendanceText(presentDays.toDouble(), "Days of Presence",
                      false, SColors.present),
                  attendanceText((workingDays - presentDays).toDouble(),
                      "Days of Absence", false, SColors.absent),
                  attendanceText((presentDays / workingDays).toDouble() * 100,
                      "Attendance Percentage", true, SColors.holiday)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget attendanceText(double number, String text, bool isPercent, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.only(right: 2.5),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(2.5)),
            ),
            Text(
              (isPercent) ? "$number%" : "${number.toInt()}",
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(fontSize: 15.0, color: Colors.grey),
        )
      ],
    ),
  );
}
