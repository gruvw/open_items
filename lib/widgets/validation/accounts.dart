import 'package:open_items/state/application/providers.dart';
import 'package:open_items/utils/compare.dart';
import 'package:open_items/widgets/validation/core.dart';

final _offlineNamePattern = RegExp(r"^\w*$");

class NewOfflineNameResult implements ValidationResult {
  @override
  final bool isValid;

  final String? nameError;

  NewOfflineNameResult(
    this.isValid, {
    this.nameError,
  });
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

  if (2 > name.length || name.length > 20) {
    return NewOfflineNameResult(
      false,
      nameError: "Account names must have between 2 and 20 characters.",
    );
  }

  if (!_offlineNamePattern.hasMatch(name)) {
    return NewOfflineNameResult(
      false,
      nameError:
          "Account names must only contain alphanumeric characters or underscores.",
    );
  }

  if (offlineNames.where((n) => relaxedTextEqual(name, n)).isNotEmpty) {
    return NewOfflineNameResult(
      false,
      nameError: "Account name already exists.",
    );
  }

  return NewOfflineNameResult(true);
}
