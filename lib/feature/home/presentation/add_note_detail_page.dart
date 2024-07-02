import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/data/entity/note_entity.dart';

import 'package:note_app/util/navigator/app_navigator.dart';
import 'package:note_app/util/theme_util.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/widget/show_bottom_sheet.dart';

class AddNoteDetailPage extends StatefulWidget with ShowBottomSheet {
  const AddNoteDetailPage({Key? key, this.initNoteGroup}) : super(key: key);

  final NoteGroupEntity? initNoteGroup;

  @override
  State<AddNoteDetailPage> createState() => _AddNoteDetailPageState();
}

class _AddNoteDetailPageState extends BasePageState<AddNoteDetailPage> with ThemeUtil {
  final TextEditingController _controller = TextEditingController();
  NoteGroupEntity? group;

  @override
  void initState() {
    group = widget.initNoteGroup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                BackButton(),
                const SizedBox(width: 16),
                Center(
                    child: Text(
                  'Add Note',
                  style: theme.textTheme.titleLarge,
                )),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    maxLines: 4,
                    controller: _controller,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Group: ',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(width: 4),
                      if (group != null)
                        Chip(label: Text(group!.name ?? ''))
                      else
                        TextButton(onPressed: () {}, child: Text('Add group')),
                      Spacer(),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                onPressed: _controller.text.isEmpty ? null : () {}, child: Text('Save Note')),
                          );
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month_outlined)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.attach_file_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Title',
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          maxLines: 4,
          controller: _controller,
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ElevatedButton(onPressed: _controller.text.isEmpty ? null : () {}, child: Text('Save Group'));
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
