import 'package:fpdart/fpdart.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/state/shared_preferences/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_account.g.dart';

@riverpod
class SelectedAccountNotifier extends _$SelectedAccountNotifier {
  @override
  FutureOr<Option<Account>?> build() async {
    return ref.watch(sharedPrefsProvider).maybeWhen(
          data: (prefs) {
            final selectedAccountId =
                prefs.getString(SPFields.selectedAccountIdField);

            if (selectedAccountId == null) {
              return const None();
            }

            return database.getLocalAccount(selectedAccountId);
          },
          orElse: () => null,
        );
  }

  void set(Account account) {
    ref.watch(sharedPrefsProvider).whenData((prefs) {
      prefs.setString(SPFields.selectedAccountIdField, account.localId);
    });
  }
}
