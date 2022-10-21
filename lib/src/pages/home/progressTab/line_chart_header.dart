import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class LineChartHeader extends StatelessWidget {
  const LineChartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            'Sleep Chart',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WAKE',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Styles.greenColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'REM',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Styles.moonColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'LIGHT',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Styles.lightBlueColor),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'DEEP',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Styles.deepTanColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
