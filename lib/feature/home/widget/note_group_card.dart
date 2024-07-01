import 'package:flutter/material.dart';
import 'package:note_app/data/note_entity.dart';
import 'package:note_app/feature/home/mock_data.dart';
import 'package:note_app/util/navigator/app_navigator.dart';
import 'package:note_app/util/navigator/app_page.dart';

class NoteGroupCard extends StatefulWidget {
  const NoteGroupCard({super.key, required this.group});

  final NoteGroupEntity group;

  @override
  State<NoteGroupCard> createState() => _NoteGroupCardState();
}

class _NoteGroupCardState extends State<NoteGroupCard> {
  List<NoteEntity> get notes => mockNotes
      .where(
        (e) => e.groupId == widget.group.id,
      )
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: GestureDetector(
        onTap: () {
          AppNavigator.to(GetGroupNoteDetailPage(), widget.group).whenComplete(() {
            setState(() {});
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (widget.group.name ?? ''),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineSmall,
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: notes.isEmpty ? Icon(Icons.add) : _buildNoteList(),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteList() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: notes
          .map(
            (e) => Text(
              e.description ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
          .toList(),
    );
  }
}
