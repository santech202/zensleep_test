import 'dart:ui';

class BarChartModel {
  int percent;
  double rate;
  String time;
  String title;
  Color chartColor;

  BarChartModel(
      {required this.percent,
      required this.rate,
      required this.time,
      required this.chartColor,
      required this.title});
}
