import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/data/entity/note_entity.dart';

import 'package:note_app/feature/home/presentation/add_note_detail_page.dart';
import 'package:note_app/feature/home/widget/note_check_widget.dart';

class GroupNoteDetailPage extends StatefulWidget {
  const GroupNoteDetailPage({Key? key, required this.group}) : super(key: key);
  final NoteGroupEntity group;

  @override
  _GroupNoteDetailPageState createState() => _GroupNoteDetailPageState();
}

class _GroupNoteDetailPageState extends BasePageState<GroupNoteDetailPage> {
  List<NoteEntity> notes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.group.name ?? ''),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        ...notes
            .where(
              (e) => e.groupId == widget.group.id,
            )
            .map(
              (e) => NoteCheckWidget(
                note: e,
                onCheckChanged: (value) {},
              ),
            ),
      ],
    );
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AddNoteDetailPage(
          initNoteGroup: widget.group,
        ).showBottomSheet(context).whenComplete(() {
          setState(() {});
        });
      },
      child: Icon(Icons.add),
    );
  }
}
