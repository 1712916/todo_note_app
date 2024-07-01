import 'package:flutter/material.dart';
import 'package:note_app/data/note_entity.dart';
import 'package:note_app/feature/home/presentation/group_note_detail_page.dart';
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

class GetGroupNoteDetailPage extends AppPage {
  GetGroupNoteDetailPage() : super('/group-detail');

  @override
  Widget? getPage(Object? arguments) {
    return GroupNoteDetailPage(
      group: arguments as NoteGroupEntity,
    );
  }
}
