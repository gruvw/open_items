import 'package:open_items/global/texts.dart';
import 'package:open_items/widgets/validation/core.dart';

ValidationResult validListTitle(String title) {
  if (title.isEmpty) {
    return InvalidResult(errorMessage: ValidationTexts.titleMissing);
  }

  return ValidResult();
}
