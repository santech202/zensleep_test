import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';

import '../../../utils/styles.dart';

class QuestionItems extends StatelessWidget {
  const QuestionItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, mainProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: mainProvider.currentQModel.options.length,
          itemBuilder: (context, index) {
            bool isChecked =
                index == mainProvider.currentQModel.selectOptionNum;
            return checkedItem(context,
                mainProvider.currentQModel.options[index], index, isChecked);
          },
        );
      },
    );
  }


  Widget checkedItem(
      BuildContext context, String optionValue, int index, bool isChecked) {
    return GestureDetector(
      onTap: () {
        Provider.of<MainProvider>(context, listen: false)
            .changeQuestionOption(index);
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 24, right: 19, top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(
            border: isChecked
                ? Border.all(color: Styles.sunColor, width: 1.5)
                : null,
            borderRadius: BorderRadius.circular(isChecked ? 12 : 0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionValue,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: isChecked ? Styles.sunColor : Styles.lightWhiteColor),
            ),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: isChecked
                      ? null
                      : Border.all(width: 1.5, color: Styles.lightWhiteColor),
                  color: isChecked ? Styles.sunColor : Colors.transparent),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      color: Styles.deepPurpleColor,
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
