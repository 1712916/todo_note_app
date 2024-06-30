import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/page/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Home'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(child: Text('Hello'));
  }
}
