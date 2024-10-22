import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:schoolmate/common/widgets/graph/dotpoint_model.dart';
import 'package:schoolmate/common/widgets/graph/graph_controller.dart';
import 'package:schoolmate/utils/constants/colors.dart';

class SGraphHelper {
  final List<DotPoint> points;
  SGraphHelper({required this.points});

  final graphController = GraphController.instance;

  /////////////Lines Bar Data///////////
  List<LineChartBarData> get lineBarsData => [
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
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
          showingIndicators: graphController.showingTooltipOnSpots,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: [
              SColors.primaryDark.withOpacity(0.5),
              SColors.primary.withOpacity(0.1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
      ];

  /////////////Boreder Data///////////
  FlBorderData get borderData => FlBorderData(
      show: true,
      border: Border.all(color: SColors.white.withOpacity(0.1), width: 1.5));

  //////////////Grid Data///////////////////
  FlGridData get gridData => FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: SColors.white.withOpacity(0.1), strokeWidth: 1);
        },
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(color: SColors.white.withOpacity(0.1), strokeWidth: 1);
        },
      );

  ///////////////X and Y axis titles/////////////////////
  FlTitlesData get titlesData => FlTitlesData(
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
        );
        break;
      case 50:
        text = Text('50', style: style);
        break;
      case 75:
        text = Text('75', style: style);
        break;
      case 100:
        text = Text('100', style: style);
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
          text.length > 6 ? '${text.substring(0, 6)}...' : text,
          style: style,
          textAlign: TextAlign.center,
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
