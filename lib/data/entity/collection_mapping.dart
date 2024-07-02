import 'package:note_app/data/collection/note_collection.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/mapping_util.dart';

class ListNoteGroupMapping extends Mapping<List<NoteGroupCollection>, List<NoteGroupEntity>> {
  ListNoteGroupMapping._();

  static final ListNoteGroupMapping _i = ListNoteGroupMapping._();

  factory ListNoteGroupMapping() => _i;

  @override
  List<NoteGroupEntity> from(List<NoteGroupCollection> input) {
    return input.map(NoteGroupMapping().from).toList();
  }
}

class NoteGroupMapping extends Mapping<NoteGroupCollection, NoteGroupEntity> {
  NoteGroupMapping._();

  static final NoteGroupMapping _i = NoteGroupMapping._();

  factory NoteGroupMapping() => _i;

  @override
  NoteGroupEntity from(NoteGroupCollection input) {
    return NoteGroupEntity(
      id: input.id,
      name: input.name,
      updatedDateTime: input.updatedDateTime,
    );
  }
}

class NoteMapping extends Mapping<NoteCollection, NoteEntity> {
  NoteMapping._();

  static final NoteMapping _i = NoteMapping._();

  factory NoteMapping() => _i;

  @override
  NoteEntity from(NoteCollection input) {
    return NoteEntity(
      id: input.id,
      description: input.description,
      updatedDateTime: input.updatedDateTime,
      isDone: input.isDone,
      attachments: input.attachments?.map(AttachmentMapping().from).toList(),
      date: input.date,
      groupId: input.groupId,
      isDeleted: input.isDeleted,
    );
  }
}

class AttachmentMapping extends Mapping<AttachmentCollection, AttachmentEntity> {
  AttachmentMapping._();

  static final AttachmentMapping _i = AttachmentMapping._();

  factory AttachmentMapping() => _i;
  @override
  AttachmentEntity from(AttachmentCollection input) {
    return AttachmentEntity(path: input.path);
  }
}
