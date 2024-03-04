import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolmate/common/widgets/graph/graph.dart';
import 'package:schoolmate/common/widgets/texts/section_heading.dart';
import 'package:schoolmate/utils/constants/colors.dart';
import 'package:schoolmate/utils/device/device_utility.dart';

class SPerformance extends StatelessWidget {
  final String subjectName;
  const SPerformance({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final width = SDeviceUtils.getScreenWidth(context);
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 15.0,
        ),
        //GRAPH
        SGraph(
          points: [
            DotPoint(x: 0, y: 25, xTitle: "T1"),
            DotPoint(x: 1, y: 60, xTitle: "T2"),
            DotPoint(x: 2, y: 75, xTitle: "T3"),
            DotPoint(x: 3, y: 40, xTitle: "T4"),
            DotPoint(x: 4, y: 55, xTitle: "T5"),
          ],
        ),
        //CONTENT

        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Column(
            children: [
              //over performance Text
              SSectionHeading(
                title: 'Overall ${subjectName} Performance',
                isHeadline: false,
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              //Average percentage
              Container(
                height: 50.0,
                width: width! * 0.88,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    SColors.primary,
                    SColors.primary.withOpacity(0.5)
                  ]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Average Percentage: ',
                      textScaleFactor: 1.0,
                    ),
                    Text(
                      '94%',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              //All tests
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 50.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.1, vertical: 7.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 7.5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 250, 250),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: SColors.primary, shape: BoxShape.circle),
                            margin: const EdgeInsets.only(right: 7.5),
                            width: 50.0,
                            height: 50.0,
                            child: const Center(
                              child: Text(
                                "92%",
                                style: TextStyle(
                                    color: SColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat.yMMMd().format(DateTime.now()),
                                ),
                                const Text(
                                  "Integral Calculus Test",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  "92/100",
                                  style: TextStyle(
                                      color: SColors.primary,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ]),
    );
  }
}
