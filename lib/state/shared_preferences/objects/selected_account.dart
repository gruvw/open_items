import 'package:open_items/utils/lang.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/state/shared_preferences/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'selected_account.g.dart';

@riverpod
class SelectedAccountNotifier extends _$SelectedAccountNotifier {
  late final SharedPreferences _prefs;

  @override
  FutureOr<Account?> build() async {
    _prefs = await ref.watch(sharedPrefsProvider.future);
    final selectedAccountId = _prefs.getString(SPFields.selectedAccountIdField);
    return selectedAccountId.map((v) => database.getLocalAccount(v));
  }

  void updateAccount(Account account) {
    _prefs.setString(SPFields.selectedAccountIdField, account.localId);
  }
}
