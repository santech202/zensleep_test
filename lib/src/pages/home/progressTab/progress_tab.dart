import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/themeProvider.dart';
import 'package:zensleep_test/src/pages/home/progressTab/bar_chart.dart';
import 'package:zensleep_test/src/pages/home/progressTab/line_chart.dart';
import 'package:zensleep_test/src/pages/home/progressTab/line_chart_header.dart';
import 'package:zensleep_test/src/pages/home/progressTab/progress_time_widget.dart';
import 'package:zensleep_test/utils/constants.dart';
import 'package:zensleep_test/utils/util_data.dart';

import '../../../../utils/styles.dart';

class ProgressTab extends StatefulWidget {
  const ProgressTab({Key? key}) : super(key: key);

  @override
  State<ProgressTab> createState() => _ProgressTabState();
}

class _ProgressTabState extends State<ProgressTab> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ((context, themeProvider, child) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const ProgressTimeWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        themeProvider.darkTheme
                            ? SvgPicture.asset(Constants.moonSmallSvg,
                                color: Styles.lightWhiteColor, height: 20)
                            : Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Styles.sunColor),
                              ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'SLEEP STAGES',
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const LineChartHeader(),
                  const LineChartWidget(),
                  const SizedBox(height: 30,),
                  AnimatedToggleSwitch<int>.size(
                    textDirection: TextDirection.rtl,
                    current: value,
                    values: const [0, 1, 2],
                    iconOpacity: 0.2,
                    indicatorSize: const Size.fromWidth(100),
                    customIconBuilder: (context, local, global) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(switchText(local.value))],
                      );
                    },
                    borderColor: themeProvider.darkTheme ? Styles.calmVioletColor : Styles.tanColor,
                    colorBuilder: (i) =>themeProvider.darkTheme ? Styles.moonColor : Styles.sunColor,
                    onChanged: (i) => setState(() => value = i),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: UtilData.barChartModels.length,
                    itemBuilder: ((context, index) {
                      return BarChart(model: UtilData.barChartModels[index]);
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget rollingIconBuilder(int value, Size iconSize, bool foreground) {
    IconData data = Icons.access_time_rounded;
    if (value.isEven) data = Icons.cancel;
    return Icon(
      data,
      size: iconSize.shortestSide,
    );
  }

  Widget alternativeIconBuilder(BuildContext context, SizeProperties<int> local,
      GlobalToggleProperties<int> global) {
    IconData data = Icons.access_time_rounded;
    switch (local.value) {
      case 0:
        data = Icons.ac_unit_outlined;
        break;
      case 1:
        data = Icons.account_circle_outlined;
        break;
      case 2:
        data = Icons.assistant_navigation;
        break;
      case 3:
        data = Icons.arrow_drop_down_circle_outlined;
        break;
    }
    return Icon(
      data,
      size: local.iconSize.shortestSide,
    );
  }

  String switchText(int value) {
    switch (value) {
      case 0:
        return 'Thu';
      case 1:
        return '30 Day Avg';
      case 2:
        return 'Benchmark';
      default:
        return '';
    }
  }
}
