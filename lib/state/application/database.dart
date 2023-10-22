import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';

final _accountsEventsProvider =
    StreamProvider.autoDispose<Event<DatabaseObject>>((ref) async* {
  yield* database.watchLocalAccounts();
});

final accountsProvider = Provider.autoDispose<List<Account>>((ref) {
  ref.watch(_accountsEventsProvider);
  return database.getLocalAccounts();
});
