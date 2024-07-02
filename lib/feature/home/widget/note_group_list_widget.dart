import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/bloc/group_bloc.dart';

import 'package:note_app/feature/home/presentation/add_group_note_page.dart';

class NoteGroupListWidget extends StatefulWidget {
  const NoteGroupListWidget({Key? key}) : super(key: key);

  @override
  _NoteGroupListWidgetState createState() => _NoteGroupListWidgetState();
}

class _NoteGroupListWidgetState extends State<NoteGroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: BlocSelector<ListNoteGroupCubit, ListNoteGroupState, List<NoteGroupEntity>?>(
              selector: (state) => state.groups,
              builder: (context, groups) {
                if (groups?.isEmpty ?? true) {
                  return Text('empty');
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Chip(label: Text(groups![index].name ?? ''));
                  },
                  itemCount: groups?.length ?? 0,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              AddGroupNotePage().showBottomSheet(context).then(
                (groupName) {
                  if (groupName != null) {
                    context.read<ListNoteGroupCubit>().createByName(groupName);
                  }
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
