import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';
import 'package:zensleep_test/data/providers/themeProvider.dart';
import 'package:zensleep_test/src/pages/home/homeTab/routine_items.dart';
import 'package:zensleep_test/src/widgets/basicTitle.dart';
import 'package:zensleep_test/utils/constants.dart';

import '../../../../utils/styles.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, MainProvider>(
      builder: ((context, themeProvider, mainProvider, child) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 23,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            themeProvider.darkTheme
                                ? Constants.homeNightTitle
                                : Constants.homeDayTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(height: 1.2)),
                        GestureDetector(
                            onTap: () {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .darkTheme = !themeProvider.darkTheme;
                            },
                            child: themeProvider.darkTheme
                                ? SvgPicture.asset(
                                    Constants.moonSvg,
                                    height: 122,
                                    width: 122,
                                  )
                                : Container(
                                    height: 122,
                                    width: 122,
                                    decoration: BoxDecoration(
                                        color: Styles.sunColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BasicTitle(
                      title: themeProvider.darkTheme
                          ? Constants.homeNightRoutineTitle
                          : Constants.homeDayRoutineTitle,
                      paddingValue: 23,
                      titleStyle: Theme.of(context).textTheme.headline3!),
                  const SizedBox(
                    height: 21,
                  ),
                  themeProvider.darkTheme
                      ? RoutineItems(
                          routineModels: mainProvider.nightRoutineModels,
                          isDarkTheme: themeProvider.darkTheme)
                      : RoutineItems(
                          routineModels: mainProvider.dayRoutineModels,
                          isDarkTheme: themeProvider.darkTheme),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
