import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/base_presentation/view/view.dart';
import 'package:note_app/feature/home/mock_data.dart';
import 'package:note_app/feature/home/widget/group_note_card_list.dart';
import 'package:note_app/feature/home/widget/note_group_card.dart';
import 'package:note_app/feature/home/widget/note_group_list_widget.dart';
import 'package:note_app/resource/string.dart';
import 'package:note_app/widget/search_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: LText(StringLocalization.notes),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.calendar_month_outlined),
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        _buildNoteGroupList(),
        Expanded(
          child: _buildListGroupCard(),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return const SizedBox();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(child: SearchView()),
          IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month_outlined)),
        ],
      ),
    );
  }

  Widget _buildNoteGroupList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Group',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        // const SizedBox(height: 16),
        const NoteGroupListWidget(),
      ],
    );
  }

  Widget _buildListGroupCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Note',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        // const SizedBox(height: 16),
        Expanded(child: const GroupNoteCardList()),
      ],
    );
    return GroupNoteCardList();
  }
}
