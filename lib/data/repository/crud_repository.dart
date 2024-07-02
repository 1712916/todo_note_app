import 'package:note_app/data/entity/note_entity.dart';

abstract class CrudRepository<T, Id> {
  Future<T> create(T item);
  Future<T> read(Id id);
  Future<T> update(T item);
  Future<bool> delete(T item);
}
