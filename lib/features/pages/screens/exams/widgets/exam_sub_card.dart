import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';

class ExamSubjectCard extends StatelessWidget {
  final String subjectCode;
  final String subjectName;
  final String subjectTeacher;
  final int index;
  final String examTitle;
  final String syllabus;
  final String examDateTime;
  const ExamSubjectCard({
    super.key,
    required this.subjectCode,
    required this.subjectName,
    required this.subjectTeacher,
    required this.index,
    required this.examDateTime,
    required this.syllabus,
    required this.examTitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorIndex =
        SHelperFunctions.getColorIndex(index, SColors.listColors.length);
    final secondaryColor = SColors.listColors[colorIndex]["secondary"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            examDateTime,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black, width: 1.5)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                        color: SColors.primary, shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        "",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subjectCode,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child: Text(
                              subjectName,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            subjectTeacher,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.grey),
                          ),
                        ]),
                  ),
                  Icon(MdiIcons.chevronRight)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Syllabus",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    syllabus,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15.0, color: Color.fromARGB(255, 58, 58, 58)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
