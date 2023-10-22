import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';

final _localAccountsEventsProvider =
    StreamProvider.autoDispose<Event<DatabaseObject>>((ref) async* {
  yield* database.watchLocalAccounts();
});

final localAccountsProvider = Provider.autoDispose<List<Account>>((ref) {
  ref.watch(_localAccountsEventsProvider);
  return database.getLocalAccounts();
});
