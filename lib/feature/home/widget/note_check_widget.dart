import 'package:flutter/material.dart';
import 'package:note_app/data/entity/note_entity.dart';

class NoteCheckWidget extends StatelessWidget {
  const NoteCheckWidget({super.key, required this.note, required this.onCheckChanged});

  final NoteEntity note;
  final ValueChanged<bool?> onCheckChanged;

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
  const NoteCard({super.key, required this.note, required this.onCheckChanged, required this.tailWidget});

  final NoteEntity note;
  final ValueChanged<bool?> onCheckChanged;
  final Widget tailWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Row(
        children: [
          Checkbox(
            value: note.isDone ?? false,
            onChanged: onCheckChanged,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.description ?? '',
                  style: theme.textTheme.titleLarge,
                ),
                if (note.date != null)
                  Text(
                    note.date.toString().split(' ').first,
                    style: theme.textTheme.labelSmall,
                  ),
                if (note.attachments?.isNotEmpty ?? false)
                  RawChip(
                    label: Text('${note.attachments?.length ?? 0}'),
                    avatar: Icon(Icons.attach_file_rounded),
                  ),
              ],
            ),
          ),
          tailWidget,
        ],
      ),
    );
  }
}
