import 'package:open_items/widgets/validation/core.dart';

ValidationResult validListTitle(String title) {
  if (title.isEmpty) {
    return InvalidResult(errorMessage: "List title is mandatory.");
  }
  return ValidResult();
}
