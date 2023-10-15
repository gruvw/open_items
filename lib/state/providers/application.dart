import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/state/providers/database.dart';

final container = ProviderContainer();
final Database database = HiveDatabase();

final testingMessageShownProvider = StateProvider((ref) => false);
final offlineWelcomeMessageShownProvider = StateProvider((ref) => true);

final currentAccountProvider = StateProvider.autoDispose<Account>((ref) {
  final accounts = ref.read(accountsProvider);

  if (accounts.isEmpty) {
    ref.read(offlineWelcomeMessageShownProvider.notifier).state = false;
    return database.createOfflineAccount(name: ValuesTheme.offlineDefaultAccountName);
  }

  return accounts.first;
});
