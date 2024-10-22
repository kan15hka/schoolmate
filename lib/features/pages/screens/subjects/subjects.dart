import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/features/pages/controller/subjects_controller.dart';
import 'package:schoolmate/features/pages/screens/subjects/widgets/performance/subject_performance.dart';
import 'package:schoolmate/features/pages/screens/subjects/widgets/subject_card.dart';
import 'package:schoolmate/features/pages/screens/subjects/widgets/syllabus/syllabus.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';

class SubjetcsPage extends StatelessWidget {
  const SubjetcsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubjectsController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(SSizes.h10),
                child: SSectionHeading(
                  title: "Subjects",
                  isHeadline: true,
                  backButton: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "Tap on Subjects to view syllabus and performance",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 100.0),
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150.0,
                    ),
                    itemBuilder: (context, index) {
                      final list = [
                        "English",
                        "Tamil",
                        "Mathematics",
                        "Science",
                        "Social Science"
                      ];
                      Color color = SColors.accentListColors[index];
                      return SSubjectCard(
                        color: color,
                        name: list[index],
                        onPerformanceTapped: () => Get.to(
                            () => SSubjectPerformance(name: list[index])),
                        onSyllabusTapped: () =>
                            Get.to(() => SSyllabus(name: list[index])),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
