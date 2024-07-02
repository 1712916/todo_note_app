import 'package:isar/isar.dart';
import 'package:note_app/data/collection/note_collection.dart';
import 'package:note_app/data/entity/collection_mapping.dart';
import 'package:note_app/data/entity/note_entity.dart';
import 'package:note_app/data/observer_data.dart';
import 'package:note_app/data/observer_data/note_observer_data.dart';
import 'package:rxdart/rxdart.dart';

class NoteGroupObserverDataIsarImpl extends NoteGroupObserverData {
  final Isar _isar = Isar.getInstance()!;

  @override
  void listener(Function(List<NoteGroupEntity> value) callback) {
    if (subscription == null) {
      setSubscription(
        _isar.noteGroupCollections
            .watchLazy(fireImmediately: true)
            .flatMap<List<NoteGroupEntity>>(
              (_) => Stream.fromFuture(
                _isar.noteGroupCollections
                    .where()
                    .findAll()
                    .then((collections) => ListNoteGroupMapping().to(collections)),
              ),
            )
            .listen(callback),
      );
    } else {
      //todo:
    }
  }
}
