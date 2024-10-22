import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/screens/exams/widgets/exam_sub_card.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

import 'package:timeline_tile/timeline_tile.dart';

class ExamTimeTableBuilder extends StatelessWidget {
  final List<Map<String, dynamic>> examSubjectsList;
  final String examTitle;
  const ExamTimeTableBuilder(
      {super.key, required this.examSubjectsList, required this.examTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(SSizes.h10),
                child: SSectionHeading(
                  title: "Exam TimeTable",
                  isHeadline: true,
                  backButton: true,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                child: Row(
                  children: [
                    Icon(MdiIcons.checkDecagram),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      examTitle,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.only(bottom: 55.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: examSubjectsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TimelineTile(
                        alignment: TimelineAlign.start,
                        //lineXY: 0.5,
                        isFirst: (index == 0) ? true : false,
                        isLast: (index == examSubjectsList.length - 1)
                            ? true
                            : false,
                        hasIndicator: true,
                        beforeLineStyle: const LineStyle(
                            color: Colors.black, thickness: 1.5),
                        afterLineStyle: const LineStyle(
                            color: Colors.black, thickness: 1.5),
                        indicatorStyle: IndicatorStyle(
                          height: 25.0,
                          width: 25.0,
                          indicator: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 204, 251, 255),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    color: SColors.primary,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                        //Start child

                        endChild: ExamSubjectCard(
                          subjectCode:
                              examSubjectsList[index]["subjectCode"].toString(),
                          subjectName:
                              examSubjectsList[index]["subjectName"].toString(),
                          syllabus: examSubjectsList[index]["syllabus"],
                          subjectTeacher: examSubjectsList[index]
                                  ["subjectTeacher"]
                              .toString(),
                          examTitle: examTitle,
                          index: index,
                          examDateTime: DateFormat('dd-MM-yyyy')
                              .format(examSubjectsList[index]["examDateTime"]),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
