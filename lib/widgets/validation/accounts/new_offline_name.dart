import 'package:open_items/state/application/globals.dart';
import 'package:open_items/utils/compare.dart';
import 'package:open_items/widgets/validation/core.dart';

final _offlineNamePattern = RegExp(r"^\w*$");

ValidationResult validNewOfflineAccountName(String name, [String? excluded]) {
  final offlineNames = database
      .getLocalAccounts()
      .where((a) => a.isOffline && a.name != excluded)
      .map((oa) => oa.name);

  if (name.isEmpty) {
    return InvalidResult(errorMessage: "Account name is mandatory.");
  }

  if (2 > name.length || name.length > 20) {
    return InvalidResult(
        errorMessage: "Account names must have between 2 and 20 characters.");
  }

  if (!_offlineNamePattern.hasMatch(name)) {
    return InvalidResult(
        errorMessage:
            "Account names must only contain alphanumeric characters or underscores.");
  }

  if (offlineNames.where((n) => relaxedTextEqual(name, n)).isNotEmpty) {
    return InvalidResult(errorMessage: "Account name already exists.");
  }

  return ValidResult();
}

ValidationFunction<String> validOfflineAccountRename(String actualName) {
  return (String newName) => validNewOfflineAccountName(newName, actualName);
}
