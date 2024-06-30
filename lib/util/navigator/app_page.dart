import 'package:flutter/material.dart';
import 'package:note_app/feature/home/presentation/home_page.dart';

class GetHomePage extends AppPage {
  GetHomePage() : super('/home');

  @override
  Widget? getPage(Object? arguments) {
    return const HomePage();
  }
}

sealed class AppPage {
  final String path;

  AppPage(this.path);

  Widget? getPage(Object? arguments);
}
