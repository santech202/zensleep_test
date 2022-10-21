import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Styles.deepPurpleColor),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 12,
            top: 24,
            bottom: 12,
          ),
          child: LineChart(
            avgData(),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('12AM', style: style);
        break;
      case 1:
        text = const Text('', style: style);
        break;
      case 2:
        text = const Text('2AM', style: style);
        break;
      case 3:
        text = const Text('', style: style);
        break;
      case 4:
        text = const Text('4AM', style: style);
        break;
      case 5:
        text = const Text('', style: style);
        break;
      case 6:
        text = const Text('6AM', style: style);
        break;
      case 7:
        text = const Text('', style: style);
        break;
      case 8:
        text = const Text('8AM', style: style);
        break;
      case 9:
        text = const Text('', style: style);
        break;
      case 10:
        text = const Text('10AM', style: style);
        break;
      case 11:
        text = const Text('', style: style);
        break;
      case 12:
        text = const Text('12PM', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'DEEP';
        break;
      case 2:
        text = 'LIGHT';
        break;
      case 3:
        text = 'REM';
        break;
      case 4:
        text = 'WAKE';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 0,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0.1, 2),
            FlSpot(0.2, 2),
            FlSpot(0.3, 2),
            FlSpot(0.4, 2),
            FlSpot(0.5, 2),
            FlSpot(0.6, 2),
            FlSpot(0.7, 2),
            FlSpot(0.8, 2),
            FlSpot(0.9, 2),
            FlSpot(1, 2),
            FlSpot(1.1, 2),
            FlSpot(1.2, 2),
            FlSpot(1.3, 2),
            FlSpot(1.4, 2),
            FlSpot(1.5, 2),
            FlSpot(1.6, 2),
            FlSpot(1.7, 2),
            FlSpot(1.8, 2),
            FlSpot(1.9, 2),
            FlSpot(2, 2),
            FlSpot(2.1, 2),
            FlSpot(2.2, 2),
            FlSpot(2.3, 2),
            FlSpot(2.4, 2),
            FlSpot(2.5, 2),
            FlSpot(2.6, 2),
            FlSpot(2.7, 2),
            FlSpot(2.8, 2),
            FlSpot(2.9, 1),
            FlSpot(3, 1),
            FlSpot(3.1, 1),
            FlSpot(3.2, 1),
            FlSpot(3.3, 1),
            FlSpot(3.4, 4),
            FlSpot(3.5, 4),
            FlSpot(3.6, 4),
            FlSpot(3.7, 4),
            FlSpot(3.8, 4),
            FlSpot(3.9, 4),
            FlSpot(4, 4),
            FlSpot(4.1, 4),
            FlSpot(4.2, 4),
            FlSpot(4.3, 4),
            FlSpot(4.4, 4),
            FlSpot(4.5, 4),
            FlSpot(4.6, 4),
            FlSpot(4.7, 4),
            FlSpot(4.8, 4),
            FlSpot(4.9, 4),
            FlSpot(5, 4),
            FlSpot(5.1, 4),
            FlSpot(5.2, 4),
            FlSpot(5.3, 2),
            FlSpot(5.4, 2),
            FlSpot(5.5, 2),
            FlSpot(5.6, 2),
            FlSpot(5.7, 2),
            FlSpot(5.8, 2),
            FlSpot(5.9, 2),
            FlSpot(6, 2),
            FlSpot(6.1, 2),
            FlSpot(6.2, 3),
            FlSpot(6.3, 3),
            FlSpot(6.4, 3),
            FlSpot(6.5, 3),
            FlSpot(6.6, 3),
            FlSpot(6.7, 3),
            FlSpot(6.8, 3),
            FlSpot(6.9, 3),
            FlSpot(7, 3),
            FlSpot(7.1, 3),
            FlSpot(7.2, 3),
            FlSpot(7.3, 3),
            FlSpot(7.4, 3),
            FlSpot(7.5, 3),
            FlSpot(7.6, 3),
            FlSpot(7.7, 3),
            FlSpot(7.8, 3),
            FlSpot(7.9, 3),
            FlSpot(8, 3),
            FlSpot(8.1, 3),
            FlSpot(8.2, 3),
            FlSpot(8.3, 3),
            FlSpot(8.4, 3),
            FlSpot(8.5, 3),
            FlSpot(8.6, 3),
            FlSpot(8.7, 3),
            FlSpot(8.8, 3),
            FlSpot(8.9, 3),
            FlSpot(9, 3),
            FlSpot(9.1, 3),
            FlSpot(9.2, 3),
            FlSpot(9.3, 3),
            FlSpot(9.4, 3),
            FlSpot(9.5, 3),
            FlSpot(9.6, 3),
            FlSpot(9.7, 3),
            FlSpot(9.8, 3),
            FlSpot(9.9, 3),
            FlSpot(10, 3),
            FlSpot(10.1, 3),
            FlSpot(10.2, 1),
            FlSpot(10.3, 1),
            FlSpot(10.4, 1),
            FlSpot(10.5, 1),
            FlSpot(10.6, 1),
            FlSpot(10.7, 1),
            FlSpot(10.8, 4),
            FlSpot(10.9, 4),
            FlSpot(11, 4),
            FlSpot(11.1, 4),
            FlSpot(11.2, 4),
            FlSpot(11.3, 4),
            FlSpot(11.4, 4),
            FlSpot(11.5, 4),
            FlSpot(11.6, 4),
            FlSpot(11.7, 4),
            FlSpot(11.8, 4),
            FlSpot(11.9, 4),
            FlSpot(12, 4)
          ],
          isCurved: true,
          curveSmoothness: 0.001,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
