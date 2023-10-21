import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/validation/core.dart';

class NewOfflineNameResult implements ValidationResult {
  @override
  final bool isValid;

  final String? nameError;

  NewOfflineNameResult(this.isValid, {this.nameError});
}

NewOfflineNameResult validNewOfflineName(String name) {
  final offlineNames = database
      .getLocalAccounts()
      .where((a) => a.isOffline)
      .map((oa) => oa.name);

  if (name.isEmpty) {
    return NewOfflineNameResult(
      false,
      nameError: "Account name is mandatory.",
    );
  }

  if (name.length < 2) {
    return NewOfflineNameResult(
      false,
      nameError: "Account name must have at least 2 characters.",
    );
  }

  if (offlineNames.where((n) => name == n).isNotEmpty) {
    return NewOfflineNameResult(
      false,
      nameError: "Account name already exists.",
    );
  }

  return NewOfflineNameResult(true);
}
