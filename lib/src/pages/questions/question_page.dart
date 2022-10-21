import 'package:flutter/material.dart';
import 'package:zensleep_test/src/pages/questions/question_bottom_buttons.dart';
import 'package:zensleep_test/src/pages/questions/question_item.dart';
import 'package:zensleep_test/src/pages/questions/question_top_widget.dart';
import 'package:zensleep_test/src/widgets/basicTitle.dart';
import 'package:zensleep_test/utils/constants.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              BasicTitle(
                title: Constants.questionPageTitle,
                paddingValue: 39,
                titleStyle: Theme.of(context).textTheme.headline3!,
              ),
              const SizedBox(
                height: 9,
              ),
              const QuestionTopWidget(),
              const SizedBox(
                height: 105,
              ),
              const QuestionItems(),
              Flexible(flex: 1, child: Container()),
              const QuestionBottomButtons()
            ],
          ),
        ),
      ),
    );
  }
}
