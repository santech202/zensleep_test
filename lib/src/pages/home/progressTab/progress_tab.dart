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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: UtilData.barChartModels.length,
                    itemBuilder: ((context, index) {
                      return BarChart(model: UtilData.barChartModels[index]);
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const LineChartHeader(),
                  const LineChartWidget(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
