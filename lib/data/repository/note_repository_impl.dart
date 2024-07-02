import 'package:isar/isar.dart';
import 'package:note_app/data/collection/note_collection.dart';
import 'package:note_app/data/entity/collection_mapping.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/repository/crud_repository.dart';
import 'package:note_app/data/repository/note_repository.dart';

abstract class GetId<Id> {
  Id? get getId;
}

mixin IsarCrudRepository<T extends GetId<int>, C> on CrudRepository<T, int> {
  Isar get isar;

  IsarCollection<C> get _collection;

  C createNewItem(T item);

  C updateNewItem(T item);

  T getItemFromCollection(C collection);

  @override
  Future<T> create(T item) {
    final C nItem = createNewItem(item);

    return isar.writeTxn(() async {
      return _collection.put(nItem).then((id) => getItemFromCollection(nItem));
    });
  }

  @override
  Future<bool> delete(T item) {
    if (item.getId == null) {
      throw NotFoundException();
    }

    return isar.writeTxn(() async {
      return _collection.delete(item.getId!);
    });
  }

  @override
  Future<T> read(int id) {
    return isar.writeTxn(() async {
      return _collection.get(id).then((collection) {
        if (collection == null) {
          throw NotFoundException();
        }

        return getItemFromCollection(collection);
      });
    });
  }

  @override
  Future<T> update(T item) {
    if (item.getId == null) {
      throw UnimplementedError();
    }

    final nItem = updateNewItem(item);

    return isar.writeTxn(() async {
      return _collection.put(nItem).then((id) => getItemFromCollection(nItem));
    });
  }
}

class NoteGroupRepositoryImpl extends NoteGroupRepository
    with IsarCrudRepository<NoteGroupEntity, NoteGroupCollection> {
  final Isar _isar;

  NoteGroupRepositoryImpl({required Isar isar}) : _isar = isar;

  @override
  Isar get isar => _isar;

  @override
  IsarCollection<NoteGroupCollection> get _collection => isar.noteGroupCollections;

  @override
  NoteGroupCollection createNewItem(NoteGroupEntity item) {
    return NoteGroupCollection()
      ..name = item.name
      ..isDeleted = item.isDeleted
      ..updatedDateTime = DateTime.now();
  }

  @override
  NoteGroupEntity getItemFromCollection(NoteGroupCollection collection) {
    return NoteGroupCollectionToEntityMapping().to(collection);
  }

  @override
  NoteGroupCollection updateNewItem(NoteGroupEntity item) {
    return createNewItem(item)..id = item.id!;
  }
}

class NoteRepositoryImpl extends NoteRepository {
  @override
  Future<NoteEntity> create(NoteEntity item) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(NoteEntity item) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<NoteEntity> read(int id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<NoteEntity> update(NoteEntity item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
