import 'package:open_items/main.dart';
import 'package:open_items/state/application/provider.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/utils/lang.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_account_id.g.dart';

@riverpod
class SelectedAccountId extends _$SelectedAccountId {
  String? _getState() {
    final accountLocalId = prefs.getString(SPFields.selectedAccountIdField);
    if (accountLocalId.map((id) => database.getLocalAccount(id)) == null) {
      return database.getLocalAccounts().firstOrNull?.localId;
    }

    return accountLocalId;
  }

  @override
  String? build() {
    return _getState();
  }

  Future<void> updateAccount(String accountId) async {
    await prefs.setString(SPFields.selectedAccountIdField, accountId);
    state = _getState();
  }
}
