import 'package:flutter/material.dart';
import 'package:note_app/feature/home/mock_data.dart';
import 'package:note_app/feature/home/widget/note_group_card.dart';

class GroupNoteCardList extends StatefulWidget {
  const GroupNoteCardList({
    super.key,
  });

  @override
  State<GroupNoteCardList> createState() => _GroupNoteCardListState();
}

class _GroupNoteCardListState extends State<GroupNoteCardList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return NoteGroupCard(
          group: mockGroupList[index],
        );
      },
      itemCount: mockGroupList.length,
    );
  }
}
