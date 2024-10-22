import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/graph/dotpoint_model.dart';
import 'package:schoolmate/common/widgets/graph/graph.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/constants/sizes.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(SSizes.h10),
              child: SSectionHeading(
                title: "Results",
                textColor: SColors.white,
                isHeadline: true,
                backButton: true,
              ),
            ),
            SGraph(
              points: [
                DotPoint(x: 0, y: 25, xTitle: "English"),
                DotPoint(x: 1, y: 60, xTitle: "Tamil"),
                DotPoint(x: 2, y: 75, xTitle: "Maths"),
                DotPoint(x: 3, y: 40, xTitle: "Science"),
                DotPoint(x: 4, y: 55, xTitle: "Social"),
              ],
            ),
            //CONTENT

            Container(
              height: SDeviceUtils.getScreenWidth(context),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
            )
          ]),
        ),
      ),
    );
  }
}
