import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.g.dart';

@riverpod
Stream<Event<DatabaseObject>> _localAccountEvents(
  _LocalAccountEventsRef ref, {
  required String accountId,
}) async* {
  yield* database.watchLocalAccounts().where((event) =>
      event.type != EventType.delete && event.object.localId == accountId);
}

@riverpod
Account? localAccount(
  LocalAccountRef ref, {
  required String accountId,
}) {
  ref.watch(_localAccountEventsProvider(accountId: accountId));
  return database.getLocalAccount(accountId);
}
