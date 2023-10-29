import 'package:open_items/utils/lang.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/state/shared_preferences/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'selected_account.g.dart';

@riverpod
class SelectedAccount extends _$SelectedAccount {
  late final SharedPreferences _prefs;

  Account? getState() {
    final selectedAccountId = _prefs.getString(SPFields.selectedAccountIdField);
    return selectedAccountId.map((v) => database.getLocalAccount(v));
  }

  @override
  FutureOr<Account?> build() async {
    _prefs = await ref.watch(sharedPrefsProvider.future);
    return getState();
  }

  Future<void> updateAccount(Account? account) async {
    if (account == null) {
      await _prefs.remove(SPFields.selectedAccountIdField);
      state = const AsyncValue.data(null);

      return;
    }

    await _prefs.setString(SPFields.selectedAccountIdField, account.localId);
    state = AsyncValue.data(getState());
  }
}
