import 'package:note_app/data/collection/note_collection.dart';
import 'package:note_app/data/entity/app_file.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/mapping_util.dart';

class ListNoteGroupMapping extends Mapping<List<NoteGroupCollection>, List<NoteGroupEntity>> {
  ListNoteGroupMapping._();

  static final ListNoteGroupMapping _i = ListNoteGroupMapping._();

  factory ListNoteGroupMapping() => _i;

  @override
  List<NoteGroupEntity> to(List<NoteGroupCollection> input) {
    return input.map(NoteGroupCollectionToEntityMapping().to).toList();
  }
}

class NoteGroupCollectionToEntityMapping extends Mapping<NoteGroupCollection, NoteGroupEntity> {
  NoteGroupCollectionToEntityMapping._();

  static final NoteGroupCollectionToEntityMapping _i = NoteGroupCollectionToEntityMapping._();

  factory NoteGroupCollectionToEntityMapping() => _i;

  @override
  NoteGroupEntity to(NoteGroupCollection input) {
    return NoteGroupEntity(
      id: input.id,
      name: input.name,
      updatedDateTime: input.updatedDateTime,
      isDeleted: input.isDeleted,
    );
  }
}

class NoteMapping extends Mapping<NoteCollection, NoteEntity> {
  NoteMapping._();

  static final NoteMapping _i = NoteMapping._();

  factory NoteMapping() => _i;

  @override
  NoteEntity to(NoteCollection input) {
    return NoteEntity(
      id: input.id,
      description: input.description,
      updatedDateTime: input.updatedDateTime,
      isDone: input.isDone,
      attachments: input.attachments?.map(AttachmentMapping().to).toList(),
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
  AttachmentEntity to(AttachmentCollection input) {
    return AttachmentEntity(file: AppFile(path: input.path ?? '', name: input.name ?? ''));
  }
}
