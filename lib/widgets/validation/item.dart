import 'package:open_items/global/texts.dart';
import 'package:open_items/widgets/validation/core.dart';

ValidationResult validItemText(String text) {
  if (text.isEmpty) {
    return InvalidResult(errorMessage: ValidationTexts.textMissing);
  }

  return ValidResult();
}
