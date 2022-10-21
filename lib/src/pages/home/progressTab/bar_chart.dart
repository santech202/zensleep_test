import 'package:flutter/material.dart';
import 'package:zensleep_test/data/models/barchart_model.dart';

class BarChart extends StatelessWidget {
  BarChart({
    Key? key,
    required this.model,
  }) : super(key: key);

  BarChartModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: (MediaQuery.of(context).size.width - 150) * model.rate,
            padding: const EdgeInsets.only(bottom: 5, left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: model.chartColor),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${model.percent}%',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                model.time,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          )
        ],
      ),
    );
  }
}
