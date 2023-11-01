import 'package:open_items/state/application/providers.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/state/shared_preferences/shared_prefs.dart';
import 'package:open_items/utils/lang.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'selected_account.g.dart';

// TODO fix this class
@riverpod
class SelectedAccount extends _$SelectedAccount {
  late final SharedPreferences _prefs;

  String? _getState() {
    final accountLocalId = _prefs.getString(SPFields.selectedAccountIdField);
    if (accountLocalId.map((id) => database.getLocalAccount(id)) == null) {
      return database.getLocalAccounts().firstOrNull?.localId;
    }

    return accountLocalId;
  }

  @override
  FutureOr<String?> build() async {
    _prefs = await ref.watch(sharedPrefsProvider.future);
    return _getState();
  }

  Future<void> updateAccount(String accountId) async {
    await _prefs.setString(SPFields.selectedAccountIdField, accountId);
    state = AsyncValue.data(_getState());
  }
}
