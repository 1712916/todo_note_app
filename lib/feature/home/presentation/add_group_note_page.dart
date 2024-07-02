import 'package:flutter/material.dart';
import 'package:note_app/base_presentation/page/base_page.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/feature/home/mock_data.dart';
import 'package:note_app/util/navigator/app_navigator.dart';
import 'package:note_app/util/theme_util.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/widget/show_bottom_sheet.dart';

class AddGroupNotePage extends StatefulWidget with ShowBottomSheet {
  const AddGroupNotePage({Key? key}) : super(key: key);

  @override
  State<AddGroupNotePage> createState() => _AddGroupNotePageState();
}

class _AddGroupNotePageState extends BasePageState<AddGroupNotePage> with ThemeUtil {
  final TextEditingController _controller = TextEditingController();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Add Group'),
    );
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
                  'Add Group',
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
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: _controller.text.isEmpty
                                ? null
                                : () {
                                    addGroup(
                                      NoteGroupEntity(
                                        id: mockNotes.length + 1,
                                        name: _controller.text.trim(),
                                        updatedDateTime: DateTime.now(),
                                      ),
                                    );
                                    AppNavigator.back();
                                  },
                            child: Text('Save Group')),
                      );
                    },
                  )
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
