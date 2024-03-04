import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class DotPoint {
  String xTitle;
  double x;
  double y;
  DotPoint({required this.x, required this.y, required this.xTitle});
}

class SGraph extends StatelessWidget {
  final List<DotPoint> points;
  SGraph({super.key, required this.points});
  //PerformanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      // height: kheight! * 0.4,
      // width: kwidth,
      child: AspectRatio(
        aspectRatio: 1,
        child: LineChart(
            swapAnimationDuration: Duration(milliseconds: 1000), // Optional
            swapAnimationCurve: Curves.linear,
            LineChartData(
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: const Color.fromARGB(0, 28, 180, 194),
                    tooltipRoundedRadius: 20.0,
                    fitInsideHorizontally: true,
                    tooltipMargin: 0,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map(
                        (LineBarSpot touchedSpot) {
                          const textStyle = TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          );
                          return LineTooltipItem(
                            points[touchedSpot.spotIndex].y.toStringAsFixed(2),
                            textStyle,
                          );
                        },
                      ).toList();
                    },
                  ),
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> indicators) {
                    return indicators.map(
                      (int index) {
                        final line = FlLine(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            strokeWidth: 1,
                            dashArray: [5, 5]);
                        return TouchedSpotIndicatorData(
                          line,
                          FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                    strokeWidth: 0.0,
                                    radius: 5,
                                    color: SColors.secondary),
                          ),
                        );
                      },
                    ).toList();
                  },
                ),
                minX: 0,
                maxX: points.length.toDouble() - 1,
                minY: 0,
                maxY: 100,
                titlesData: titlesData,
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                        color: SColors.white.withOpacity(0.1), strokeWidth: 1);
                  },
                  drawVerticalLine: true,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                        color: SColors.white.withOpacity(0.1), strokeWidth: 1);
                  },
                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                        color: SColors.white.withOpacity(0.1), width: 1.5)),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: SColors.primaryDark,
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                            radius: 4,
                            color: SColors.primaryDark,
                            strokeColor: Colors.transparent,
                            strokeWidth: 0.0);
                      },
                      //Show dot
                      checkToShowDot: (spot, barData) {
                        return true;
                      },
                    ),
                    spots: points
                        .map((point) => FlSpot(point.x, point.y))
                        .toList(),
                  ),
                ])),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
          sideTitles: bottomTitles(),
          axisNameWidget: Text(
            'Tests Conducted',
            style: TextStyle(
                color: SColors.white.withOpacity(0.75), fontSize: 15.0),
          )),
      leftTitles: AxisTitles(
          sideTitles: leftTitles(),
          axisNameWidget: Text(
            '                  Total Marks',
            textScaleFactor: 1.0,
            style: TextStyle(
                color: SColors.white.withOpacity(0.75), fontSize: 15.0),
          )));

  SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitlesWidget,
      showTitles: true,
      interval: 1,
      reservedSize: 40.0);

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    var style = TextStyle(
        color: SColors.white.withOpacity(0.9),
        fontSize: 15.0,
        fontWeight: FontWeight.bold);
    Widget text;
    switch (value.toInt()) {
      case 25:
        text = Text(
          '25',
          style: style,
          textScaleFactor: 1.0,
        );
        break;
      case 50:
        text = Text('50', textScaleFactor: 1.0, style: style);
        break;
      case 75:
        text = Text('75', textScaleFactor: 1.0, style: style);
        break;
      case 100:
        text = Text('100', textScaleFactor: 1.0, style: style);
        break;
      default:
        return Text('', style: style);
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    var style = TextStyle(
        color: SColors.white.withOpacity(0.9),
        fontSize: 11.0,
        fontWeight: FontWeight.bold);
    String text = "none";
    text = points[value.toInt()].xTitle;
    // switch (value.toInt()) {
    //   case 0:
    //     text = 'T1';
    //     break;
    //   case 1:
    //     text = 'T2';
    //     break;
    //   case 2:
    //     text = 'T3';
    //     break;
    //   case 3:
    //     text = 'T4';
    //     break;
    //   default:
    //     return Container();
    // }
    return Transform.rotate(
      angle: -1.57,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          text.length > 6 ? text.substring(0, 6) + '...' : text,
          style: style,
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
        ),
      ),
    );
  }

  SideTitles bottomTitles() => SideTitles(
      getTitlesWidget: bottomTitlesWidget,
      showTitles: true,
      interval: 1,
      reservedSize: 40.0);
}
