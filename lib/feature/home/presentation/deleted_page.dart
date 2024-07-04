import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/observer_data/note_observer_data_impl.dart';
import 'package:note_app/data/repository/note_repository_impl.dart';
import 'package:note_app/feature/home/bloc/deleted_list_bloc.dart';
import 'package:note_app/feature/home/widget/note_check_widget.dart';
import 'package:note_app/util/list_util.dart';

class DeletedPage extends StatefulWidget {
  const DeletedPage({Key? key}) : super(key: key);

  @override
  State<DeletedPage> createState() => _DeletedPageState();
}

class _DeletedPageState extends BasePageState<DeletedPage> {
  final DeletedListBloc deletedListBloc = DeletedListBloc(
    noteObserverData: DeletedListNoteByGroupObserverDataIsar(),
    noteRepository: NoteRepositoryImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => deletedListBloc,
      child: super.build(context),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('History'),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocSelector<DeletedListBloc, DeletedListState, List<NoteEntity>?>(
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
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemCount: notes!.length,
        );
      },
    );
  }
}
