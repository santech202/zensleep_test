import 'package:flutter/material.dart';

class BasicTitle extends StatelessWidget {
  BasicTitle(
      {Key? key,
      required this.title,
      required this.paddingValue,
      required this.titleStyle})
      : super(key: key);
  String title;
  double paddingValue;
  TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Text(title, style: titleStyle, textAlign: TextAlign.center,));
  }
}
