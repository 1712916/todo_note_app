import 'package:note_app/data/note_entity.dart';

abstract class CrudRepository<T, Id> {
  Future<T> create(T item);
  Future<T> read(Id id);
  Future<T> update(T item);
  Future<bool> delete(T item);
}

class NoteGroupRepository extends CrudRepository<NoteGroupEntity, int> {
  @override
  Future<NoteGroupEntity> create(NoteGroupEntity item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(NoteGroupEntity item) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<NoteGroupEntity> read(int id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<NoteGroupEntity> update(NoteGroupEntity item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
