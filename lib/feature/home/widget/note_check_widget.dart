import 'package:flutter/material.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/presentation/calendar_page.dart';
import 'package:note_app/util/list_util.dart';

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
  const NoteCard({
    super.key,
    required this.note,
    required this.onCheckChanged,
    required this.tailWidget,
    this.onShareTap,
    this.onTap,
  });

  final NoteEntity note;
  final ValueChanged<bool?> onCheckChanged;
  final Widget tailWidget;
  final VoidCallback? onShareTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    bool isShowSubtitle = note.date != null || note.attachments.isNotNullAndNotEmpty;

    return ListTile(
      onTap: onTap,
      leading: Checkbox(
        value: note.isDone ?? false,
        onChanged: onCheckChanged,
      ),
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
                onShareTap?.call();
              },
              icon: Icon(Icons.share)),
          tailWidget,
        ],
      ),
    );
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
