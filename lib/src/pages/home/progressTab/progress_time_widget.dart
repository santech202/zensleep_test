import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/themeProvider.dart';

import '../../../../utils/styles.dart';

class ProgressTimeWidget extends StatelessWidget {
  const ProgressTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ((context, themeProvider, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: themeProvider.darkTheme
                            ? Styles.lightWhiteColor
                            : Styles.deepPurpleColor,
                      ),
                      Text(
                        'TIME ASLEEP',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '11',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'hr ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        '39',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'min',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Edit Goal',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Styles.calmVioletColor),
                  ),
                  const SizedBox(height: 5,),
                  const Icon(
                    Icons.star,
                    color: Styles.sunColor,
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
