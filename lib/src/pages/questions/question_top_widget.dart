import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';

import '../../../utils/styles.dart';
import '../../widgets/basicTitle.dart';

class QuestionTopWidget extends StatelessWidget {
  const QuestionTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: ((context, mainProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: (mainProvider.currentQStep + 1) * 100~/3,
                size: 6,
                padding: 0,
                selectedColor: Styles.calmVioletColor,
                unselectedColor: Styles.deepPurpleColor,
                roundedEdges: const Radius.circular(10),
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            BasicTitle(
              title: mainProvider.currentQModel.title,
              paddingValue: 42,
              titleStyle: Theme.of(context).textTheme.headline2!,
            ),
          ],
        );
      }),
    );
  }
}
