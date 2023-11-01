import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'accounts.g.dart';

@riverpod
Stream<Event<DatabaseObject>> _localAccountsEvents(
    _LocalAccountsEventsRef ref) async* {
  yield* database.watchLocalAccounts();
}

@riverpod
List<Account> localAccounts(LocalAccountsRef ref) {
  ref.watch(_localAccountsEventsProvider);
  return database.getLocalAccounts();
}
