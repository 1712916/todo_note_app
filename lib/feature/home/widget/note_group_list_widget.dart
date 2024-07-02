import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/mock_data.dart';
import 'package:note_app/feature/home/presentation/add_group_note_page.dart';

class NoteGroupListWidget extends StatefulWidget {
  const NoteGroupListWidget({Key? key}) : super(key: key);

  @override
  _NoteGroupListWidgetState createState() => _NoteGroupListWidgetState();
}

class _NoteGroupListWidgetState extends State<NoteGroupListWidget> {
  List<NoteGroupEntity> groupList = [];

  @override
  void initState() {
    super.initState();

    groupList = mockGroupList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final group = groupList[index];
                return Chip(label: Text(group.name ?? ''));
              },
              itemCount: groupList.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              AddGroupNotePage().showBottomSheet(context).then(
                (value) {
                  setState(() {});
                },
              );
            },
            child: const Text('Add'),
            style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                ),
          )
        ],
      ),
    );
  }
}
