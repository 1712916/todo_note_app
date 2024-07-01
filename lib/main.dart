import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/theme/theme.dart';
import 'package:note_app/util/app_life_cycle_mixin.dart';
import 'package:note_app/util/navigator/app_navigator.dart';
import 'package:note_app/util/navigator/app_page.dart';

import 'main_setting/app_setting.dart';

class AppLocale {
  final List<Locale> supportedLocales = [
    const Locale('ar', 'EG'),
    const Locale('en', 'US'),
    const Locale('es', 'ES'),
    const Locale('hi', 'IN'),
    const Locale('ja', 'JP'),
    const Locale('pt', 'BR'),
    const Locale('vi', 'VN'),
    const Locale('zh', 'CN'),
  ];

  Locale get defaultLocale => const Locale('en', 'US');

  String get path => 'assets/translations';
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSetting().initApp();

  final AppLocale appLocale = AppLocale();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppTheme.initFromRootContext(context);
    return ListenableBuilder(
      listenable: AppTheme.instance,
      builder: (context, _) {
        return MaterialApp(
          themeMode: AppTheme.instance.mode,
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   useMaterial3: true,
          // ),
          // darkTheme: ThemeData(
          //   useMaterial3: true,
          // ),
          home: GetHomePage().getPage(null),
          navigatorKey: AppNavigator.navigatorKey,
          navigatorObservers: [
            AppLifeCycleMixin.routeObserver,
          ],
        );
      },
    );
  }
}
