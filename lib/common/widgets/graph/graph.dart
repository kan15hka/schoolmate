import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:schoolmate/common/widgets/graph/dotpoint_model.dart';
import 'package:schoolmate/common/widgets/graph/graph_controller.dart';
import 'package:schoolmate/common/widgets/graph/helper.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class SGraph extends StatelessWidget {
  final List<DotPoint> points;
  const SGraph({super.key, required this.points});
  //PerformanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final graphController = Get.put(GraphController());
    final helper = SGraphHelper(points: points);

    //get first element(single bar) od lines bardata list

    final tooltipsOnBar = helper.lineBarsData[0];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Obx(
          () => LineChart(LineChartData(
            showingTooltipIndicators:
                graphController.showingTooltipOnSpots.map((index) {
              return ShowingTooltipIndicators([
                LineBarSpot(
                  tooltipsOnBar,
                  helper.lineBarsData.indexOf(tooltipsOnBar),
                  tooltipsOnBar.spots[index],
                ),
              ]);
            }).toList(),
            lineTouchData: LineTouchData(
              enabled: true,
              handleBuiltInTouches: false,
              touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                if (response == null || response.lineBarSpots == null) {
                  return;
                }
                if (event is FlTapUpEvent) {
                  final spotIndex = response.lineBarSpots!.first.spotIndex;
                  graphController.showingTooltipOnSpots.clear();
                  graphController.showingTooltipOnSpots.add(spotIndex);
                }
              },
              mouseCursorResolver:
                  (FlTouchEvent event, LineTouchResponse? response) {
                if (response == null || response.lineBarSpots == null) {
                  return SystemMouseCursors.basic;
                }
                return SystemMouseCursors.click;
              },
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> indicators) {
                return indicators.map(
                  (int index) {
                    final line = FlLine(
                      color: const Color.fromARGB(111, 255, 255, 255),
                      strokeWidth: 2,
                    );
                    return TouchedSpotIndicatorData(
                      line,
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                                strokeColor: SColors.white,
                                strokeWidth: 0.0,
                                radius: 5,
                                color: SColors.secondary),
                      ),
                    );
                  },
                ).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: const Color.fromARGB(0, 28, 180, 194),
                tooltipRoundedRadius: 20.0,
                fitInsideHorizontally: true,
                getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                  return lineBarsSpot.map((lineBarSpot) {
                    return LineTooltipItem(
                      "${lineBarSpot.y.toDouble()}%",
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            minX: 0,
            maxX: points.length.toDouble() - 1,
            minY: 0,
            maxY: 100,
            lineBarsData: helper.lineBarsData,
            titlesData: helper.titlesData,
            gridData: helper.gridData,
            borderData: helper.borderData,
          )),
        ),
      ),
    );
  }
}
