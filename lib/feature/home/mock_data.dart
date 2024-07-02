import 'package:note_app/data/entity/note_entity.dart';

List<NoteGroupEntity> _mockGroupList = List.generate(
  10,
  (index) => NoteGroupEntity(id: index, name: 'group ${index}', updatedDateTime: DateTime.now()),
);

List<NoteGroupEntity> get mockGroupList => _mockGroupList;

void addGroup(NoteGroupEntity entity) {
  _mockGroupList.add(entity);
}

List<NoteEntity> _notes = List.generate(
  10,
  (index) => NoteEntity(
    id: index,
    groupId: _mockGroupList[index].id,
    description: 'description ${index}',
    isDone: false,
    isDeleted: false,
    date: DateTime.now(),
    updatedDateTime: DateTime.now(),
    attachments: null,
  ),
);
List<NoteEntity> get mockNotes => _notes;

void addNote(NoteEntity entity) {
  _notes.add(entity);
}

void updateNote(NoteEntity entity) {
  final index = _notes.indexWhere(
    (e) => e.id == entity.id,
  );

  if (index > -1) {
    _notes[index] = entity;
  }
}
