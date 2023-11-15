import 'package:open_items/models/database.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@riverpod
Stream<Event<DatabaseObject>> objectEvents(
  ObjectEventsRef ref, {
  required String? localId,
}) async* {
  if (localId != null) {
    yield* database.watchObject(localId).where((event) =>
        event.type != EventType.delete && event.object.localId == localId);
  }
}
