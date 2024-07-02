import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/bloc/group_bloc.dart';

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
    return BlocSelector<ListNoteGroupCubit, ListNoteGroupState, List<NoteGroupEntity>?>(
      selector: (state) => state.groups,
      builder: (context, groups) {
        if (groups?.isEmpty ?? true) {
          return Text('empty');
        }

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            ;

            return NoteGroupCard(
              group: groups![index],
            );
          },
          itemCount: groups?.length ?? 0,
        );
      },
    );
  }
}
