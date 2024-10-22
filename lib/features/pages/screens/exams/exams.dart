import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/common/widgets/shimmers/calender_screen_shimmer.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/controller/exams_controller.dart';
import 'package:schoolmate/features/pages/screens/exams/widgets/exam_tile.dart';
import 'package:schoolmate/features/pages/screens/exams/widgets/exam_tt_builder.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamsController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: "Exams",
                isHeadline: true,
                backButton: true,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const CalenderScreenShimmer();
              } else {
                final examList = controller.examsJsonList;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 50.0),
                    itemCount: examList.length,
                    itemBuilder: (context, index) {
                      String examTitle =
                          examList[index]["examTitle"].toString();
                      DateTime startDate = examList[index]["startDate"];
                      DateTime endDate = examList[index]["endDate"];
                      String examStatus =
                          examList[index]["examStatus"].toString();
                      bool isFirst = examList[index]["isFirst"];
                      List<Map<String, dynamic>> subjectList =
                          examList[index]["subjectList"];
                      String examDateRange =
                          "${DateFormat('MMM d, yyyy').format(startDate)} - ${DateFormat('MMM d, yyyy').format(endDate)}";
                      String totalSubjects = "${subjectList.length} subjects";
                      return Column(
                        children: [
                          //if first exam in category
                          if (isFirst)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 12.5),
                              child: Row(
                                children: [
                                  Text(examStatus,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ],
                              ),
                            ),
                          //Exam tile
                          ExamTile(
                            isUpcoming: examStatus == "Upcoming Exams",
                            index: index,
                            examTitle: examTitle,
                            examDateRange: examDateRange,
                            totalSubjects: totalSubjects,
                            onSyllabusTapped: () =>
                                Get.to(() => ExamTimeTableBuilder(
                                      examSubjectsList: subjectList,
                                      examTitle: examTitle,
                                    )),
                            onPerformanceTapped: () {},
                          )
                        ],
                      );
                    });
              }
            }),
          ],
        ),
      )),
    );
  }
}
