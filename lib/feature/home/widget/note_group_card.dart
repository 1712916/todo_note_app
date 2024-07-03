import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/observer_data/note_observer_data_impl.dart';
import 'package:note_app/data/repository/note_repository_impl.dart';
import 'package:note_app/feature/home/bloc/group_detail_bloc.dart';
import 'package:note_app/util/list_util.dart';

import 'package:note_app/util/navigator/app_navigator.dart';
import 'package:note_app/util/navigator/app_page.dart';

class NoteGroupCard extends StatefulWidget {
  const NoteGroupCard({super.key, required this.group});

  final NoteGroupEntity group;

  @override
  State<NoteGroupCard> createState() => _NoteGroupCardState();
}

class _NoteGroupCardState extends State<NoteGroupCard> {
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
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => groupDetailBloc,
      child: Card(
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
                    child: BlocSelector<GroupDetailBloc, GroupDetailState, List<NoteEntity>?>(
                  selector: (state) => state.notes,
                  builder: (context, notes) {
                    if (!notes.isNotNullAndNotEmpty) {
                      return Text('empty notes');
                    }

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final item = notes[index];

                        return Text(item.description ?? '');
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 4),
                      itemCount: notes!.length,
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
