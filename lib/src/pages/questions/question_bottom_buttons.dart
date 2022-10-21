import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';

import '../../../utils/styles.dart';

class QuestionBottomButtons extends StatelessWidget {
  const QuestionBottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: ((context, mainProvider, child) {
        return Container(
          padding: const EdgeInsets.only(left: 24, right: 21),
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  int currentStepIndex = mainProvider.currentQStep;
                  if (currentStepIndex == 0) {
                    return;
                  } else {
                    Provider.of<MainProvider>(context, listen: false)
                        .changeQStep(currentStepIndex - 1);
                  }
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.moonColor),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Styles.lightWhiteColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    int currentStepIndex = mainProvider.currentQStep;
                    if (currentStepIndex == 1) {
                      AutoRouter.of(context).pushNamed('/home-page');
                    } else {
                      Provider.of<MainProvider>(context, listen: false)
                          .changeQStep(currentStepIndex + 1);
                    }
                  },
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Styles.sunColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Next',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: Styles.darkPurpleColor,
                                  )),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Styles.deepPurpleColor,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
