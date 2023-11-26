import 'package:open_items/state/application/globals.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/utils/lang.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_account_local_id.g.dart';

@riverpod
class SelectedAccountLocalId extends _$SelectedAccountLocalId {
  String? _getState() {
    final accountLocalId =
        prefs.getString(SPFields.selectedAccountLocalIdField);
    if (accountLocalId.map((id) => database.getLocalAccount(id)) == null) {
      return database.getLocalAccounts().firstOrNull?.localId;
    }

    return accountLocalId;
  }

  @override
  String? build() {
    return _getState();
  }

  Future<void> updateAccount(String accountLocalId) async {
    await prefs.setString(SPFields.selectedAccountLocalIdField, accountLocalId);
    state = _getState();
  }
}
