import 'package:auto_route/annotations.dart';
import 'package:zensleep_test/src/pages/home/main_home.dart';
import 'package:zensleep_test/src/pages/questions/question_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: QuestionPage, initial: true),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
