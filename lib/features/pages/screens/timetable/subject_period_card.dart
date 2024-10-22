import 'package:flutter/material.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class SubjectPeriodCard extends StatelessWidget {
  final String subjectCode;
  final String subjectName;
  final String subjectTeacher;
  final int subjectCount;
  const SubjectPeriodCard({
    super.key,
    required this.subjectCode,
    required this.subjectName,
    required this.subjectTeacher,
    required this.subjectCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: SColors.lightGrey, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Container(
            height: 25.0,
            width: 25.0,
            margin: const EdgeInsets.only(right: 10.0),
            decoration:
                const BoxDecoration(color: SColors.lightGrey, shape: BoxShape.circle),
            child: Center(
              child: Text(
                subjectCount.toString(),
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                subjectCode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14.0, color: Colors.grey),
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
                style: const TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
