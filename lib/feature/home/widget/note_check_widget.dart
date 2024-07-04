import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/bloc/crud_note_bloc.dart';
import 'package:note_app/feature/home/presentation/calendar_page.dart';
import 'package:note_app/util/list_util.dart';
import 'package:share_plus/share_plus.dart';

class NoteCheckWidget extends StatelessWidget {
  const NoteCheckWidget({
    super.key,
    required this.note,
    required this.onCheckChanged,
    this.onTap,
  });

  final NoteEntity note;
  final ValueChanged<bool?> onCheckChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Checkbox(
          value: note.isDone ?? false,
          onChanged: onCheckChanged,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.description ?? '',
              style: theme.textTheme.titleMedium,
            ),
            if (note.date != null)
              Text(
                note.date.toString(),
                style: theme.textTheme.labelSmall,
              ),
          ],
        ),
      ],
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.showDelete = true,
    this.showCheckDone = true,
    this.onTap,
  });

  final NoteEntity note;
  final bool showDelete;
  final bool showCheckDone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool isShowSubtitle = note.date != null || note.attachments.isNotNullAndNotEmpty;

    return ListTile(
      onTap: onTap,
      leading: showCheckDone
          ? Checkbox(
              value: note.isDone ?? false,
              onChanged: (isDone) {
                if (isDone != null) {
                  context.read<CrudNoteBloc>().checkDone(isDone, note);
                }
              },
            )
          : null,
      title: Text(
        note.description ?? '',
        style: theme.textTheme.titleLarge,
      ),
      subtitle: !isShowSubtitle
          ? null
          : Column(
              children: [
                if (note.date != null)
                  Row(
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text('${note.date?.dateString()}'),
                    ],
                  ),
                if (note.attachments.isNotNullAndNotEmpty)
                  Row(
                    children: [
                      Icon(
                        Icons.attach_file_rounded,
                        size: 14,
                      ),
                      Text('${note.attachments?.length}'),
                    ],
                  ),
              ],
            ),
      contentPadding: EdgeInsets.zero,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                // Share.share(note.getShareData(widget.group));
              },
              icon: Icon(Icons.share)),
          if (showDelete)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<CrudNoteBloc>().delete(note);
              },
            )
        ],
      ),
    );
  }
}
