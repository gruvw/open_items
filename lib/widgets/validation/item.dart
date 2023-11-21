import 'package:open_items/widgets/validation/core.dart';

ValidationResult validItemText(String text) {
  if (text.isEmpty) {
    return InvalidResult(errorMessage: "Item text is mandatory.");
  }

  return ValidResult();
}
