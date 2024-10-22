import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/buttons/combo_buttons.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';
import 'package:schoolmate/utils/helpers/helper_functions.dart';
import 'package:unicons/unicons.dart';

class ExamTile extends StatelessWidget {
  const ExamTile({
    super.key,
    required this.examTitle,
    required this.examDateRange,
    required this.totalSubjects,
    required this.index,
    required this.isUpcoming,
    this.onSyllabusTapped,
    this.onPerformanceTapped,
  });
  final String examDateRange;
  final String examTitle;
  final String totalSubjects;
  final int index;
  final bool isUpcoming;
  final VoidCallback? onSyllabusTapped;
  final VoidCallback? onPerformanceTapped;

  @override
  Widget build(BuildContext context) {
    final colorIndex =
        SHelperFunctions.getColorIndex(index, SColors.listColors.length);
    final secondaryColor = SColors.listColors[colorIndex]["secondary"];
    final primaryColor = SColors.listColors[colorIndex]["primary"];

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SDeviceUtils.getScreenWidth(context) * 0.075,
          vertical: 7.5),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: SColors.white.withOpacity(0.5)),
                child: Icon(
                  UniconsLine.notebooks,
                  size: 20.0,
                  color: primaryColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(examDateRange,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      examTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      totalSubjects,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          SComboButtons(
            onButtonLeftTapped: onSyllabusTapped,
            onButtonRightTapped: onPerformanceTapped,
            isButtonText: true,
            isRightButton: !isUpcoming,
            buttonColor: primaryColor!.withOpacity(0.5),
            buttonIconColor: SColors.black,
          )
        ],
      ),
    );
  }
}
