import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zensleep_test/data/providers/main_provider.dart';
import 'package:zensleep_test/data/providers/themeProvider.dart';
import 'package:zensleep_test/src/router/router.gr.dart';
import 'package:zensleep_test/utils/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();
  final _appRouter = AppRouter();

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentAppTheme();
  // }

  // void getCurrentAppTheme() async {
  //   themeChangeProvider.darkTheme =
  //       await themeChangeProvider.darkThemePreference.getTheme();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MainProvider())
      ],
      child: Consumer<ThemeProvider>(
        builder: ((context, theme, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(theme.darkTheme, context),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        }),
      ),
    );
  }
}
