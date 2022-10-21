import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/models/routine_model.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';
import 'package:zensleep_test/utils/constants.dart';

import '../../../../utils/styles.dart';
import '../../../widgets/expantion_list.dart';

class RoutineItems extends StatelessWidget {
  RoutineItems(
      {Key? key, required this.routineModels, required this.isDarkTheme})
      : super(key: key);
  List<RoutineModel> routineModels;
  bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          cardColor: isDarkTheme ? Styles.deepPurpleColor : Styles.lightWhiteColor, dividerColor: Colors.transparent),
      child: AppExpansionPanelList(
        animationDuration: const Duration(milliseconds: 1000),
        elevation: 0,
        children: routineModels.map<ExpansionPanel>(
          (e) {
            return ExpansionPanel(
                headerBuilder: ((context, isExpanded) {
                  return routineItem(context, e, isDarkTheme);
                }),
                body: Container(),
                isExpanded: e.isActive,
                canTapOnHeader: true);
          },
        ).toList(),
        expansionCallback: ((panelIndex, isExpanded) {
          final mainProvider =
              Provider.of<MainProvider>(context, listen: false);
          if (isDarkTheme) {
            mainProvider.changeNightRoutineActiveState(panelIndex);
          } else {
            mainProvider.changeDayRoutineActiveState(panelIndex);
          }
        }),
      ),
    );
  }

  Widget routineItem(
    BuildContext context,
    RoutineModel routineModel,
    bool isDarkTheme
  ) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        margin:  EdgeInsets.only(bottom: routineModel.isActive ? 0 : 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(color:  isDarkTheme ? Styles.sunColor : Styles.deepPurpleColor, width: 1.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: routineModel.isActive
                  ? SvgPicture.asset(
                      isDarkTheme ? Constants.moonSmallSvg : Constants.runSvg,
                      color:  isDarkTheme
                          ? Styles.sunColor
                          : Styles.deepPurpleColor,
                      height: 10,
                      width: 10,
                      fit: BoxFit.scaleDown,
                    )
                  : Icon(
                      Icons.check,
                      color: isDarkTheme ? Styles.sunColor : Styles.deepPurpleColor,
                      size: 10,
                    ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: !routineModel.isActive
                  ? Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isDarkTheme ? Styles.darkPurpleColor : Styles.lightTanColor),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(routineModel.title,
                                style: Theme.of(context).textTheme.bodyText1!),
                            Text(routineModel.time,
                                style: Theme.of(context).textTheme.bodyText1!)
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isDarkTheme ? Styles.moonColor : Styles.sunColor),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                                "It's almost ${routineModel.time} - time to ${routineModel.title}",
                                style: Theme.of(context).textTheme.headline3!),
                            Container(
                              height: 40,
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(44),
                                  color: isDarkTheme ? Styles.sunColor : Styles.deepPurpleColor),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "I'm on it!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: isDarkTheme ? Styles.deepPurpleColor : Styles.sunColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
