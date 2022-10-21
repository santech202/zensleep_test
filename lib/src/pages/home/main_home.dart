import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/themeProvider.dart';
import 'package:zensleep_test/src/pages/home/progressTab/progress_tab.dart';
import 'package:zensleep_test/src/widgets/custom_line_indicator_bottom_navbar.dart';
import 'package:zensleep_test/utils/constants.dart';

import '../../../utils/styles.dart';
import 'homeTab/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> tabPages = <Widget>[
    const HomeTabPage(),
    const ProgressTab(),
    Container(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ((context, themeProvider, child) {
        return Scaffold(
          bottomNavigationBar: SizedBox(
            height: 80,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              child: CustomLineIndicatorBottomNavbar(
                customBottomBarItems: [
                  CustomBottomBarItems(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset(
                        Constants.homeSvg,
                        color: _selectedIndex == 0
                            ? themeProvider.darkTheme ? Styles.sunColor : Styles.darkPurpleColor
                            : themeProvider.darkTheme ? Styles.lightWhiteColor : Styles.deepPurpleColor
                      ),
                    ),
                    label: 'HOME',
                  ),
                  CustomBottomBarItems(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset(
                        Constants.unwindSvg,
                        color: _selectedIndex == 1
                           ? themeProvider.darkTheme
                                  ? Styles.sunColor
                                  : Styles.darkPurpleColor
                              : themeProvider.darkTheme
                                  ? Styles.lightWhiteColor
                                  : Styles.deepPurpleColor
                      ),
                    ),
                    label: 'UNWIND',
                  ),
                  CustomBottomBarItems(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset(
                        Constants.sleepSvg,
                        color: _selectedIndex == 2
                            ? themeProvider.darkTheme
                                  ? Styles.sunColor
                                  : Styles.darkPurpleColor
                              : themeProvider.darkTheme
                                  ? Styles.lightWhiteColor
                                  : Styles.deepPurpleColor
                      ),
                    ),
                    label: 'SLEEP',
                  ),
                  CustomBottomBarItems(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: SvgPicture.asset(
                        Constants.learnSvg,
                        color: _selectedIndex == 3
                            ? themeProvider.darkTheme
                                  ? Styles.sunColor
                                  : Styles.darkPurpleColor
                              : themeProvider.darkTheme
                                  ? Styles.lightWhiteColor
                                  : Styles.deepPurpleColor
                      ),
                    ),
                    label: 'LEARN',
                  ),
                  CustomBottomBarItems(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 8),
                      child: SvgPicture.asset(
                        Constants.connectSvg,
                        color: _selectedIndex == 4
                            ? themeProvider.darkTheme
                                  ? Styles.sunColor
                                  : Styles.darkPurpleColor
                              : themeProvider.darkTheme
                                  ? Styles.lightWhiteColor
                                  : Styles.deepPurpleColor
                      ),
                    ),
                    label: 'CONNECT',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedColor: themeProvider.darkTheme ? Styles.sunColor : Styles.darkPurpleColor,
                unSelectedColor: themeProvider.darkTheme ? Styles.lightWhiteColor : Styles.deepPurpleColor,
                backgroundColor: themeProvider.darkTheme ? Styles.darkPurpleColor : Styles.lightTanColor,
                onTap: _onItemTapped,
              ),
            ),
          ),
          body: Center(
            child: tabPages.elementAt(_selectedIndex),
          ),
        );
      }),
    );
  }
}
