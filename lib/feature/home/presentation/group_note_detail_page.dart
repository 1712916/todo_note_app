import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/observer_data/note_observer_data_impl.dart';
import 'package:note_app/data/repository/note_repository_impl.dart';
import 'package:note_app/feature/home/bloc/group_detail_bloc.dart';

import 'package:note_app/feature/home/presentation/add_note_detail_page.dart';
import 'package:note_app/feature/home/widget/note_check_widget.dart';
import 'package:note_app/util/list_util.dart';

class GroupNoteDetailPage extends StatefulWidget {
  const GroupNoteDetailPage({Key? key, required this.group}) : super(key: key);
  final NoteGroupEntity group;

  @override
  _GroupNoteDetailPageState createState() => _GroupNoteDetailPageState();
}

class _GroupNoteDetailPageState extends BasePageState<GroupNoteDetailPage> {
  late final GroupDetailBloc groupDetailBloc = GroupDetailBloc(
    group: widget.group,
    noteRepository: NoteRepositoryImpl(),
    noteObserverData: ListNoteByGroupObserverDataIsar(group: widget.group),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => groupDetailBloc,
      child: super.build(context),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(widget.group.name ?? ''),
      actions: [
        BlocSelector<GroupDetailBloc, GroupDetailState, bool>(
          selector: (state) => state.isDeleteMode ?? false,
          builder: (context, state) {
            return Switch(
              value: state,
              onChanged: (value) {
                groupDetailBloc.switchDeleteMode(value);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocSelector<GroupDetailBloc, GroupDetailState, List<NoteEntity>?>(
      selector: (state) => state.notes,
      builder: (context, notes) {
        if (!notes.isNotNullAndNotEmpty) {
          return Text('empty notes');
        }

        return ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final item = notes[index];

            return NoteCard(
              note: item,
              onCheckChanged: (isDone) {
                if (isDone != null) {
                  groupDetailBloc.checkDone(isDone, item);
                }
              },
              tailWidget: BlocSelector<GroupDetailBloc, GroupDetailState, bool>(
                selector: (state) => state.isDeleteMode ?? false,
                builder: (context, state) {
                  if (state) {
                    return IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        groupDetailBloc.delete(item);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemCount: notes!.length,
        );
      },
    );
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AddNoteDetailPage(
          initNoteGroup: widget.group,
        ).showBottomSheet(context).then(
          (note) {
            if (note != null) {
              groupDetailBloc.create(note);
            }
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
